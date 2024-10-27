
#include "escape.h"
#include "tag.h"

VALUE XRB_Tag_split(VALUE self, VALUE qualified_name) {
	const char * begin = RSTRING_PTR(qualified_name);
	const char * end = RSTRING_END(qualified_name);
	
	const char * p = begin;
	
	while (p != end) {
		if (*p == ':') {
			return rb_ary_new_from_args(2,
				rb_enc_str_new(begin, p-begin, rb_enc_get(qualified_name)),
				rb_enc_str_new(p+1, end-p-1, rb_enc_get(qualified_name))
			);
		}
		
		p += 1;
	}
	
	return rb_ary_new_from_args(2, Qnil, qualified_name);
}

inline static int XRB_Tag_valid_attributes(VALUE value) {
	return (rb_type(value) == T_HASH) || (rb_type(value) == T_ARRAY);
}

// Key can be either symbol or string. This method efficiently converts either to a string.
inline static VALUE XRB_Tag_key_string(VALUE key) {
	if (SYMBOL_P(key)) {
		return rb_sym2str(key);
	}
	
	StringValue(key);
	return key;
}

inline static VALUE XRB_Tag_prefix_key(VALUE prefix, VALUE key) {
	VALUE buffer;
	
	if (prefix == Qnil) {
		return XRB_Tag_key_string(key);
	}
	
	buffer = rb_str_dup(XRB_Tag_key_string(prefix));
	rb_str_cat_cstr(buffer, "-");
	rb_str_append(buffer, XRB_Tag_key_string(key));
	
	return buffer;
}

VALUE XRB_Tag_append_attributes_string(VALUE self, VALUE buffer, VALUE attributes, VALUE prefix);

static void XRB_Tag_append_tag_attribute(VALUE buffer, VALUE key, VALUE value, VALUE prefix) {
	// We skip over attributes with nil value:
	if (value == Qnil || value == Qfalse) return;
	
	// Modify key to contain the prefix:
	key = XRB_Tag_prefix_key(prefix, key);
	
	if (XRB_Tag_valid_attributes(value)) {
		XRB_Tag_append_attributes_string(Qnil, buffer, value, key);
	} else {
		rb_str_cat_cstr(buffer, " ");
		rb_str_append(buffer, key);
		
		if (value != Qtrue) {
			rb_str_cat_cstr(buffer, "=\"");
			XRB_Markup_append_markup(value, buffer);
			rb_str_cat_cstr(buffer, "\"");
		}
	}
}

struct XRB_Tag_Append_Tag_Attribute_Argument {
	VALUE buffer;
	VALUE prefix;
};

static int XRB_Tag_append_tag_attribute_foreach(VALUE key, VALUE value, VALUE _argument) {
	struct XRB_Tag_Append_Tag_Attribute_Argument * argument = (struct XRB_Tag_Append_Tag_Attribute_Argument *)_argument;
	
	XRB_Tag_append_tag_attribute(argument->buffer, key, value, argument->prefix);
	
	return ST_CONTINUE;
}

VALUE XRB_Tag_append_attributes_string(VALUE self, VALUE buffer, VALUE attributes, VALUE prefix) {
	int type = rb_type(attributes);
	
	if (type == T_HASH) {
		struct XRB_Tag_Append_Tag_Attribute_Argument argument = {buffer, prefix};
		rb_hash_foreach(attributes, &XRB_Tag_append_tag_attribute_foreach, (VALUE)&argument);
	} else if (type == T_ARRAY) {
		long i;
		
		for (i = 0; i < RARRAY_LEN(attributes); i++) {
			VALUE attribute = RARRAY_AREF(attributes, i);
			
			if (rb_type(attribute) != T_ARRAY || RARRAY_LEN(attribute) != 2) {
				rb_raise(rb_eTypeError, "expected array for attribute key/value pair");
			}
			
			VALUE key = RARRAY_AREF(attribute, 0);
			VALUE value = RARRAY_AREF(attribute, 1);
			
			XRB_Tag_append_tag_attribute(buffer, key, value, prefix);
		}
	} else {
		rb_raise(rb_eTypeError, "expected hash or array for attributes");
	}
	
	return Qnil;
}

static size_t XRB_Tag_estimate_attributes_size(VALUE attributes, VALUE prefix) {
	if (attributes == Qnil) return 0;
	
	int type = rb_type(attributes);
	
	if (type == T_HASH) {
		return rb_hash_size(attributes) * 32;
	} else if (type == T_ARRAY) {
		return RARRAY_LEN(attributes) * 32;
	}
	
	return 0;
}

VALUE XRB_Tag_append_attributes(VALUE self, VALUE output, VALUE attributes, VALUE prefix) {
	size_t estimated_size = XRB_Tag_estimate_attributes_size(attributes, prefix);
	
	// If there are no attributes, we return early:
	if (estimated_size == 0) return Qnil;
	
	if (rb_type(output) == T_STRING) {
		rb_str_modify_expand(output, estimated_size);
		XRB_Tag_append_attributes_string(self, output, attributes, prefix);
	} else {
		VALUE buffer = rb_str_buf_new(estimated_size);
		XRB_Tag_append_attributes_string(self, buffer, attributes, prefix);
		rb_funcall(output, id_concat, 1, buffer);
	}
	
	return Qnil;
}

