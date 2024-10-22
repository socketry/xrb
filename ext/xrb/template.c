
#line 1 "ext/xrb/template.rl"

#include "template.h"


#line 8 "ext/xrb/template.c"
static const int XRB_template_parser_start = 27;
static const int XRB_template_parser_first_final = 27;
static const int XRB_template_parser_error = 0;

static const int XRB_template_parser_en_parse_nested_expression = 1;
static const int XRB_template_parser_en_parse_expression = 12;
static const int XRB_template_parser_en_parse_instruction = 24;
static const int XRB_template_parser_en_main = 27;


#line 80 "ext/xrb/template.rl"


VALUE XRB_Native_parse_template(VALUE self, VALUE buffer, VALUE delegate) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	rb_encoding *encoding = rb_enc_get(string);
	
	// VALUE newline = rb_obj_freeze(rb_enc_str_new("\n", 1, encoding));
	
	const char *s, *p, *pe, *eof;
	unsigned long cs, top = 0, stack[32] = {0};
	
	XRB_Token expression = {0}, instruction = {0}, text = {0}, token = {0};
	
	s = p = RSTRING_PTR(string);
	eof = pe = p + RSTRING_LEN(string);
	
	
#line 38 "ext/xrb/template.c"
	{
	cs = XRB_template_parser_start;
	top = 0;
	}

#line 44 "ext/xrb/template.c"
	{
	if ( p == pe )
		goto _test_eof;
	goto _resume;

_again:
	switch ( cs ) {
		case 27: goto st27;
		case 28: goto st28;
		case 29: goto st29;
		case 30: goto st30;
		case 31: goto st31;
		case 32: goto st32;
		case 33: goto st33;
		case 34: goto st34;
		case 35: goto st35;
		case 36: goto st36;
		case 1: goto st1;
		case 2: goto st2;
		case 3: goto st3;
		case 4: goto st4;
		case 5: goto st5;
		case 6: goto st6;
		case 7: goto st7;
		case 37: goto st37;
		case 8: goto st8;
		case 38: goto st38;
		case 9: goto st9;
		case 10: goto st10;
		case 11: goto st11;
		case 39: goto st39;
		case 40: goto st40;
		case 0: goto st0;
		case 12: goto st12;
		case 13: goto st13;
		case 14: goto st14;
		case 15: goto st15;
		case 16: goto st16;
		case 17: goto st17;
		case 18: goto st18;
		case 19: goto st19;
		case 41: goto st41;
		case 20: goto st20;
		case 42: goto st42;
		case 21: goto st21;
		case 22: goto st22;
		case 23: goto st23;
		case 43: goto st43;
		case 44: goto st44;
		case 24: goto st24;
		case 25: goto st25;
		case 26: goto st26;
		case 45: goto st45;
	default: break;
	}

	if ( ++p == pe )
		goto _test_eof;
_resume:
	switch ( cs )
	{
st27:
	if ( ++p == pe )
		goto _test_eof27;
case 27:
	switch( (*p) ) {
		case 35: goto tr57;
		case 60: goto tr58;
	}
	goto tr56;
tr56:
#line 47 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
	}
	goto st28;
tr62:
	cs = 28;
#line 66 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token end %.*s\n", (int)(p-token.begin), token.begin);
		token.end = p;
		
		text.end = token.begin;
		
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
#line 30 "parsers/xrb/template.rl"
	{cs = 12;}
	goto _again;
tr66:
	cs = 28;
#line 35 "parsers/xrb/template.rl"
	{cs = 12;}
	goto _again;
st28:
	if ( ++p == pe )
		goto _test_eof28;
case 28:
#line 147 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr60;
		case 60: goto tr61;
	}
	goto st28;
tr60:
#line 61 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token begin %s\n", p);
		token.begin = p;
	}
	goto st29;
st29:
	if ( ++p == pe )
		goto _test_eof29;
case 29:
#line 164 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr60;
		case 60: goto tr61;
		case 123: goto tr62;
	}
	goto st28;
tr61:
#line 61 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token begin %s\n", p);
		token.begin = p;
	}
	goto st30;
st30:
	if ( ++p == pe )
		goto _test_eof30;
case 30:
#line 182 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr60;
		case 60: goto tr61;
		case 63: goto st31;
	}
	goto st28;
st31:
	if ( ++p == pe )
		goto _test_eof31;
case 31:
	switch( (*p) ) {
		case 35: goto tr60;
		case 60: goto tr61;
		case 114: goto st32;
	}
	goto st28;
