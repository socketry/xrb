
#line 1 "ext/xrb/template.rl"

#include "template.h"


#line 8 "ext/xrb/template.c"
static const int XRB_template_parser_start = 27;
static const int XRB_template_parser_first_final = 27;
static const int XRB_template_parser_error = 0;

static const int XRB_template_parser_en_parse_nested_expression = 1;
static const int XRB_template_parser_en_parse_expression = 12;
static const int XRB_template_parser_en_parse_instruction = 23;
static const int XRB_template_parser_en_main = 27;


#line 69 "ext/xrb/template.rl"


VALUE XRB_Native_parse_template(VALUE self, VALUE buffer, VALUE delegate) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	rb_encoding *encoding = rb_enc_get(string);
	
	// VALUE newline = rb_obj_freeze(rb_enc_str_new("\n", 1, encoding));
	
	const char *s, *p, *pe, *eof;
	unsigned long cs, top = 0, stack[32] = {0};
	
	XRB_Token expression = {0}, instruction = {0}, text = {0};
	
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
		case 1: goto st1;
		case 2: goto st2;
		case 3: goto st3;
		case 4: goto st4;
		case 5: goto st5;
		case 6: goto st6;
		case 7: goto st7;
		case 33: goto st33;
		case 8: goto st8;
		case 34: goto st34;
		case 9: goto st9;
		case 10: goto st10;
		case 11: goto st11;
		case 35: goto st35;
		case 36: goto st36;
		case 0: goto st0;
		case 12: goto st12;
		case 13: goto st13;
		case 14: goto st14;
		case 15: goto st15;
		case 16: goto st16;
		case 17: goto st17;
		case 18: goto st18;
		case 37: goto st37;
		case 19: goto st19;
		case 38: goto st38;
		case 20: goto st20;
		case 21: goto st21;
		case 22: goto st22;
		case 39: goto st39;
		case 40: goto st40;
		case 23: goto st23;
		case 41: goto st41;
		case 42: goto st42;
		case 24: goto st24;
		case 25: goto st25;
		case 26: goto st26;
		case 43: goto st43;
	default: break;
	}

	if ( ++p == pe )
		goto _test_eof;
_resume:
	switch ( cs )
	{
tr62:
	cs = 27;
#line 34 "parsers/xrb/template.rl"
	{cs = 12;}
	goto _again;
tr63:
	cs = 27;
#line 35 "parsers/xrb/template.rl"
	{cs = 23;}
	goto _again;
st27:
	if ( ++p == pe )
		goto _test_eof27;
case 27:
#line 118 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr56;
		case 60: goto tr57;
	}
	goto tr55;
tr55:
#line 49 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
	}
	goto st28;
tr61:
#line 54 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text end %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p;
	}
#line 59 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text %.*s\n", (int)(text.end-text.begin), text.begin);
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
#line 49 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
	}
	goto st28;
st28:
	if ( ++p == pe )
		goto _test_eof28;
case 28:
#line 154 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st29;
		case 60: goto st30;
	}
	goto st28;
st29:
	if ( ++p == pe )
		goto _test_eof29;
case 29:
	switch( (*p) ) {
		case 35: goto st29;
		case 60: goto st30;
		case 123: goto tr61;
	}
	goto st28;
st30:
	if ( ++p == pe )
		goto _test_eof30;
case 30:
	switch( (*p) ) {
		case 35: goto st29;
		case 60: goto st30;
		case 63: goto tr61;
	}
	goto st28;
tr56:
#line 49 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
	}
	goto st31;
st31:
	if ( ++p == pe )
		goto _test_eof31;
case 31:
#line 191 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st29;
		case 60: goto st30;
		case 123: goto tr62;
	}
	goto st28;
tr57:
#line 49 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
	}
	goto st32;
st32:
	if ( ++p == pe )
		goto _test_eof32;
