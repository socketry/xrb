
#include "query.h"

%%{
	machine Trenni_query_parser;
	
	action string_begin {
		string_token.begin = p;
	}
	
	action string_end {
		string_token.end = p;
		
		rb_funcall(delegate, id_string, 1, Trenni_Token_string(string_token, encoding));
	}
	
	action integer_begin {
		integer_token.begin = p;
	}
	
	action integer_end {
		integer_token.end = p;
		
		rb_funcall(delegate, id_integer, 1, Trenni_Token_string(integer_token, encoding));
	}
	
	action append {
		rb_funcall(delegate, id_append, 0);
	}
	
	action value_begin {
		value_token.begin = p;
	}
	
	action value_end {
		value_token.end = p;
		
		rb_funcall(delegate, id_assign, 1, Trenni_Token_string(value_token, encoding));
	}
	
	action pair {
		rb_funcall(delegate, id_pair, 0);
	}
	
	include query "trenni/query.rl";
	
	write data;
}%%

VALUE Trenni_Native_parse_query(VALUE self, VALUE buffer, VALUE delegate) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	rb_encoding *encoding = rb_enc_get(string);
	
	const char *s, *p, *pe, *eof;
	unsigned long cs;
	
	Trenni_Token string_token = {0}, integer_token = {0}, value_token = {0};
	
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