tr65:
	cs = 32;
#line 66 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token end %.*s\n", (int)(p-token.begin), token.begin);
		token.end = p;
		
		text.end = token.begin;
		
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
#line 31 "parsers/xrb/template.rl"
	{cs = 24;}
	goto _again;
st32:
	if ( ++p == pe )
		goto _test_eof32;
case 32:
#line 219 "ext/xrb/template.c"
	switch( (*p) ) {
		case 32: goto tr65;
		case 35: goto tr60;
		case 60: goto tr61;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr65;
	goto st28;
tr57:
#line 47 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
	}
	goto st33;
st33:
	if ( ++p == pe )
		goto _test_eof33;
case 33:
#line 239 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr60;
		case 60: goto tr61;
		case 123: goto tr66;
	}
	goto st28;
tr58:
#line 47 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
	}
	goto st34;
st34:
	if ( ++p == pe )
		goto _test_eof34;
case 34:
#line 257 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr60;
		case 60: goto tr61;
		case 63: goto st35;
	}
	goto st28;
st35:
	if ( ++p == pe )
		goto _test_eof35;
case 35:
	switch( (*p) ) {
		case 35: goto tr60;
		case 60: goto tr61;
		case 114: goto st36;
	}
	goto st28;
tr69:
	cs = 36;
#line 36 "parsers/xrb/template.rl"
	{cs = 24;}
	goto _again;
st36:
	if ( ++p == pe )
		goto _test_eof36;
case 36:
#line 283 "ext/xrb/template.c"
	switch( (*p) ) {
		case 32: goto tr69;
		case 35: goto tr60;
		case 60: goto tr61;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr69;
	goto st28;
tr3:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 1;goto st1;}}
	goto st1;
st1:
	if ( ++p == pe )
		goto _test_eof1;
case 1:
#line 300 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st2;
		case 39: goto st10;
		case 123: goto tr3;
		case 125: goto tr4;
	}
	goto st1;
tr19:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 2;goto st1;}}
	goto st2;
st2:
	if ( ++p == pe )
		goto _test_eof2;
case 2:
#line 316 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st3;
		case 35: goto st9;
	}
	goto st2;
tr9:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 3;goto st1;}}
	goto st3;
tr11:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 3;goto st1;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 3;goto st1;}}
	goto st3;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
#line 336 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st4;
		case 39: goto st5;
		case 123: goto tr9;
		case 125: goto tr10;
	}
	goto st3;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
	switch( (*p) ) {
		case 35: goto st4;
		case 39: goto st5;
		case 123: goto tr11;
		case 125: goto tr10;
	}
	goto st3;
tr18:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 5;goto st1;}}
	goto st5;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
#line 363 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st6;
		case 35: goto st8;
		case 39: goto st6;
	}
	goto st5;
tr15:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 6;goto st1;}}
	goto st6;
tr17:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 6;goto st1;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 6;goto st1;}}
	goto st6;
st6:
	if ( ++p == pe )
		goto _test_eof6;
case 6:
#line 384 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st7;
		case 123: goto tr15;
		case 125: goto tr16;
	}
	goto st6;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
	switch( (*p) ) {
		case 35: goto st7;
		case 123: goto tr17;
		case 125: goto tr16;
	}
	goto st6;
tr16:
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st37;
st37:
	if ( ++p == pe )
		goto _test_eof37;
case 37:
#line 409 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st6;
		case 35: goto st8;
		case 39: goto st6;
	}
	goto st5;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
	switch( (*p) ) {
		case 34: goto st6;
		case 35: goto st8;
		case 39: goto st6;
		case 123: goto tr18;
	}
	goto st5;
tr10:
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st38;
st38:
	if ( ++p == pe )
		goto _test_eof38;
case 38:
#line 435 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st3;
		case 35: goto st9;
	}
	goto st2;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
	switch( (*p) ) {
		case 34: goto st3;
		case 35: goto st9;
		case 123: goto tr19;
	}
	goto st2;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
	if ( (*p) == 39 )
		goto st11;
	goto st10;
tr21:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 11;goto st1;}}
	goto st11;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
#line 466 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st5;
		case 123: goto tr21;
		case 125: goto tr22;
	}
	goto st11;
tr22:
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st39;
st39:
	if ( ++p == pe )
		goto _test_eof39;
case 39:
#line 481 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st11;
	goto st10;
tr4:
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st40;
st40:
	if ( ++p == pe )
		goto _test_eof40;
case 40:
#line 493 "ext/xrb/template.c"
	goto st0;
