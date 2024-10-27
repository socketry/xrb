
#include "escape.h"
#include <assert.h>

inline static int XRB_Markup_is_markup(VALUE value) {
	if (RB_IMMEDIATE_P(value))
		return 0;
	
	// This is a short-cut:
	if (rb_class_of(value) == rb_XRB_MarkupString) {
		return 1;
	}
	
	return rb_funcall(value, id_is_a, 1, rb_XRB_Markup) == Qtrue;
}

VALUE XRB_MarkupString_raw(VALUE self, VALUE string) {
	string = rb_str_dup(string);
	
	rb_obj_reveal(string, rb_XRB_MarkupString);
	
	return string;
}

// => [["<", 60, "3c"], [">", 62, "3e"], ["\"", 34, "22"], ["&", 38, "26"]] 
// static const uint32_t MASK = 0x3e3e3e3e;
// 
// static const uint32_t MASK_LT = 0x3c3c3c3c;
// static const uint32_t MASK_GT = 0x3e3e3e3e;
// static const uint32_t MASK_QUOT = 0x22222222;
// static const uint32_t MASK_AMP = 0x26262626;

static inline const char * XRB_Markup_index_symbol(const char * begin, const char * end) {
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

static inline void XRB_Markup_append_entity(const char * p, VALUE buffer) {
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

static inline VALUE XRB_Markup_append_buffer(VALUE buffer, const char * s, const char * p, const char * end) {
	while (1) {
		// Append the non-symbol part:
		rb_str_buf_cat(buffer, s, p - s);

		// We escape early if there were no changes to be made:
		if (p == end) return buffer;

		XRB_Markup_append_entity(p, buffer);

		s = p + 1;
		p = XRB_Markup_index_symbol(s, end);
	}
}

// Escape and append a string to the output buffer.
VALUE XRB_Markup_append_string(VALUE buffer, VALUE string) {
	const char * begin = RSTRING_PTR(string);
	const char * end = begin + RSTRING_LEN(string);
	
	const char * s = begin;

	// There are two outcomes, either p is at end, or p points to a symbol:
	const char * p = XRB_Markup_index_symbol(s, end);
	
	return XRB_Markup_append_buffer(buffer, s, p, end);
}

VALUE XRB_Markup_append(VALUE self, VALUE output, VALUE value) {
	if (value == Qnil) return Qnil;
	
	// Ensure value is a string:
	if (rb_type(value) != T_STRING) {
		value = rb_funcall(value, id_to_s, 0);
		rb_string_value(&value);
	}
	
	if (RB_TYPE_P(output, T_STRING)) {
		// Fast path:
		rb_str_modify_expand(output, RSTRING_LEN(value));
		
		// The output buffer is a string, so we can append directly:
		if (XRB_Markup_is_markup(value)) {
			rb_str_append(output, value);
		} else {
			XRB_Markup_append_string(output, value);
		}
	} else {
		// Slow path (generates temporary strings):
		if (!XRB_Markup_is_markup(value)) {
			value = XRB_Markup_escape_string(Qnil, value);
		}
		
		rb_funcall(output, id_concat, 1, value);
	}
	
	return output;
}

// Convert markup special characters to entities. May return the original string if no changes were made.
VALUE XRB_Markup_escape_string(VALUE self, VALUE string) {
	if (rb_type(string) != T_STRING) {
		rb_raise(rb_eTypeError, "expected a string");
	}
	
	const char * begin = RSTRING_PTR(string);
	const char * end = begin + RSTRING_LEN(string);
	
	const char * s = begin;

	// There are two outcomes, either p is at end, or p points to a symbol:
	const char * p = XRB_Markup_index_symbol(s, end);

	// We escape early if there were no changes to be made:
	if (p == end) return string;
	
	return XRB_Markup_append_buffer(XRB_buffer_for(string), s, p, end);
}

void Init_XRB_escape(void) {
	rb_XRB_MarkupString = rb_define_class_under(rb_XRB, "MarkupString", rb_cString);
	rb_include_module(rb_XRB_MarkupString, rb_XRB_Markup);
	
	rb_undef_method(rb_class_of(rb_XRB_Markup), "escape_string");
	rb_define_singleton_method(rb_XRB_Markup, "escape_string", XRB_Markup_escape_string, 1);
	
	rb_undef_method(rb_class_of(rb_XRB_Markup), "append");
	rb_define_singleton_method(rb_XRB_Markup, "append", XRB_Markup_append, 2);
	
	rb_undef_method(rb_class_of(rb_XRB_Markup), "raw");
	rb_define_singleton_method(rb_XRB_Markup, "raw", XRB_MarkupString_raw, 1);
}
