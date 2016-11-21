#include <Lexer.h>

typedef struct {
	const char * begin;
	const char * end;
} Token;

static VALUE Trenni_string(const char * begin, const char * end) {
	return rb_str_new(begin, end - begin);
}

static VALUE Trenni_token(Token token) {
	return rb_str_new(token.begin, token.end - token.begin);
}

%%{
	machine Trenni_Lexer;
	
	# Track the location of an identifier (tag name, attribute name, etc)
	action identifier_start { identifier.begin = p; }
	action identifier_end { identifier.end = p; }
	
	# Track the location of a value, e.g. attribute value
	action value_start { value.begin = p; }
	action value_end { value.end = p; }
	
	# Track the location of the text part of an instruction
	action instruction_text_start { instruction_text.begin = p; }
	
	action entity_start { entity.begin = p; }
	action entity_name { entity.end = p; }
	action entity_hex { entity.end = p; }
	action entity_number { entity.end = p; }
	
	action match_doctype {
		rb_funcall(delegate, id_doctype, 1, Trenni_string(ts, te));
	}
	
	action doctype_error {
		Trenni_Parser_parse_error("could not parse doctype", buffer, p-s);
	}
	
	action match_comment {
		rb_funcall(delegate, id_comment, 1, Trenni_string(ts, te));
	}
	
	action comment_error {
		Trenni_Parser_parse_error("could not parse comment", buffer, p-s);
	}
	
	action match_instruction {
		instruction_text.end = te-2;
		
		rb_funcall(delegate, id_instruction, 2, Trenni_token(identifier), Trenni_token(instruction_text));
	}
	
	action instruction_error {
		Trenni_Parser_parse_error("could not parse instruction", buffer, p-s);
	}
	
	action tag_name {
		// Reset self-closing state - we don't know yet.
		self_closing = 0;
		
		rb_funcall(delegate, id_open_tag_begin, 1, Trenni_token(identifier));
	}
	
	action match_opening_tag {
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}
	
	action tag_self_closing {
		self_closing = 1;
	}
	
	action tag_attribute_start {
		has_value = 0;
	}
	
	action tag_attribute {
		if (has_value)
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Trenni_token(value));
		else
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
	}
	
	action tag_attribute_value {
		has_value = 1;
	}
	
	action match_closing_tag {
		rb_funcall(delegate, id_close_tag, 1, Trenni_token(identifier));
	}
	
	action tag_error {
		Trenni_Parser_parse_error("could not parse tag", buffer, p-s);
	}
	
	action match_attribute_entity {
		//Trenni_Parser_value_append
	}
	
	action match_entity {
		
	}
	
	action entity_error {
		Trenni_Parser_parse_error("could not parse entity", buffer, p-s);
	}
	
	action match_cdata {
		rb_funcall(delegate, id_cdata, 1, Trenni_string(ts, te));
	}
	
	action cdata_error {
		Trenni_Parser_parse_error("could not parse cdata", buffer, p-s);
	}
	
	action match_text { 
		// Entities are handled separately:
		rb_funcall(delegate, id_text, 1, Trenni_string(ts, te));
	}
	
	include Markup "Markup.rl";
	
	write data;
}%%

static void Trenni_Parser_parse_error(const char * message, VALUE buffer, size_t offset) {
	VALUE exception = rb_funcall(rb_Trenni_ParseError, rb_intern("new"), 3, rb_str_new_cstr(message), buffer, UINT2NUM(offset));
	
	rb_exc_raise(exception);
}

void Trenni_Parser_parse_buffer(VALUE buffer, VALUE delegate) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	const char * s = RSTRING_PTR(string);
	const char * p = s;
	const char * pe = p + RSTRING_LEN(string);
	const char * eof = pe;
	const char * ts = 0;
	const char * te = 0;
	
	unsigned long cs, act;
	
	Token identifier, value, entity, instruction_text;
	unsigned self_closing = 0, has_value = 0;
	
	%%{
		write init;
		write exec;
	}%%
	
	if (p != eof) {
		Trenni_Parser_parse_error("could not parse all input", buffer, p-s);
	}
}