st0:
cs = 0;
	goto _out;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
	switch( (*p) ) {
		case 34: goto tr24;
		case 39: goto tr25;
		case 123: goto tr26;
		case 125: goto tr27;
	}
	goto tr23;
tr31:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 13;goto st1;}}
	goto st13;
tr23:
#line 29 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression begin %s\n", p);
		expression.begin = p;
	}
	goto st13;
tr26:
#line 29 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression begin %s\n", p);
		expression.begin = p;
	}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 13;goto st1;}}
	goto st13;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
#line 533 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st14;
		case 39: goto st22;
		case 123: goto tr31;
		case 125: goto tr32;
	}
	goto st13;
tr47:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 14;goto st1;}}
	goto st14;
tr24:
#line 29 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression begin %s\n", p);
		expression.begin = p;
	}
	goto st14;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
#line 556 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st15;
		case 35: goto st21;
	}
	goto st14;
tr37:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 15;goto st1;}}
	goto st15;
tr39:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 15;goto st1;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 15;goto st1;}}
	goto st15;
st15:
	if ( ++p == pe )
		goto _test_eof15;
case 15:
#line 576 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st16;
		case 39: goto st17;
		case 123: goto tr37;
		case 125: goto tr38;
	}
	goto st15;
st16:
	if ( ++p == pe )
		goto _test_eof16;
case 16:
	switch( (*p) ) {
		case 35: goto st16;
		case 39: goto st17;
		case 123: goto tr39;
		case 125: goto tr38;
	}
	goto st15;
tr46:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 17;goto st1;}}
	goto st17;
st17:
	if ( ++p == pe )
		goto _test_eof17;
case 17:
#line 603 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st18;
		case 35: goto st20;
		case 39: goto st18;
	}
	goto st17;
tr43:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 18;goto st1;}}
	goto st18;
tr45:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 18;goto st1;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 18;goto st1;}}
	goto st18;
st18:
	if ( ++p == pe )
		goto _test_eof18;
case 18:
#line 624 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st19;
		case 123: goto tr43;
		case 125: goto tr44;
	}
	goto st18;
st19:
	if ( ++p == pe )
		goto _test_eof19;
case 19:
	switch( (*p) ) {
		case 35: goto st19;
		case 123: goto tr45;
		case 125: goto tr44;
	}
	goto st18;
tr44:
	cs = 41;
#line 34 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
		
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 22 "parsers/xrb/template.rl"
	{cs = 27;}
	goto _again;
st41:
	if ( ++p == pe )
		goto _test_eof41;
case 41:
#line 659 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st18;
		case 35: goto st20;
		case 39: goto st18;
	}
	goto st17;
st20:
	if ( ++p == pe )
		goto _test_eof20;
case 20:
	switch( (*p) ) {
		case 34: goto st18;
		case 35: goto st20;
		case 39: goto st18;
		case 123: goto tr46;
	}
	goto st17;
tr38:
	cs = 42;
#line 34 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
		
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 22 "parsers/xrb/template.rl"
	{cs = 27;}
	goto _again;
st42:
	if ( ++p == pe )
		goto _test_eof42;
case 42:
#line 695 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st15;
		case 35: goto st21;
	}
	goto st14;
st21:
	if ( ++p == pe )
		goto _test_eof21;
case 21:
	switch( (*p) ) {
		case 34: goto st15;
		case 35: goto st21;
		case 123: goto tr47;
	}
	goto st14;
tr25:
#line 29 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression begin %s\n", p);
		expression.begin = p;
	}
	goto st22;
st22:
	if ( ++p == pe )
		goto _test_eof22;
case 22:
#line 722 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st23;
	goto st22;
tr49:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 23;goto st1;}}
	goto st23;
st23:
	if ( ++p == pe )
		goto _test_eof23;
case 23:
#line 734 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st17;
		case 123: goto tr49;
		case 125: goto tr50;
	}
	goto st23;
tr50:
	cs = 43;
#line 34 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
		
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 22 "parsers/xrb/template.rl"
	{cs = 27;}
	goto _again;
st43:
	if ( ++p == pe )
		goto _test_eof43;
case 43:
#line 759 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st23;
	goto st22;
tr27:
	cs = 44;
#line 29 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression begin %s\n", p);
		expression.begin = p;
	}
#line 34 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
		
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 22 "parsers/xrb/template.rl"
	{cs = 27;}
	goto _again;
tr32:
	cs = 44;
