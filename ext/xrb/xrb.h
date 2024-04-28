
#pragma once

#include "ruby.h"
#include <ruby/encoding.h>

// Used to efficiently convert symbols to strings (e.g. tag attribute keys).
#ifndef HAVE_RB_SYM2STR
#define rb_sym2str(sym) rb_id2str(SYM2ID(sym))
#endif

// Consistent and meaningful append cstring to ruby string/buffer.
#ifndef HAVE_RB_STR_CAT_CSTR
#define rb_str_cat_cstr rb_str_cat2
#endif

// Prefer non-generic macro names where possible.
#ifndef RB_IMMEDIATE_P
#define RB_IMMEDIATE_P IMMEDIATE_P
#endif

// Modules and classes exposed by XRB.
extern VALUE
	rb_XRB,
	rb_XRB_Markup,
	rb_XRB_Tag,
	rb_XRB_MarkupString,
	rb_XRB_Native,
	rb_XRB_ParseError;

// Symbols used for delegate callbacks and general function calls.
extern ID
	id_cdata,
	id_open_tag_begin,
	id_open_tag_end,
	id_attribute,
	id_close_tag,
	id_text,
	id_doctype,
	id_comment,
	id_instruction,
	id_read,
	id_expression,
	id_key_get,
	id_new,
	id_name,
	id_integer,
	id_string,
	id_append,
	id_assign,
	id_pair,
	id_attributes,
	id_closed,
	id_to_s,
	id_is_a,
	id_concat;

// A convenient C string token class.
typedef struct {
	const char * begin;
	const char * end;
} XRB_Token;

// Convert a token to a Ruby string.
static inline VALUE XRB_Token_string(XRB_Token token, rb_encoding * encoding) {
	return rb_enc_str_new(token.begin, token.end - token.begin, encoding);
}

// Convert a C string to a Ruby string.
static inline VALUE XRB_string(const char * begin, const char * end, rb_encoding * encoding) {
	return rb_enc_str_new(begin, end - begin, encoding);
}

// Create an empty buffer for the given input string.
static inline VALUE XRB_buffer_for(VALUE string) {
	VALUE buffer = rb_enc_str_new(0, 0, rb_enc_get(string));
	
	rb_str_modify_expand(buffer, RSTRING_LEN(string) + 128);
	
	return buffer;
}

// Raise a parse error for the given input buffer at a specific offset.
NORETURN(void XRB_raise_error(const char * message, VALUE buffer, size_t offset));

// Append a string to a buffer. The buffer may or may not be initialized.
static inline void XRB_append(VALUE * buffer, rb_encoding * encoding, VALUE string) {
	if (*buffer == Qnil) {
		*buffer = rb_enc_str_new(0, 0, encoding);
	}
	
	rb_str_concat(*buffer, string);
}

// Append a token to a buffer. The buffer may or may not be initialized.
static inline void XRB_append_token(VALUE * buffer, rb_encoding * encoding, XRB_Token token) {
	if (*buffer == Qnil) {
		// Allocate a buffer exactly the right size:
		*buffer = rb_enc_str_new(token.begin, token.end - token.begin, encoding);
	} else {
		// Append the characters to the existing buffer:
		rb_str_buf_cat(*buffer, token.begin, token.end - token.begin);
	}
}

// Append a (unicode) codepoint to a buffer. The buffer may or may not be initialized.
static inline void XRB_append_codepoint(VALUE * buffer, rb_encoding * encoding, unsigned long codepoint) {
	if (*buffer == Qnil) {
		*buffer = rb_enc_str_new(0, 0, encoding);
	}
	
	rb_str_concat(*buffer, ULONG2NUM(codepoint));
}

// Convert the class of a string if there were no entities detected.
static inline VALUE XRB_markup_safe(VALUE string, unsigned has_entities) {
	if (!has_entities) {
		// Apparently should not use this to change klass, but it's exactly what we need here to make things lightning fast.
		rb_obj_reveal(string, rb_XRB_MarkupString);
	}
	
	return string;
}
