
#include "tag.h"

static int Trenni_Native_append_tag_attributes(VALUE key, VALUE value, VALUE buffer) {
	StringValue(value);
	
	rb_str_buf_cat2(buffer, " ");
	
	// Key can be either symbol or string:
	if (SYMBOL_P(key)) {
		rb_str_append(buffer, rb_sym2str(key));
	} else {
		rb_str_append(buffer, key);
	}
	
	rb_str_buf_cat2(buffer, "=\"");
	rb_str_append(buffer, value);
	rb_str_buf_cat2(buffer, "\"");
	
	return ST_CONTINUE;
}

VALUE Trenni_Native_append_tag(VALUE self, VALUE buffer, VALUE name, VALUE attributes, VALUE content) {
	StringValue(name);
	
	rb_str_buf_cat2(buffer, "<");
	rb_str_buf_append(buffer, name);
	
	if (attributes != Qnil) {
		rb_hash_foreach(attributes, &Trenni_Native_append_tag_attributes, buffer);
	}
	
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

VALUE Trenni_Native_format_tag(VALUE self, VALUE name, VALUE attributes, VALUE content) {
	rb_encoding *encoding = rb_enc_get(name);
	
	VALUE buffer = rb_enc_str_new("", 0, encoding);
	
	Trenni_Native_append_tag(self, buffer, name, attributes, content);
	
	return buffer;
}

VALUE Trenni_Tag_write_opening_tag(VALUE self, VALUE buffer) {
	VALUE name = rb_struct_getmember(self, id_name);
	VALUE attributes = rb_struct_getmember(self, id_attributes);
	VALUE closed = rb_struct_getmember(self, id_closed);

	StringValue(name);
	
	rb_str_buf_cat2(buffer, "<");
	rb_str_buf_append(buffer, name);
	
	if (attributes != Qnil) {
		rb_hash_foreach(attributes, &Trenni_Native_append_tag_attributes, buffer);
	}
	
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