case 32:
#line 209 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st29;
		case 60: goto st30;
		case 63: goto tr63;
	}
	goto st28;
tr3:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 1;goto st1;}}
	goto st1;
st1:
	if ( ++p == pe )
		goto _test_eof1;
case 1:
#line 224 "ext/xrb/template.c"
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
#line 240 "ext/xrb/template.c"
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
#line 260 "ext/xrb/template.c"
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
#line 287 "ext/xrb/template.c"
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
#line 308 "ext/xrb/template.c"
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
	goto st33;
st33:
	if ( ++p == pe )
		goto _test_eof33;
case 33:
#line 333 "ext/xrb/template.c"
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
	goto st34;
st34:
	if ( ++p == pe )
		goto _test_eof34;
case 34:
#line 359 "ext/xrb/template.c"
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
#line 390 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st5;
		case 123: goto tr21;
		case 125: goto tr22;
	}
	goto st11;
tr22:
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st35;
st35:
	if ( ++p == pe )
		goto _test_eof35;
case 35:
#line 405 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st11;
	goto st10;
tr4:
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st36;
st36:
	if ( ++p == pe )
		goto _test_eof36;
case 36:
#line 417 "ext/xrb/template.c"
	goto st0;
tr47:
#line 26 "ext/xrb/template.rl"
	{
		XRB_raise_error("failed to parse instruction", buffer, p-s);
	}
	goto st0;
#line 425 "ext/xrb/template.c"
st0:
cs = 0;
	goto _out;
tr26:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 12;goto st1;}}
	goto st12;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
#line 437 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st13;
		case 39: goto st21;
		case 123: goto tr26;
		case 125: goto tr27;
	}
	goto st12;
tr42:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 13;goto st1;}}
	goto st13;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
#line 453 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st14;
		case 35: goto st20;
	}
	goto st13;
tr32:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 14;goto st1;}}
	goto st14;
tr34:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 14;goto st1;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 14;goto st1;}}
	goto st14;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
#line 473 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st15;
		case 39: goto st16;
		case 123: goto tr32;
		case 125: goto tr33;
	}
	goto st14;
st15:
	if ( ++p == pe )
		goto _test_eof15;
case 15:
	switch( (*p) ) {
		case 35: goto st15;
		case 39: goto st16;
		case 123: goto tr34;
		case 125: goto tr33;
	}
	goto st14;
tr41:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 16;goto st1;}}
	goto st16;
st16:
	if ( ++p == pe )
		goto _test_eof16;
case 16:
#line 500 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st17;
		case 35: goto st19;
		case 39: goto st17;
	}
	goto st16;
tr38:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 17;goto st1;}}
	goto st17;
tr40:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 17;goto st1;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 17;goto st1;}}
	goto st17;
st17:
	if ( ++p == pe )
		goto _test_eof17;
case 17:
#line 521 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st18;
		case 123: goto tr38;
		case 125: goto tr39;
	}
	goto st17;
st18:
	if ( ++p == pe )
		goto _test_eof18;
case 18:
	switch( (*p) ) {
		case 35: goto st18;
		case 123: goto tr40;
		case 125: goto tr39;
	}
	goto st17;
tr39:
	cs = 37;
#line 35 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
	}
#line 40 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression %.*s\n", (int)(expression.end-expression.begin), expression.begin);
		rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
	}
#line 22 "parsers/xrb/template.rl"
	{cs = 27;}
	goto _again;
st37:
	if ( ++p == pe )
		goto _test_eof37;
case 37:
#line 557 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st17;
		case 35: goto st19;
		case 39: goto st17;
	}
	goto st16;
st19:
	if ( ++p == pe )
		goto _test_eof19;
case 19:
	switch( (*p) ) {
		case 34: goto st17;
		case 35: goto st19;
		case 39: goto st17;
		case 123: goto tr41;
	}
	goto st16;
tr33:
	cs = 38;
#line 35 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
	}
