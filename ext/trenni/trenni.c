
#include "trenni.h"
#include "lexer.h"

VALUE rb_Trenni = Qnil, rb_Trenni_Parser = Qnil, rb_Trenni_ParseError = Qnil;
ID id_cdata, id_open_tag_begin, id_open_tag_end, id_attribute, id_close_tag, id_text, id_doctype, id_comment, id_instruction, id_read;

#define NewObject(type) (type*)malloc(sizeof(type))

static void Trenni_Parser_mark(Trenni_Parser * parser) {
	rb_gc_mark(parser->buffer);
	rb_gc_mark(parser->delegate);
}

static void Trenni_Parser_free(Trenni_Parser * parser) {
	free(parser);
}

static VALUE Trenni_Parser_allocate(VALUE klass) {
	Trenni_Parser * parser = NewObject(Trenni_Parser);

	return Data_Wrap_Struct(klass, Trenni_Parser_mark, Trenni_Parser_free, parser);
}

static VALUE Trenni_Parser_initialize(VALUE self, VALUE buffer, VALUE delegate, VALUE entities) {
	Trenni_Parser * parser;

	Data_Get_Struct(self, Trenni_Parser, parser);

	parser->buffer = buffer;
	parser->delegate = delegate;
	
	return Qnil;
}

static VALUE Trenni_Parser_parse(VALUE self) {
	Trenni_Parser * parser = 0;
	
	Data_Get_Struct(self, Trenni_Parser, parser);
	
	Trenni_Parser_parse_buffer(parser->buffer, parser->delegate);
	
	return Qnil;
}

void Init_trenni() {
	id_cdata = rb_intern("cdata");
	id_open_tag_begin = rb_intern("open_tag_begin");
	id_open_tag_end = rb_intern("open_tag_end");
	id_attribute = rb_intern("attribute");
	id_comment = rb_intern("comment");
	id_text = rb_intern("text");
	id_doctype = rb_intern("doctype");
	id_instruction = rb_intern("instruction");
	id_read = rb_intern("read");
	
	id_close_tag = rb_intern("close_tag");
	
	rb_Trenni = rb_define_module("Trenni");
	
	rb_Trenni_ParseError = rb_const_get_at(rb_Trenni, rb_intern("ParseError"));
	
	rb_Trenni_Parser = rb_define_class_under(rb_Trenni, "Parser", rb_cObject);
	rb_define_alloc_func(rb_Trenni_Parser, Trenni_Parser_allocate);
	rb_define_method(rb_Trenni_Parser, "initialize", Trenni_Parser_initialize, 2);
	rb_define_method(rb_Trenni_Parser, "parse!", Trenni_Parser_parse, 0);
}
