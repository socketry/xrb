
#include "escape.h"

// => [["<", 60, "3c"], [">", 62, "3e"], ["\"", 34, "22"], ["&", 38, "26"]] 
static const uint32_t MASK = 0x3e3e3e3e;

static const uint32_t MASK_LT = 0x3c3c3c3c;
static const uint32_t MASK_GT = 0x3e3e3e3e;
static const uint32_t MASK_QUOT = 0x22222222;
static const uint32_t MASK_AMP = 0x26262626;

inline const char * index_symbol(const char * begin, const char * end) {
	const char * p = begin;

	while (p < end) {
		// if ((end - p) >= 4) {
		// 	// Do the next 4 characters contain anything we are interested in?
		// 	if ((*(const uint32_t *)p) & MASK_LT) {
		// 		p += 4;
		// 		
		// 		continue;
		// 	}
		// }
		
		switch (*p) {
			case '<':
			case '>':
			case '"':
			case '&':
				return p;
		}

		p += 1;
	}

	return end;
}

inline void append_entity(const char * p, VALUE buffer) {
	// What symbol are we looking at?
	switch (*p) {
		case '<':
			rb_str_cat_cstr(buffer, "&lt;");
			break;
		case '>':
			rb_str_cat_cstr(buffer, "&gt;");
			break;
		case '"':
			rb_str_cat_cstr(buffer, "&quot;");
			break;
		case '&':
			rb_str_cat_cstr(buffer, "&amp;");
			break;
	}
}

VALUE Trenni_Markup_append_string(VALUE buffer, VALUE string) {
	const char * begin = RSTRING_PTR(string);
	const char * end = begin + RSTRING_LEN(string);
	
	const char * s = begin;

	// There are two outcomes, either p is at end, or p points to a symbol:
	const char * p = index_symbol(s, end);
	
	while (1) {
		// Append the non-symbol part:
		rb_str_buf_cat(buffer, s, p - s);

		// We escape early if there were no changes to be made:
		if (p == end) return buffer;
		
		append_entity(p, buffer);
		
		s = p + 1;
		p = index_symbol(s, end);
	}
}

VALUE Trenni_Markup_escape_string(VALUE self, VALUE string) {
	const char * begin = RSTRING_PTR(string);
	const char * end = begin + RSTRING_LEN(string);
	
	const char * s = begin;

	// There are two outcomes, either p is at end, or p points to a symbol:
	const char * p = index_symbol(s, end);

	// We escape early if there were no changes to be made:
	if (p == end) return string;
	
	// We need to copy the input and escape the symbols:
	rb_encoding *encoding = rb_enc_get(string);
	VALUE buffer = rb_enc_str_new(0, 0, encoding);
	
	while (1) {
		// Append the non-symbol part:
		rb_str_buf_cat(buffer, s, p - s);

		// We escape early if there were no changes to be made:
		if (p == end) return buffer;

		append_entity(p, buffer);

		s = p + 1;
		p = index_symbol(s, end);
	}
}
