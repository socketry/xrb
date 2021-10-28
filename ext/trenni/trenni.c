
#include "trenni.h"

#include "markup.h"
#include "template.h"
#include "query.h"
#include "tag.h"
#include "escape.h"

VALUE rb_Trenni = Qnil, rb_Trenni_Native = Qnil, rb_Trenni_Tag = Qnil, rb_Trenni_Markup = Qnil, rb_Trenni_MarkupString = Qnil, rb_Trenni_ParseError = Qnil;
ID id_cdata, id_open_tag_begin, id_open_tag_end, id_attribute, id_close_tag, id_text, id_doctype, id_comment, id_instruction, id_read, id_expression, id_key_get, id_string, id_integer, id_append, id_assign, id_pair, id_new, id_name, id_attributes, id_closed, id_to_s, id_is_a;

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
	
	id_string = rb_intern("string");
	id_integer = rb_intern("integer");
	id_append = rb_intern("append");
	id_assign = rb_intern("assign");
	id_pair = rb_intern("pair");
	
	id_to_s = rb_intern("to_s");
	id_is_a = rb_intern("is_a?");
	
	rb_Trenni = rb_define_module("Trenni");
	rb_gc_register_mark_object(rb_Trenni);
	
	rb_Trenni_Markup = rb_define_module_under(rb_Trenni, "Markup");
	rb_gc_register_mark_object(rb_Trenni_Markup);
	
	rb_Trenni_Native = rb_define_module_under(rb_Trenni, "Native");
	rb_gc_register_mark_object(rb_Trenni_Native);
	
	Init_trenni_escape();
	
	rb_Trenni_ParseError = rb_const_get_at(rb_Trenni, rb_intern("ParseError"));
	rb_gc_register_mark_object(rb_Trenni_ParseError);
	
	rb_define_module_function(rb_Trenni_Native, "parse_markup", Trenni_Native_parse_markup, 3);
	rb_define_module_function(rb_Trenni_Native, "parse_template", Trenni_Native_parse_template, 2);
	rb_define_module_function(rb_Trenni_Native, "parse_query", Trenni_Native_parse_query, 2);
	
	rb_Trenni_Tag = rb_const_get_at(rb_Trenni, rb_intern("Tag"));
	rb_gc_register_mark_object(rb_Trenni_Tag);
	
	Init_trenni_tag();
}
