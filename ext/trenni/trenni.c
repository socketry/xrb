
#include "trenni.h"

#include "markup.h"
#include "template.h"
#include "tag.h"
#include "escape.h"

VALUE rb_Trenni = Qnil, rb_Trenni_Native = Qnil, rb_Trenni_Tag = Qnil, rb_Trenni_Markup = Qnil, rb_Trenni_RawString = Qnil, rb_Trenni_RawString_EMPTY = Qnil, rb_Trenni_ParseError = Qnil;
ID id_cdata, id_open_tag_begin, id_open_tag_end, id_attribute, id_close_tag, id_text, id_doctype, id_comment, id_instruction, id_read, id_expression, id_key_get, id_new, id_name, id_attributes, id_closed;

void Trenni_raise_error(const char * message, VALUE buffer, size_t offset) {
	VALUE exception = rb_funcall(rb_Trenni_ParseError, id_new, 3, rb_str_new_cstr(message), buffer, ULONG2NUM(offset));
	
	rb_exc_raise(exception);
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
	id_expression = rb_intern("expression");
	
	id_read = rb_intern("read");
	id_new = rb_intern("new");
	
	id_name = rb_intern("name");
	id_attributes = rb_intern("attributes");
	id_closed = rb_intern("closed");
	
	id_key_get = rb_intern("[]");
	
	rb_Trenni = rb_define_module("Trenni");
	rb_Trenni_Markup = rb_define_module_under(rb_Trenni, "Markup");
	rb_Trenni_Native = rb_define_module_under(rb_Trenni, "Native");
	
	rb_Trenni_RawString = rb_define_class_under(rb_Trenni, "RawString", rb_cString);
	rb_include_module(rb_Trenni_RawString, rb_Trenni_Markup);
	
	rb_Trenni_RawString_EMPTY = rb_funcall(rb_Trenni_RawString, id_new, 0);
	
	rb_Trenni_ParseError = rb_const_get_at(rb_Trenni, rb_intern("ParseError"));
	
	rb_define_module_function(rb_Trenni_Native, "parse_markup", Trenni_Native_parse_markup, 3);
	rb_define_module_function(rb_Trenni_Native, "parse_template", Trenni_Native_parse_template, 2);
	
	// rb_Trenni_Tag = rb_const_get_at(rb_Trenni, rb_intern("Tag"));
	// 
	// rb_define_singleton_method(rb_Trenni_Tag, "append_tag", Trenni_Tag_append_tag, 4);
	// rb_define_singleton_method(rb_Trenni_Tag, "format_tag", Trenni_Tag_format_tag, 3);
	// 
	// rb_undef_method(rb_Trenni_Tag, "write_opening_tag");
	// rb_define_method(rb_Trenni_Tag, "write_opening_tag", Trenni_Tag_write_opening_tag, 1);
	// rb_undef_method(rb_Trenni_Tag, "write_closing_tag");
	// rb_define_method(rb_Trenni_Tag, "write_closing_tag", Trenni_Tag_write_closing_tag, 1);
	// 
	// rb_undef_method(rb_Trenni_Markup, "escape_string");
	// rb_define_module_function(rb_Trenni_Markup, "escape_string", Trenni_Markup_escape_string, 1);
}
