
#include "escape.h"
#include "tag.h"

static int Trenni_Tag_append_tag_attribute(VALUE key, VALUE value, VALUE buffer) {
	// We skip over attributes with nil value:
	if (value == Qnil) return ST_CONTINUE;
	
	StringValue(value);
	
	rb_str_buf_cat2(buffer, " ");
	
	// Key can be either symbol or string:
	if (RB_SYMBOL_P(key)) {
		rb_str_append(buffer, rb_sym2str(key));
	} else {
		StringValue(key);
		rb_str_append(buffer, key);
	}
	
	if (value != Qtrue) {
		rb_str_buf_cat2(buffer, "=\"");
		Trenni_Markup_append_string(buffer, value);
		rb_str_buf_cat2(buffer, "\"");
	}
	
	return ST_CONTINUE;
}

static void Trenni_Tag_append_attributes(VALUE buffer, VALUE attributes) {
	int type = BUILTIN_TYPE(attributes);
	
	if (type == T_HASH) {
		rb_hash_foreach(attributes, &Trenni_Tag_append_tag_attribute, buffer);
	} else if (type == T_ARRAY) {
		long i;
		
		for (i = 0; i < RARRAY_LEN(attributes); i++) {
			VALUE attribute = RARRAY_AREF(attributes, i);
			VALUE key = RARRAY_AREF(attribute, 0);
			VALUE value = RARRAY_AREF(attribute, 1);
			
			Trenni_Tag_append_tag_attribute(key, value, buffer);
		}
	} else {
		rb_raise(rb_eArgError, "expected hash or array for attributes, got: %"PRIsVALUE, rb_inspect(attributes));
	}
}

VALUE Trenni_Tag_append_tag(VALUE self, VALUE buffer, VALUE name, VALUE attributes, VALUE content) {
	StringValue(name);
	
	rb_str_buf_cat2(buffer, "<");
	rb_str_buf_append(buffer, name);
	
	Trenni_Tag_append_attributes(buffer, attributes);
	
	if (content == Qnil || content == Qfalse) {
		rb_str_buf_cat2(buffer, "/>");
	} else {
		rb_str_buf_cat2(buffer, ">");
		
		if (content != Qtrue) {
			StringValue(content);
			rb_str_buf_append(buffer, content);
		}
		
		rb_str_buf_cat2(buffer, "</");
		rb_str_buf_append(buffer, name);
		rb_str_buf_cat2(buffer, ">");
	}
	
	return Qnil;
}

VALUE Trenni_Tag_format_tag(VALUE self, VALUE name, VALUE attributes, VALUE content) {
	rb_encoding *encoding = rb_enc_get(name);
	
	VALUE buffer = rb_enc_str_new("", 0, encoding);
	
	Trenni_Tag_append_tag(self, buffer, name, attributes, content);
	
	return buffer;
}

VALUE Trenni_Tag_write_opening_tag(VALUE self, VALUE buffer) {
	VALUE name = rb_struct_getmember(self, id_name);
	VALUE attributes = rb_struct_getmember(self, id_attributes);
	VALUE closed = rb_struct_getmember(self, id_closed);

	StringValue(name);
	
	rb_str_buf_cat2(buffer, "<");
	rb_str_buf_append(buffer, name);
	
	Trenni_Tag_append_attributes(buffer, attributes);
	
	if (closed == Qtrue) {
		rb_str_buf_cat2(buffer, "/>");
	} else {
		rb_str_buf_cat2(buffer, ">");
	}
	
	return Qnil;
}

VALUE Trenni_Tag_write_closing_tag(VALUE self, VALUE buffer) {
	VALUE name = rb_struct_getmember(self, id_name);
	
	StringValue(name);
	
	rb_str_buf_cat2(buffer, "</");
	rb_str_buf_append(buffer, name);
	rb_str_buf_cat2(buffer, ">");
	
	return Qnil;
}

