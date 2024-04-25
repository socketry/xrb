
#include "escape.h"
#include <assert.h>

inline static int Trenni_Markup_is_markup(VALUE value) {
	if (RB_IMMEDIATE_P(value))
		return 0;
	
	// This is a short-cut:
	if (rb_class_of(value) == rb_Trenni_MarkupString) {
		return 1;
	}
	
	return rb_funcall(value, id_is_a, 1, rb_Trenni_Markup) == Qtrue;
}

VALUE Trenni_MarkupString_raw(VALUE self, VALUE string) {
	string = rb_str_dup(string);
	
	rb_obj_reveal(string, rb_Trenni_MarkupString);
	
	return string;
}

// => [["<", 60, "3c"], [">", 62, "3e"], ["\"", 34, "22"], ["&", 38, "26"]] 
// static const uint32_t MASK = 0x3e3e3e3e;
// 
// static const uint32_t MASK_LT = 0x3c3c3c3c;
// static const uint32_t MASK_GT = 0x3e3e3e3e;
// static const uint32_t MASK_QUOT = 0x22222222;
// static const uint32_t MASK_AMP = 0x26262626;

static inline const char * Trenni_Markup_index_symbol(const char * begin, const char * end) {
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

static inline void Trenni_Markup_append_entity(const char * p, VALUE buffer) {
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

static inline VALUE Trenni_Markup_append_buffer(VALUE buffer, const char * s, const char * p, const char * end) {
	while (1) {
		// Append the non-symbol part:
		rb_str_buf_cat(buffer, s, p - s);

		// We escape early if there were no changes to be made:
		if (p == end) return buffer;

		Trenni_Markup_append_entity(p, buffer);

		s = p + 1;
		p = Trenni_Markup_index_symbol(s, end);
	}
}

// Escape and append a string to the output buffer.
VALUE Trenni_Markup_append_string(VALUE buffer, VALUE string) {
	const char * begin = RSTRING_PTR(string);
	const char * end = begin + RSTRING_LEN(string);
	
	const char * s = begin;

	// There are two outcomes, either p is at end, or p points to a symbol:
	const char * p = Trenni_Markup_index_symbol(s, end);
	
	return Trenni_Markup_append_buffer(buffer, s, p, end);
}

VALUE Trenni_Markup_append(VALUE self, VALUE buffer, VALUE value) {
	if (value == Qnil) return Qnil;
	
	if (Trenni_Markup_is_markup(value)) {
		rb_str_append(buffer, value);
	} else {
		if (rb_type(value) != T_STRING) {
			value = rb_funcall(value, id_to_s, 0);
		}
		
		Trenni_Markup_append_string(buffer, value);
	}
	
	return buffer;
}

// Convert markup special characters to entities. May return the original string if no changes were made.
VALUE Trenni_Markup_escape_string(VALUE self, VALUE string) {
	const char * begin = RSTRING_PTR(string);
	const char * end = begin + RSTRING_LEN(string);
	
	const char * s = begin;

	// There are two outcomes, either p is at end, or p points to a symbol:
	const char * p = Trenni_Markup_index_symbol(s, end);

	// We escape early if there were no changes to be made:
	if (p == end) return string;
	
	return Trenni_Markup_append_buffer(Trenni_buffer_for(string), s, p, end);
}

void Init_trenni_escape() {
	rb_Trenni_MarkupString = rb_define_class_under(rb_Trenni, "MarkupString", rb_cString);
	rb_gc_register_mark_object(rb_Trenni_MarkupString);
	
	rb_include_module(rb_Trenni_MarkupString, rb_Trenni_Markup);
	
	rb_undef_method(rb_class_of(rb_Trenni_Markup), "escape_string");
	rb_define_singleton_method(rb_Trenni_Markup, "escape_string", Trenni_Markup_escape_string, 1);
	
	rb_undef_method(rb_class_of(rb_Trenni_Markup), "append");
	rb_define_singleton_method(rb_Trenni_Markup, "append", Trenni_Markup_append, 2);
	
	rb_undef_method(rb_class_of(rb_Trenni_Markup), "raw");
	rb_define_singleton_method(rb_Trenni_Markup, "raw", Trenni_MarkupString_raw, 1);
}
