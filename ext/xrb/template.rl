
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
	
	action emit_instruction_line {
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
		rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
	}
	
	action expression_error {
		XRB_raise_error("failed to parse expression", buffer, p-s);
	}
	
	action emit_text {
		rb_funcall(delegate, id_text, 1, XRB_string(ts, te, encoding));
	}
	
	include template "xrb/template.rl";
	
	write data;
}%%

VALUE XRB_Native_parse_template(VALUE self, VALUE buffer, VALUE delegate) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	rb_encoding *encoding = rb_enc_get(string);
	
	VALUE newline = rb_obj_freeze(rb_enc_str_new("\n", 1, encoding));
	
	const char *s, *p, *pe, *eof, *ts, *te;
	unsigned long cs, act, top = 0, stack[32] = {0};
	
	XRB_Token expression = {0}, instruction = {0};
	
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
