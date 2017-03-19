
#include "escape.h"

VALUE Trenni_Markup_escape(VALUE self, VALUE value) {
	switch (rb_type(value)) {
		case RUBY_T_OBJECT:
			if (rb_obj_is_kind_of(value, rb_Trenni_Markup)) return value;
		
			value = rb_obj_as_string(value);
			value = Trenni_Markup_escape_string(self, value);
			rb_obj_reveal(value, rb_Trenni_MarkupString);
			return value;
		
		case RUBY_T_STRING:
			if (rb_obj_is_kind_of(value, rb_Trenni_Markup)) return value;
			
			value = rb_str_dup(value);
			value = Trenni_Markup_escape_string(self, value);
			rb_obj_reveal(value, rb_Trenni_MarkupString);
			return value;
		
		case RUBY_T_FALSE:
		case RUBY_T_NIL:
			return rb_Trenni_MarkupString_EMPTY;
	}
	
	return Qnil;
}

// => [["<", 60, "3c"], [">", 62, "3e"], ["\"", 34, "22"], ["&", 38, "26"]] 
// static const uint32_t MASK = 0x3e3e3e3e;
// 
// static const uint32_t MASK_LT = 0x3c3c3c3c;
// static const uint32_t MASK_GT = 0x3e3e3e3e;
// static const uint32_t MASK_QUOT = 0x22222222;
// static const uint32_t MASK_AMP = 0x26262626;

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

inline VALUE Trenni_Markup_append_buffer(VALUE buffer, const char * s, const char * p, const char * end) {
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

VALUE Trenni_Markup_append_string(VALUE buffer, VALUE string) {
	const char * begin = RSTRING_PTR(string);
	const char * end = begin + RSTRING_LEN(string);
	
	const char * s = begin;

	// There are two outcomes, either p is at end, or p points to a symbol:
	const char * p = index_symbol(s, end);
	
	return Trenni_Markup_append_buffer(buffer, s, p, end);
}

VALUE Trenni_Markup_escape_string(VALUE self, VALUE string) {
	const char * begin = RSTRING_PTR(string);
	const char * end = begin + RSTRING_LEN(string);
	
	const char * s = begin;

	// There are two outcomes, either p is at end, or p points to a symbol:
	const char * p = index_symbol(s, end);

	// We escape early if there were no changes to be made:
	if (p == end) return string;
	
	return Trenni_Markup_append_buffer(Trenni_buffer_for(string), s, p, end);
}

void Init_trenni_escape() {
	rb_Trenni_MarkupString = rb_define_class_under(rb_Trenni, "MarkupString", rb_cString);
	rb_include_module(rb_Trenni_MarkupString, rb_Trenni_Markup);
	
	rb_Trenni_MarkupString_EMPTY = rb_str_new(0, 0);
	rb_obj_reveal(rb_Trenni_MarkupString_EMPTY, rb_Trenni_MarkupString);
	rb_const_remove(rb_Trenni_Markup, rb_intern("EMPTY"));
	rb_const_set(rb_Trenni_Markup, rb_intern("EMPTY"), rb_Trenni_MarkupString_EMPTY);
	
	rb_undef_method(rb_class_of(rb_Trenni_Markup), "escape_string");
	rb_define_singleton_method(rb_Trenni_Markup, "escape_string", Trenni_Markup_escape_string, 1);
	
	rb_undef_method(rb_Trenni_Markup, "escape");
	rb_undef_method(rb_class_of(rb_Trenni_Markup), "escape");
	rb_define_module_function(rb_Trenni_Markup, "escape", Trenni_Markup_escape, 1);
}