#line 34 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
		
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 22 "parsers/xrb/template.rl"
	{cs = 27;}
	goto _again;
st44:
	if ( ++p == pe )
		goto _test_eof44;
case 44:
#line 800 "ext/xrb/template.c"
	goto st0;
st24:
	if ( ++p == pe )
		goto _test_eof24;
case 24:
	if ( (*p) == 63 )
		goto tr52;
	goto tr51;
tr51:
#line 7 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction begin %s\n", p);
		instruction.begin = p;
	}
	goto st25;
st25:
	if ( ++p == pe )
		goto _test_eof25;
case 25:
#line 820 "ext/xrb/template.c"
	if ( (*p) == 63 )
		goto tr54;
	goto st25;
tr52:
#line 7 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction begin %s\n", p);
		instruction.begin = p;
	}
#line 12 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
		
		if (instruction.end > instruction.begin) {
			rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
		}
	}
	goto st26;
tr54:
#line 12 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
		
		if (instruction.end > instruction.begin) {
			rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
		}
	}
	goto st26;
st26:
	if ( ++p == pe )
		goto _test_eof26;
case 26:
#line 855 "ext/xrb/template.c"
	if ( (*p) == 62 )
		goto tr55;
	goto st25;
tr55:
	cs = 45;
#line 27 "parsers/xrb/template.rl"
	{cs = 27;}
	goto _again;
st45:
	if ( ++p == pe )
		goto _test_eof45;
case 45:
#line 868 "ext/xrb/template.c"
	goto st0;
	}
	_test_eof27: cs = 27; goto _test_eof; 
	_test_eof28: cs = 28; goto _test_eof; 
	_test_eof29: cs = 29; goto _test_eof; 
	_test_eof30: cs = 30; goto _test_eof; 
	_test_eof31: cs = 31; goto _test_eof; 
	_test_eof32: cs = 32; goto _test_eof; 
	_test_eof33: cs = 33; goto _test_eof; 
	_test_eof34: cs = 34; goto _test_eof; 
	_test_eof35: cs = 35; goto _test_eof; 
	_test_eof36: cs = 36; goto _test_eof; 
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof37: cs = 37; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof38: cs = 38; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 
	_test_eof39: cs = 39; goto _test_eof; 
	_test_eof40: cs = 40; goto _test_eof; 
	_test_eof12: cs = 12; goto _test_eof; 
	_test_eof13: cs = 13; goto _test_eof; 
	_test_eof14: cs = 14; goto _test_eof; 
	_test_eof15: cs = 15; goto _test_eof; 
	_test_eof16: cs = 16; goto _test_eof; 
	_test_eof17: cs = 17; goto _test_eof; 
	_test_eof18: cs = 18; goto _test_eof; 
	_test_eof19: cs = 19; goto _test_eof; 
	_test_eof41: cs = 41; goto _test_eof; 
	_test_eof20: cs = 20; goto _test_eof; 
	_test_eof42: cs = 42; goto _test_eof; 
	_test_eof21: cs = 21; goto _test_eof; 
	_test_eof22: cs = 22; goto _test_eof; 
	_test_eof23: cs = 23; goto _test_eof; 
	_test_eof43: cs = 43; goto _test_eof; 
	_test_eof44: cs = 44; goto _test_eof; 
	_test_eof24: cs = 24; goto _test_eof; 
	_test_eof25: cs = 25; goto _test_eof; 
	_test_eof26: cs = 26; goto _test_eof; 
	_test_eof45: cs = 45; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 24: 
	case 25: 
	case 26: 
#line 25 "ext/xrb/template.rl"
	{
		XRB_raise_error("failed to parse instruction", buffer, p-s);
	}
	break;
	case 12: 
	case 13: 
	case 14: 
	case 15: 
	case 16: 
	case 17: 
	case 18: 
	case 19: 
	case 20: 
	case 21: 
	case 22: 
	case 23: 
#line 43 "ext/xrb/template.rl"
	{
		XRB_raise_error("failed to parse expression", buffer, p-s);
	}
	break;
	case 28: 
	case 29: 
	case 30: 
	case 31: 
	case 32: 
	case 33: 
	case 34: 
	case 35: 
	case 36: 
#line 52 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text end %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p;
		
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
	break;
#line 965 "ext/xrb/template.c"
	}
	}

	_out: {}
	}

#line 100 "ext/xrb/template.rl"

	
	if (p != eof) {
		XRB_raise_error("could not parse all input", buffer, p-s);
	}
	
	return Qnil;
}
