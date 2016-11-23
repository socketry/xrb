
#include "trenni.h"

#include "markup.h"
#include "template.h"

VALUE rb_Trenni = Qnil, rb_Trenni_Native = Qnil, rb_Trenni_ParseError = Qnil;
ID id_cdata, id_open_tag_begin, id_open_tag_end, id_attribute, id_close_tag, id_text, id_doctype, id_comment, id_instruction, id_read;

void Trenni_raise_error(const char * message, VALUE buffer, size_t offset) {
	VALUE exception = rb_funcall(rb_Trenni_ParseError, rb_intern("new"), 3, rb_str_new_cstr(message), buffer, UINT2NUM(offset));
	
	rb_exc_raise(exception);
}

void Trenni_append_string(VALUE * buffer, rb_encoding * encoding, VALUE string) {
	if (*buffer == Qnil) {
		*buffer = rb_enc_str_new("", 0, encoding);
	}
	
	rb_str_concat(*buffer, string);
}

void Trenni_append_token(VALUE * buffer, rb_encoding * encoding, Token token) {
	if (*buffer == Qnil) {
		// Allocate a buffer exactly the right size:
		*buffer = rb_enc_str_new(token.begin, token.end - token.begin, encoding);
	} else {
		// Append the characters to the existing buffer:
		rb_str_buf_cat(*buffer, token.begin, token.end - token.begin);
	}
}

void Trenni_append_codepoint(VALUE * buffer, rb_encoding * encoding, unsigned long codepoint) {
	if (*buffer == Qnil) {
		*buffer = rb_enc_str_new("", 0, encoding);
	}
	
	rb_str_concat(*buffer, ULONG2NUM(codepoint));
}

void Init_trenni() {
	id_open_tag_begin = rb_intern("open_tag_begin");
	id_open_tag_end = rb_intern("open_tag_end");
	id_close_tag = rb_intern("close_tag");

	id_cdata = rb_intern("cdata");
	id_attribute = rb_intern("attribute");
	id_comment = rb_intern("comment");
	id_text = rb_intern("text");
	id_doctype = rb_intern("doctype");
	id_instruction = rb_intern("instruction");
	
	id_read = rb_intern("read");
	
	rb_Trenni = rb_define_module("Trenni");
	rb_Trenni_Native = rb_define_module_under(rb_Trenni, "Native");
	
	rb_Trenni_ParseError = rb_const_get_at(rb_Trenni, rb_intern("ParseError"));
	
	rb_define_module_function(rb_Trenni_Native, "parse_markup", Trenni_Native_parse_markup, 3);
	rb_define_module_function(rb_Trenni_Native, "parse_template", Trenni_Native_parse_template, 2);
}