#line 40 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression %.*s\n", (int)(expression.end-expression.begin), expression.begin);
		rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
	}
#line 22 "parsers/xrb/template.rl"
	{cs = 27;}
	goto _again;
st38:
	if ( ++p == pe )
		goto _test_eof38;
case 38:
#line 594 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st14;
		case 35: goto st20;
	}
	goto st13;
st20:
	if ( ++p == pe )
		goto _test_eof20;
case 20:
	switch( (*p) ) {
		case 34: goto st14;
		case 35: goto st20;
		case 123: goto tr42;
	}
	goto st13;
st21:
	if ( ++p == pe )
		goto _test_eof21;
case 21:
	if ( (*p) == 39 )
		goto st22;
	goto st21;
tr44:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 22;goto st1;}}
	goto st22;
st22:
	if ( ++p == pe )
		goto _test_eof22;
case 22:
#line 625 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st16;
		case 123: goto tr44;
		case 125: goto tr45;
	}
	goto st22;
tr45:
	cs = 39;
#line 35 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
	}
#line 40 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression %.*s\n", (int)(expression.end-expression.begin), expression.begin);
		rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
	}
#line 22 "parsers/xrb/template.rl"
	{cs = 27;}
	goto _again;
st39:
	if ( ++p == pe )
		goto _test_eof39;
case 39:
#line 651 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st22;
	goto st21;
tr27:
	cs = 40;
#line 35 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
	}
#line 40 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression %.*s\n", (int)(expression.end-expression.begin), expression.begin);
		rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
	}
#line 22 "parsers/xrb/template.rl"
	{cs = 27;}
	goto _again;
st40:
	if ( ++p == pe )
		goto _test_eof40;
case 40:
#line 674 "ext/xrb/template.c"
	goto st0;
st23:
	if ( ++p == pe )
		goto _test_eof23;
case 23:
	switch( (*p) ) {
		case 47: goto tr47;
		case 96: goto tr47;
		case 114: goto tr48;
	}
	if ( (*p) < 59 ) {
		if ( 0 <= (*p) && (*p) <= 44 )
			goto tr47;
	} else if ( (*p) > 64 ) {
		if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr47;
		} else if ( (*p) >= 91 )
			goto tr47;
	} else
		goto tr47;
	goto tr46;
tr46:
	cs = 41;
#line 49 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
	}
#line 30 "parsers/xrb/template.rl"
	{cs = 27;}
	goto _again;
tr65:
	cs = 41;
#line 30 "parsers/xrb/template.rl"
	{cs = 27;}
	goto _again;
st41:
	if ( ++p == pe )
		goto _test_eof41;
case 41:
#line 716 "ext/xrb/template.c"
	switch( (*p) ) {
		case 47: goto st0;
		case 96: goto st0;
	}
	if ( (*p) < 59 ) {
		if ( 0 <= (*p) && (*p) <= 44 )
			goto st0;
	} else if ( (*p) > 64 ) {
		if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto st0;
		} else if ( (*p) >= 91 )
			goto st0;
	} else
		goto st0;
	goto tr65;
tr48:
	cs = 42;
#line 49 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
	}
#line 30 "parsers/xrb/template.rl"
	{cs = 27;}
	goto _again;
st42:
	if ( ++p == pe )
		goto _test_eof42;
case 42:
#line 747 "ext/xrb/template.c"
	switch( (*p) ) {
		case 32: goto st24;
		case 47: goto st0;
		case 96: goto st0;
	}
	if ( (*p) < 14 ) {
		if ( (*p) > 8 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto st24;
		} else if ( (*p) >= 0 )
			goto st0;
	} else if ( (*p) > 44 ) {
		if ( (*p) < 91 ) {
			if ( 59 <= (*p) && (*p) <= 64 )
				goto st0;
		} else if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto st0;
		} else
			goto st0;
	} else
		goto st0;
	goto tr65;
