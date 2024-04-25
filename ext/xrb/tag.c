
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

VALUE XRB_Tag_append_attributes(VALUE self, VALUE buffer, VALUE attributes, VALUE prefix);

static void XRB_Tag_append_tag_attribute(VALUE buffer, VALUE key, VALUE value, VALUE prefix) {
	// We skip over attributes with nil value:
	if (value == Qnil || value == Qfalse) return;
	
	// Modify key to contain the prefix:
	key = XRB_Tag_prefix_key(prefix, key);
	
	if (XRB_Tag_valid_attributes(value)) {
		XRB_Tag_append_attributes(Qnil, buffer, value, key);
	} else {
		rb_str_cat_cstr(buffer, " ");
		rb_str_append(buffer, key);
		
		if (value != Qtrue) {
			rb_str_cat_cstr(buffer, "=\"");
			XRB_Markup_append(Qnil, buffer, value);
			rb_str_cat_cstr(buffer, "\"");
		}
	}
}

typedef struct {
	VALUE buffer;
	VALUE prefix;
} XRB_Tag_Accumulation;

static int XRB_Tag_append_tag_attribute_foreach(VALUE key, VALUE value, VALUE _argument) {
	XRB_Tag_Accumulation * argument = (XRB_Tag_Accumulation *)_argument;
	
	XRB_Tag_append_tag_attribute(argument->buffer, key, value, argument->prefix);
	
	return ST_CONTINUE;
}

VALUE XRB_Tag_append_attributes(VALUE self, VALUE buffer, VALUE attributes, VALUE prefix) {
	int type = rb_type(attributes);
	
	if (type == T_HASH) {
		XRB_Tag_Accumulation argument = {buffer, prefix};
		rb_hash_foreach(attributes, &XRB_Tag_append_tag_attribute_foreach, (VALUE)&argument);
	} else if (type == T_ARRAY) {
		long i;
		
		for (i = 0; i < RARRAY_LEN(attributes); i++) {
			VALUE attribute = RARRAY_AREF(attributes, i);
			VALUE key = RARRAY_AREF(attribute, 0);
			VALUE value = RARRAY_AREF(attribute, 1);
			
			XRB_Tag_append_tag_attribute(buffer, key, value, prefix);
		}
	} else {
		rb_raise(rb_eArgError, "expected hash or array for attributes");
	}
	
	return Qnil;
}

VALUE XRB_Tag_append_tag(VALUE self, VALUE buffer, VALUE name, VALUE attributes, VALUE content) {
	StringValue(name);
	
	rb_str_cat_cstr(buffer, "<");
	rb_str_buf_append(buffer, name);
	
	XRB_Tag_append_attributes(self, buffer, attributes, Qnil);
	
	if (content == Qnil || content == Qfalse) {
		rb_str_cat_cstr(buffer, "/>");
	} else {
		rb_str_cat_cstr(buffer, ">");
		
		if (content != Qtrue) {
			XRB_Markup_append(self, buffer, content);
		}
		
		rb_str_cat_cstr(buffer, "</");
		rb_str_buf_append(buffer, name);
		rb_str_cat_cstr(buffer, ">");
	}
	
	return Qnil;
}

VALUE XRB_Tag_format_tag(VALUE self, VALUE name, VALUE attributes, VALUE content) {
	rb_encoding *encoding = rb_enc_get(name);
	
	VALUE buffer = rb_enc_str_new(0, 0, encoding);
	rb_str_reserve(buffer, 256);
	
	XRB_Tag_append_tag(self, buffer, name, attributes, content);
	
	return buffer;
}

VALUE XRB_Tag_write_opening_tag(VALUE self, VALUE buffer) {
	VALUE name = rb_struct_getmember(self, id_name);
	VALUE attributes = rb_struct_getmember(self, id_attributes);
	VALUE closed = rb_struct_getmember(self, id_closed);

	StringValue(name);
	
	rb_str_reserve(buffer, RSTRING_LEN(name) + 256);
	
	rb_str_cat_cstr(buffer, "<");
	rb_str_buf_append(buffer, name);
	
	XRB_Tag_append_attributes(self, buffer, attributes, Qnil);
	
	if (closed == Qtrue) {
		rb_str_cat_cstr(buffer, "/>");
	} else {
		rb_str_cat_cstr(buffer, ">");
	}
	
	return Qnil;
}

VALUE XRB_Tag_write_closing_tag(VALUE self, VALUE buffer) {
	VALUE name = rb_struct_getmember(self, id_name);
	
	StringValue(name);
	
	rb_str_reserve(buffer, RSTRING_LEN(name) + 3);
	
	rb_str_cat_cstr(buffer, "</");
	rb_str_buf_append(buffer, name);
	rb_str_cat_cstr(buffer, ">");
	
	return Qnil;
}

void Init_xrb_tag() {
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

