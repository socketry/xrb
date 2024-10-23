
#include "template.h"

%%{
	machine XRB_template_parser;
	
	action instruction_begin {
		// fprintf(stderr, "instruction begin %s\n", p);
		instruction.begin = p;
	}
	
	action instruction_end {
		// fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
	}
	
	action emit_instruction {
		// fprintf(stderr, "\033[32m => emit instruction %.*s\033[0m\n", (int)(instruction.end-instruction.begin), instruction.begin);
		rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
	}
	
	action emit_multiline_instruction {
		// fprintf(stderr, "\033[32m => emit multiline instruction %.*s\033[0m\n", (int)(instruction.end-instruction.begin), instruction.begin);
		rb_funcall(delegate, id_instruction, 2, XRB_Token_string(instruction, encoding), newline);
	}
	
	action instruction_error {
		XRB_raise_error("failed to parse instruction", buffer, p-s);
	}
	
	action expression_begin {
		// fprintf(stderr, "expression begin %s\n", p);
		expression.begin = p;
	}
	
	action expression_end {
		// fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
	}
	
	action emit_expression {
		// fprintf(stderr, "\033[32m => emit expression %.*s\033[0m\n", (int)(expression.end-expression.begin), expression.begin);
		
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
	
	action expression_error {
		XRB_raise_error("failed to parse expression", buffer, p-s);
	}
	
	action text_begin {
		// fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
	
	action text_end {
		// fprintf(stderr, "text end %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p;
	}
	
	action text_delimiter_begin {
		// fprintf(stderr, "\033[34m text delimiter begin %s\033[0m\n", p);
		delimiter.begin = p;
	}
	
	action text_delimiter_end {
		// fprintf(stderr, "\033[34m text delimiter end %s\033[0m\n", p);
		delimiter.end = p;
	}
	
	action emit_text {
		if (delimiter.begin && delimiter.end) {
			text.end = delimiter.begin;
			
			// Backtrack:
			p = delimiter.begin - 1;
		}
		
		fprintf(stderr, "\033[32m => emit text \"%.*s\"\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}
	
	action emit_newline {
		// fprintf(stderr, "\033[32m => emit newline\033[0m\n");
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