tr50:
#line 7 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction begin %s\n", p);
		instruction.begin = p;
	}
	goto st24;
st24:
	if ( ++p == pe )
		goto _test_eof24;
case 24:
#line 782 "ext/xrb/template.c"
	switch( (*p) ) {
		case 32: goto tr50;
		case 63: goto tr51;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr50;
	goto tr49;
tr49:
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
#line 801 "ext/xrb/template.c"
	if ( (*p) == 63 )
		goto tr53;
	goto st25;
tr51:
#line 7 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction begin %s\n", p);
		instruction.begin = p;
	}
#line 12 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
	}
	goto st26;
tr53:
#line 12 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
	}
	goto st26;
st26:
	if ( ++p == pe )
		goto _test_eof26;
case 26:
#line 828 "ext/xrb/template.c"
	if ( (*p) == 62 )
		goto tr54;
	goto st25;
tr54:
	cs = 43;
#line 30 "parsers/xrb/template.rl"
	{cs = 27;}
	goto _again;
st43:
	if ( ++p == pe )
		goto _test_eof43;
case 43:
#line 841 "ext/xrb/template.c"
	goto st0;
	}
	_test_eof27: cs = 27; goto _test_eof; 
	_test_eof28: cs = 28; goto _test_eof; 
	_test_eof29: cs = 29; goto _test_eof; 
	_test_eof30: cs = 30; goto _test_eof; 
	_test_eof31: cs = 31; goto _test_eof; 
	_test_eof32: cs = 32; goto _test_eof; 
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof33: cs = 33; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof34: cs = 34; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 
	_test_eof35: cs = 35; goto _test_eof; 
	_test_eof36: cs = 36; goto _test_eof; 
	_test_eof12: cs = 12; goto _test_eof; 
	_test_eof13: cs = 13; goto _test_eof; 
	_test_eof14: cs = 14; goto _test_eof; 
	_test_eof15: cs = 15; goto _test_eof; 
	_test_eof16: cs = 16; goto _test_eof; 
	_test_eof17: cs = 17; goto _test_eof; 
	_test_eof18: cs = 18; goto _test_eof; 
	_test_eof37: cs = 37; goto _test_eof; 
	_test_eof19: cs = 19; goto _test_eof; 
	_test_eof38: cs = 38; goto _test_eof; 
	_test_eof20: cs = 20; goto _test_eof; 
	_test_eof21: cs = 21; goto _test_eof; 
	_test_eof22: cs = 22; goto _test_eof; 
	_test_eof39: cs = 39; goto _test_eof; 
	_test_eof40: cs = 40; goto _test_eof; 
	_test_eof23: cs = 23; goto _test_eof; 
	_test_eof41: cs = 41; goto _test_eof; 
	_test_eof42: cs = 42; goto _test_eof; 
	_test_eof24: cs = 24; goto _test_eof; 
	_test_eof25: cs = 25; goto _test_eof; 
	_test_eof26: cs = 26; goto _test_eof; 
	_test_eof43: cs = 43; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 23: 
	case 24: 
	case 25: 
	case 26: 
#line 26 "ext/xrb/template.rl"
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
#line 45 "ext/xrb/template.rl"
	{
		XRB_raise_error("failed to parse expression", buffer, p-s);
	}
	break;
	case 41: 
	case 42: 
#line 59 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text %.*s\n", (int)(text.end-text.begin), text.begin);
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
	break;
	case 28: 
	case 29: 
	case 30: 
	case 31: 
	case 32: 
#line 54 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text end %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p;
	}
#line 59 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text %.*s\n", (int)(text.end-text.begin), text.begin);
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
	break;
#line 945 "ext/xrb/template.c"
	}
	}

	_out: {}
	}

#line 89 "ext/xrb/template.rl"

	
	if (p != eof) {
		XRB_raise_error("could not parse all input", buffer, p-s);
	}
	
	return Qnil;
}
