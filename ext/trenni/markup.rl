
#include "markup.h"

#include <ruby/encoding.h>

%%{
	machine Trenni_markup_parser;
	
	# Track the location of an identifier (tag name, attribute name, etc)
	action identifier_begin {
		identifier.begin = p;
	}
	
	action identifier_end {
		identifier.end = p;
	}
	
	action pcdata_begin {
		pcdata = Qnil;
	}
	
	action pcdata_end {
	}
	
	action text_begin {
	}
	
	action text_end {
		rb_funcall(delegate, id_text, 1, pcdata);
	}
	
	action characters_begin {
		characters.begin = p;
	}
	
	action characters_end {
		characters.end = p;
		
		Trenni_append_token(&pcdata, encoding, characters);
	}
	
	action entity_error {
		Trenni_raise_error("could not parse entity", buffer, p-s);
	}
	
	action entity_begin {
		entity.begin = p;
	}
	
	action entity_name {
		entity.end = p;
		
		Trenni_append_string(&pcdata, encoding, 
			rb_funcall(entities, rb_intern("[]"), 1, Trenni_token(entity, encoding))
		);
	}
	
	action entity_hex {
		entity.end = p;
		
		codepoint = strtoul(entity.begin, (char **)&entity.end, 16);
		
		Trenni_append_codepoint(&pcdata, encoding, codepoint);
	}
	
	action entity_number {
		entity.end = p;
		
		codepoint = strtoul(entity.begin, (char **)&entity.end, 10);
		
		Trenni_append_codepoint(&pcdata, encoding, codepoint);
	}
	
	action doctype_begin {
		doctype.begin = p;
	}
	
	action doctype_end {
		doctype.end = p;
		
		rb_funcall(delegate, id_doctype, 1, Trenni_token(doctype, encoding));
	}
	
	action doctype_error {
		Trenni_raise_error("could not parse doctype", buffer, p-s);
	}
	
	action comment_begin {
		comment.begin = p;
	}
	
	action comment_end {
		comment.end = p;
		
		rb_funcall(delegate, id_comment, 1, Trenni_token(comment, encoding));
	}
	
	action comment_error {
		Trenni_raise_error("could not parse comment", buffer, p-s);
	}
	
	action instruction_begin {
		instruction.begin = p;
	}
	
	action instruction_text_begin {
	}
	
	action instruction_text_end {
	}

	action instruction_end {
		instruction.end = p;
		
		rb_funcall(delegate, id_instruction, 1, Trenni_token(instruction, encoding));
	}
	
	action instruction_error {
		Trenni_raise_error("could not parse instruction", buffer, p-s);
	}
	
	action tag_name {
		// Reset self-closing state - we don't know yet.
		self_closing = 0;
		
		rb_funcall(delegate, id_open_tag_begin, 2, Trenni_token(identifier, encoding), ULONG2NUM(identifier.begin-s));
	}
	
	action tag_opening_begin {
	}
	
	action tag_self_closing {
		self_closing = 1;
	}
	
	action attribute_begin {
		has_value = 0;
	}
	
	action attribute_value {
		has_value = 1;
	}
	
	action attribute_empty {
		has_value = 2;
	}
	
	action attribute {
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), Qtrue);
		}
	}
	
	action tag_opening_end {
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}
	
	action tag_closing_begin {
	}
	
	action tag_closing_end {
		rb_funcall(delegate, id_close_tag, 2, Trenni_token(identifier, encoding), ULONG2NUM(identifier.begin-s));
	}
	
	action tag_error {
		Trenni_raise_error("could not parse tag", buffer, p-s);
	}
	
	action cdata_begin {
		cdata.begin = p;
	}
	
	action cdata_end {
		cdata.end = p;
		
		rb_funcall(delegate, id_cdata, 1, Trenni_token(cdata, encoding));
	}
	
	action cdata_error {
		Trenni_raise_error("could not parse cdata", buffer, p-s);
	}
	
	include markup "trenni/markup.rl";
	
	write data;
}%%

VALUE Trenni_Native_parse_markup(VALUE self, VALUE buffer, VALUE delegate, VALUE entities) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	rb_encoding *encoding = rb_enc_get(string);
	
	VALUE pcdata = Qnil;
	
	VALUE empty_string = rb_obj_freeze(rb_enc_str_new("", 0, encoding));
	
	const char *s, *p, *pe, *eof;
	unsigned long cs, top = 0, stack[2] = {0};
	unsigned long codepoint = 0;
	
	Token identifier = {0}, cdata = {0}, characters = {0}, entity = {0}, doctype = {0}, comment = {0}, instruction = {0};
	unsigned self_closing = 0, has_value = 0;
	
	s = p = RSTRING_PTR(string);
	eof = pe = p + RSTRING_LEN(string);
	
	%%{
		write init;
		write exec;
	}%%
	
	if (p != eof) {
		Trenni_raise_error("could not parse all input", buffer, p-s);
	}
	
	return Qnil;
}
