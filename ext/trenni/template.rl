
#include "template.h"

%%{
	machine Trenni_template_parser;
	
	action instruction_begin {
		instruction.begin = p;
	}
	
	action instruction_end {
		instruction.end = p;
	}
	
	action emit_instruction {
		rb_funcall(delegate, id_instruction, 1, Trenni_token(instruction));
	}
	
	action emit_instruction_line {
		rb_funcall(delegate, id_instruction, 2, Trenni_token(instruction), newline);
	}
	
	action instruction_error {
		Trenni_raise_error("failed to parse instruction", buffer, p-s);
	}
	
	action expression_begin {
		expression.begin = p;
	}
	
	action expression_end {
		expression.end = p;
	}
	
	action emit_expression {
		rb_funcall(delegate, id_expression, 1, Trenni_token(expression));
	}
	
	action expression_error {
		Trenni_raise_error("failed to parse expression", buffer, p-s);
	}
	
	action emit_text {
		rb_funcall(delegate, id_text, 1, Trenni_string(ts, te));
	}
	
	include template "trenni/template.rl";
	
	write data;
}%%

VALUE Trenni_Native_parse_template(VALUE self, VALUE buffer, VALUE delegate) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	rb_encoding *encoding = rb_enc_get(string);
	
	VALUE newline = rb_enc_str_new("\n", 1, encoding);
	rb_obj_freeze_inline(newline);
	
	const char * s = RSTRING_PTR(string);
	const char * p = s;
	const char * pe = p + RSTRING_LEN(string);
	const char * eof = pe;
	const char * ts, * te;
	
	unsigned long cs, act;
	unsigned long top = 0;
	unsigned long stack[32] = {0};
	
	Token instruction, expression;
	
	%%{
		write init;
		write exec;
	}%%
	
	if (p != eof) {
		Trenni_raise_error("could not parse all input", buffer, p-s);
	}
	
	return Qnil;
}
