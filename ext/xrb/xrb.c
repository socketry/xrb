
#include "xrb.h"

#include "markup.h"
#include "template.h"
#include "query.h"
#include "tag.h"
#include "escape.h"

VALUE rb_XRB = Qnil, rb_XRB_Native = Qnil, rb_XRB_Tag = Qnil, rb_XRB_Markup = Qnil, rb_XRB_MarkupString = Qnil, rb_XRB_ParseError = Qnil;
ID id_cdata, id_open_tag_begin, id_open_tag_end, id_attribute, id_close_tag, id_text, id_doctype, id_comment, id_instruction, id_read, id_expression, id_key_get, id_string, id_integer, id_append, id_assign, id_pair, id_new, id_name, id_attributes, id_closed, id_to_s, id_is_a, id_concat;

void XRB_raise_error(const char * message, VALUE buffer, size_t offset) {
	VALUE exception = rb_funcall(rb_XRB_ParseError, id_new, 3, rb_str_new_cstr(message), buffer, ULONG2NUM(offset));
	
	rb_exc_raise(exception);
}

void Init_XRB_Extension(void) {
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
	
	id_concat = rb_intern("<<");
	
	rb_XRB = rb_define_module("XRB");
	rb_XRB_Markup = rb_define_module_under(rb_XRB, "Markup");
	rb_XRB_Native = rb_define_module_under(rb_XRB, "Native");
	
	Init_XRB_escape();
	
	rb_XRB_ParseError = rb_const_get_at(rb_XRB, rb_intern("ParseError"));
	rb_gc_register_mark_object(rb_XRB_ParseError);
	
	rb_define_module_function(rb_XRB_Native, "parse_markup", XRB_Native_parse_markup, 3);
	rb_define_module_function(rb_XRB_Native, "parse_template", XRB_Native_parse_template, 2);
	rb_define_module_function(rb_XRB_Native, "parse_query", XRB_Native_parse_query, 2);
	
	rb_XRB_Tag = rb_const_get_at(rb_XRB, rb_intern("Tag"));
	rb_gc_register_mark_object(rb_XRB_Tag);
	
	Init_XRB_Tag();
}
