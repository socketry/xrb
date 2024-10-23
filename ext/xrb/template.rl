
#include "template.h"

%%{
	machine XRB_template_parser;
	
	action instruction_begin {
		instruction.begin = p;
	}
	
	action instruction_end {
		instruction.end = p;
	}
	
	action emit_instruction {
		rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
	}
	
	action emit_multiline_instruction {
		rb_funcall(delegate, id_instruction, 2, XRB_Token_string(instruction, encoding), newline);
	}
	
	action instruction_error {
		XRB_raise_error("failed to parse instruction", buffer, p-s);
	}
	
	action expression_begin {
		expression.begin = p;
	}
	
	action expression_end {
		expression.end = p;
	}
	
	action emit_expression {
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
	
	action expression_error {
		XRB_raise_error("failed to parse expression", buffer, p-s);
	}
	
	action text_begin {
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
	
	action text_end {
		text.end = p;
	}
	
	action text_delimiter_begin {
		delimiter.begin = p;
	}
	
	action text_delimiter_end {
		delimiter.end = p;
	}
	
	action emit_text {
		if (delimiter.begin && delimiter.end) {
			text.end = delimiter.begin;
			
			// Backtrack:
			p = delimiter.begin - 1;
		}
		
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}
	
	action emit_multiline_text {
		text.begin = ts;
		text.end = te;
		
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}
	
	action emit_newline {
		rb_funcall(delegate, id_instruction, 1, newline);
	}
	
	include template "xrb/template.rl";
	
	write data;
}%%

VALUE XRB_Native_parse_template(VALUE self, VALUE buffer, VALUE delegate) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	rb_encoding *encoding = rb_enc_get(string);
	
	VALUE newline = rb_obj_freeze(rb_enc_str_new("\n", 1, encoding));
	
	const char *s, *p, *pe, *eof, *ts, *te;
	unsigned long cs, top = 0, stack[32] = {0}, act;
	
	XRB_Token expression = {0}, instruction = {0}, text = {0}, delimiter = {0};
	
	s = p = RSTRING_PTR(string);
	eof = pe = p + RSTRING_LEN(string);
	
	%%{
		write init;
		write exec;
	}%%
	
	if (p != eof) {
		XRB_raise_error("could not parse all input", buffer, p-s);
	}
	
	return Qnil;
}
