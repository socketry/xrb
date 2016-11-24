
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
		
		VALUE result = rb_funcall(entities, rb_intern("[]"), 1, Trenni_token(entity));
		
		Trenni_append_string(&pcdata, encoding, result);
	}
	
	action entity_hex {
		entity.end = p;
		
		char * end = (char *)entity.end;
		unsigned long codepoint = strtoul(entity.begin, &end, 16);
		
		Trenni_append_codepoint(&pcdata, encoding, codepoint);
	}
	
	action entity_number {
		entity.end = p;
		
		char * end = (char *)entity.end;
		unsigned long codepoint = strtoul(entity.begin, &end, 10);
		
		Trenni_append_codepoint(&pcdata, encoding, codepoint);
	}
	
	action doctype_begin {
		doctype.begin = p;
	}
	
	action doctype_end {
		doctype.end = p;
		
		rb_funcall(delegate, id_doctype, 1, Trenni_token(doctype));
	}
	
	action doctype_error {
		Trenni_raise_error("could not parse doctype", buffer, p-s);
	}
	
	action comment_begin {
		comment.begin = p;
	}
	
	action comment_end {
		comment.end = p;
		
		rb_funcall(delegate, id_comment, 1, Trenni_token(comment));
	}
	
	action comment_error {
		Trenni_raise_error("could not parse comment", buffer, p-s);
	}
	
	action instruction_begin {
	}
	
	action instruction_text_begin {
		instruction_text.begin = p;
	}
	
	action instruction_text_end {
		instruction_text.end = p;
	}

	action instruction_end {
		rb_funcall(delegate, id_instruction, 2, Trenni_token(identifier), Trenni_token(instruction_text));
	}
	
	action instruction_error {
		Trenni_raise_error("could not parse instruction", buffer, p-s);
	}
	
	action tag_name {
		// Reset self-closing state - we don't know yet.
		self_closing = 0;
		
		rb_funcall(delegate, id_open_tag_begin, 2, Trenni_token(identifier), ULONG2NUM(identifier.begin-s));
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
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
		}
	}
	
	action tag_opening_end {
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}
	
	action tag_closing_begin {
	}
	
	action tag_closing_end {
		rb_funcall(delegate, id_close_tag, 2, Trenni_token(identifier), ULONG2NUM(identifier.begin-s));
	}
	
	action tag_error {
		Trenni_raise_error("could not parse tag", buffer, p-s);
	}
	
	action cdata_begin {
		cdata.begin = p;
	}
	
	action cdata_end {
		cdata.end = p;
		
		rb_funcall(delegate, id_cdata, 1, Trenni_token(cdata));
	}
	
	action cdata_error {
		Trenni_raise_error("could not parse cdata", buffer, p-s);
	}
	
	action text_begin {
	
	}
	
	action text_end {
		// Entities are handled separately:
		rb_funcall(delegate, id_text, 1, pcdata);
	}
	
	include markup "trenni/markup.rl";
	
	write data;
}%%

VALUE Trenni_Native_parse_markup(VALUE self, VALUE buffer, VALUE delegate, VALUE entities) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	rb_encoding *encoding = rb_enc_get(string);
	
	VALUE pcdata = Qnil;
	
	VALUE empty_string = rb_enc_str_new("", 0, encoding);
	rb_obj_freeze_inline(empty_string);
	
	const char * s = RSTRING_PTR(string);
	const char * p = s;
	const char * pe = p + RSTRING_LEN(string);
	const char * eof = pe;

	unsigned long cs;
	unsigned long top = 0;
	unsigned long stack[2] = {0};
	
	Token identifier, cdata, characters, entity, doctype, comment, instruction_text;
	unsigned self_closing = 0, has_value = 0;
	
	%%{
		write init;
		write exec;
	}%%
	
	if (p != eof) {
		Trenni_raise_error("could not parse all input", buffer, p-s);
	}
	
	return Qnil;
}
