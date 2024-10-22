
#include "template.h"

%%{
	machine XRB_template_parser;
	
	action instruction_begin {
		fprintf(stderr, "instruction begin %s\n", p);
		instruction.begin = p;
	}
	
	action instruction_end {
		fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
	}
	
	action emit_instruction {
		fprintf(stderr, "instruction %.*s\n", (int)(instruction.end-instruction.begin), instruction.begin);
		rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
	}
	
	action emit_instruction_line {
		rb_funcall(delegate, id_instruction, 2, XRB_Token_string(instruction, encoding), newline);
	}
	
	action instruction_error {
		XRB_raise_error("failed to parse instruction", buffer, p-s);
	}
	
	action expression_begin {
		fprintf(stderr, "expression begin %s\n", p);
		expression.begin = p;
	}
	
	action expression_end {
		fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
		
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
	
	action expression_error {
		XRB_raise_error("failed to parse expression", buffer, p-s);
	}
	
	action text_begin {
		fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
	}
	
	action text_end {
		fprintf(stderr, "text end %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p;
		
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
	
	action text_next {
		fprintf(stderr, "text next %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p - 1;
		
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
	
	include template "xrb/template.rl";
	
	write data;
}%%

VALUE XRB_Native_parse_template(VALUE self, VALUE buffer, VALUE delegate) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	rb_encoding *encoding = rb_enc_get(string);
	
	// VALUE newline = rb_obj_freeze(rb_enc_str_new("\n", 1, encoding));
	
	const char *s, *p, *pe, *eof;
	unsigned long cs, top = 0, stack[32] = {0};
	
	XRB_Token expression = {0}, instruction = {0}, text = {0};
	
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
