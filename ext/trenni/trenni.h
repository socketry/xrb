
#pragma once

#include "ruby.h"
#include <ruby/encoding.h>

extern VALUE rb_Trenni, rb_Trenni_Markup, rb_Trenni_Tag, rb_Trenni_RawString, rb_Trenni_RawString_EMPTY, rb_Trenni_Native, rb_Trenni_ParseError;

extern ID id_cdata, id_open_tag_begin, id_open_tag_end, id_attribute, id_close_tag, id_text, id_doctype, id_comment, id_instruction, id_read, id_expression, id_key_get, id_new, id_name, id_attributes, id_closed;

typedef struct {
	const char * begin;
	const char * end;
} Token;

static inline VALUE Trenni_token(Token token, rb_encoding * encoding) {
	return rb_enc_str_new(token.begin, token.end - token.begin, encoding);
}

static inline VALUE Trenni_string(const char * begin, const char * end, rb_encoding * encoding) {
	return rb_enc_str_new(begin, end - begin, encoding);
}

void Trenni_raise_error(const char * message, VALUE buffer, size_t offset);

static inline void Trenni_append_string(VALUE * buffer, rb_encoding * encoding, VALUE string) {
	if (*buffer == Qnil) {
		*buffer = rb_enc_str_new("", 0, encoding);
	}
	
	rb_str_concat(*buffer, string);
}

static inline void Trenni_append_token(VALUE * buffer, rb_encoding * encoding, Token token) {
	// printf("append_token(%ul bytes)\n", token.end - token.begin);
	
	if (*buffer == Qnil) {
		// Allocate a buffer exactly the right size:
		*buffer = rb_enc_str_new(token.begin, token.end - token.begin, encoding);
	} else {
		// Append the characters to the existing buffer:
		rb_str_buf_cat(*buffer, token.begin, token.end - token.begin);
	}
}

static inline void Trenni_append_codepoint(VALUE * buffer, rb_encoding * encoding, unsigned long codepoint) {
	if (*buffer == Qnil) {
		*buffer = rb_enc_str_new("", 0, encoding);
	}
	
	rb_str_concat(*buffer, ULONG2NUM(codepoint));
}

static inline VALUE Trenni_markup_safe(VALUE string, unsigned has_entities) {
	if (!has_entities) {
		// Apparently should not use this to change klass, but it's exactly what we need here to make things lightning fast.
		rb_obj_reveal(string, rb_Trenni_RawString);
	}
	
	return string;
}