VALUE XRB_Tag_append_tag_string(VALUE self, VALUE buffer, VALUE name, VALUE attributes, VALUE content) {
	StringValue(name);
	
	rb_str_cat_cstr(buffer, "<");
	rb_str_buf_append(buffer, name);
	
	XRB_Tag_append_attributes_string(self, buffer, attributes, Qnil);
	
	if (content == Qnil || content == Qfalse) {
		rb_str_cat_cstr(buffer, "/>");
	} else {
		rb_str_cat_cstr(buffer, ">");
		
		if (content != Qtrue) {
			XRB_Markup_append_markup(content, buffer);
		}
		
		rb_str_cat_cstr(buffer, "</");
		rb_str_buf_append(buffer, name);
		rb_str_cat_cstr(buffer, ">");
	}
	
	return Qnil;
}

static size_t XRB_Tag_estimate_size(VALUE name, VALUE attributes, VALUE content) {
	size_t estimated_size = (RSTRING_LEN(name) * 2) + XRB_Tag_estimate_attributes_size(attributes, Qnil) + 5;
	
	if (rb_type(content) == T_STRING) {
		estimated_size += RSTRING_LEN(content);
	}
	
	return estimated_size;
}

VALUE XRB_Tag_append_tag(VALUE self, VALUE output, VALUE name, VALUE attributes, VALUE content) {
	size_t estimated_size = XRB_Tag_estimate_size(name, attributes, content);
	
	if (rb_type(output) == T_STRING) {
		rb_str_modify_expand(output, estimated_size);
		XRB_Tag_append_tag_string(self, output, name, attributes, content);
	} else {
		VALUE buffer = rb_str_buf_new(estimated_size);
		XRB_Tag_append_tag_string(self, buffer, name, attributes, content);
		rb_funcall(output, id_concat, 1, buffer);
	}
	
	return Qnil;
}

VALUE XRB_Tag_format_tag(VALUE self, VALUE name, VALUE attributes, VALUE content) {
	size_t estimated_size = XRB_Tag_estimate_size(name, attributes, content);
	
	VALUE buffer = rb_str_buf_new(estimated_size);
	
	XRB_Tag_append_tag_string(self, buffer, name, attributes, content);
	
	return buffer;
}

VALUE XRB_Tag_write_opening_tag_string(VALUE self, VALUE buffer, VALUE name, VALUE attributes, VALUE closed) {
	rb_str_cat_cstr(buffer, "<");
	rb_str_buf_append(buffer, name);
	
	XRB_Tag_append_attributes_string(self, buffer, attributes, Qnil);
	
	if (closed == Qtrue) {
		rb_str_cat_cstr(buffer, "/>");
	} else {
		rb_str_cat_cstr(buffer, ">");
	}
	
	return Qnil;
}

VALUE XRB_Tag_write_opening_tag(VALUE self, VALUE output) {
	VALUE name = rb_struct_getmember(self, id_name);
	StringValue(name);
	
	VALUE attributes = rb_struct_getmember(self, id_attributes);
	VALUE closed = rb_struct_getmember(self, id_closed);
	
	// The size of the tag name + attributes + at most 3 characters for the closing tag symbols.
	size_t estimated_size = RSTRING_LEN(name) + XRB_Tag_estimate_attributes_size(attributes, Qnil) + 3;
	
	if (rb_type(output) == T_STRING) {
		rb_str_modify_expand(output, estimated_size);
		XRB_Tag_write_opening_tag_string(self, output, name, attributes, closed);
	} else {
		VALUE buffer = rb_str_buf_new(estimated_size);
		XRB_Tag_write_opening_tag_string(self, buffer, name, attributes, closed);
		rb_funcall(output, id_concat, 1, buffer);
	}
	
	return Qnil;
}

VALUE XRB_Tag_write_closing_tag_string(VALUE self, VALUE buffer, VALUE name) {
	rb_str_cat_cstr(buffer, "</");
	rb_str_buf_append(buffer, name);
	rb_str_cat_cstr(buffer, ">");
	
	return buffer;
}

VALUE XRB_Tag_write_closing_tag(VALUE self, VALUE output) {
	VALUE name = rb_struct_getmember(self, id_name);
	StringValue(name);
	
	// The size of the tag name + 3 characters for the closing tag symbols.
	size_t estimated_size = RSTRING_LEN(name) + 3;
	
	if (rb_type(output) == T_STRING) {
		rb_str_modify_expand(output, estimated_size);
		XRB_Tag_write_closing_tag_string(self, output, name);
	} else {
		VALUE buffer = rb_str_buf_new(estimated_size);
		XRB_Tag_write_closing_tag_string(self, buffer, name);
		rb_funcall(output, id_concat, 1, buffer);
	}
	
	return Qnil;
}

void Init_XRB_Tag(void) {
	rb_undef_method(rb_class_of(rb_XRB_Tag), "append_attributes");
	rb_define_singleton_method(rb_XRB_Tag, "append_attributes", XRB_Tag_append_attributes, 3);
	
	rb_undef_method(rb_class_of(rb_XRB_Tag), "append_tag");
	rb_define_singleton_method(rb_XRB_Tag, "append_tag", XRB_Tag_append_tag, 4);
	
	rb_undef_method(rb_class_of(rb_XRB_Tag), "format_tag");
	rb_define_singleton_method(rb_XRB_Tag, "format_tag", XRB_Tag_format_tag, 3);
	
	rb_undef_method(rb_class_of(rb_XRB_Tag), "split");
	rb_define_singleton_method(rb_XRB_Tag, "split", XRB_Tag_split, 1);
	
	rb_undef_method(rb_XRB_Tag, "write_opening_tag");
	rb_define_method(rb_XRB_Tag, "write_opening_tag", XRB_Tag_write_opening_tag, 1);
	
	rb_undef_method(rb_XRB_Tag, "write_closing_tag");
	rb_define_method(rb_XRB_Tag, "write_closing_tag", XRB_Tag_write_closing_tag, 1);
}

