
#pragma once

#include "ruby.h"
#include <ruby/encoding.h>

extern VALUE rb_Trenni, rb_Trenni_Native, rb_Trenni_ParseError;

extern ID id_cdata, id_open_tag_begin, id_open_tag_end, id_attribute, id_close_tag, id_text, id_doctype, id_comment, id_instruction, id_read, id_expression;

typedef struct {
	const char * begin;
	const char * end;
} Token;

inline VALUE Trenni_token(Token token) {
	return rb_str_new(token.begin, token.end - token.begin);
}

inline VALUE Trenni_string(const char * begin, const char * end) {
	return rb_str_new(begin, end - begin);
}

void Trenni_raise_error(const char * message, VALUE buffer, size_t offset);

void Trenni_append_string(VALUE * buffer, rb_encoding * encoding, VALUE string);
void Trenni_append_token(VALUE * buffer, rb_encoding * encoding, Token token);
void Trenni_append_codepoint(VALUE * buffer, rb_encoding * encoding, unsigned long codepoint);
