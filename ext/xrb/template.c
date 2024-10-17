
#line 1 "ext/xrb/template.rl"

#include "template.h"


#line 8 "ext/xrb/template.c"
static const int XRB_template_parser_start = 43;
static const int XRB_template_parser_first_final = 43;
static const int XRB_template_parser_error = 0;

static const int XRB_template_parser_en_parse_nested_expression = 21;
static const int XRB_template_parser_en_parse_expression = 32;
static const int XRB_template_parser_en_main = 43;


#line 50 "ext/xrb/template.rl"


VALUE XRB_Native_parse_template(VALUE self, VALUE buffer, VALUE delegate) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	rb_encoding *encoding = rb_enc_get(string);
	
	VALUE newline = rb_obj_freeze(rb_enc_str_new("\n", 1, encoding));
	
	const char *s, *p, *pe, *eof, *ts, *te;
	unsigned long cs, act, top = 0, stack[32] = {0};
	
	XRB_Token expression = {0}, instruction = {0};
	
	s = p = RSTRING_PTR(string);
	eof = pe = p + RSTRING_LEN(string);
	
	
#line 37 "ext/xrb/template.c"
	{
	cs = XRB_template_parser_start;
	top = 0;
	ts = 0;
	te = 0;
	act = 0;
	}

#line 46 "ext/xrb/template.c"
	{
	if ( p == pe )
		goto _test_eof;
	goto _resume;

_again:
	switch ( cs ) {
		case 43: goto st43;
		case 44: goto st44;
		case 45: goto st45;
		case 1: goto st1;
		case 2: goto st2;
		case 3: goto st3;
		case 4: goto st4;
		case 5: goto st5;
		case 46: goto st46;
		case 6: goto st6;
		case 7: goto st7;
		case 8: goto st8;
		case 9: goto st9;
		case 10: goto st10;
		case 11: goto st11;
		case 12: goto st12;
		case 47: goto st47;
		case 13: goto st13;
		case 14: goto st14;
		case 15: goto st15;
		case 0: goto st0;
		case 16: goto st16;
		case 17: goto st17;
		case 18: goto st18;
		case 19: goto st19;
		case 20: goto st20;
		case 48: goto st48;
		case 21: goto st21;
		case 22: goto st22;
		case 23: goto st23;
		case 24: goto st24;
		case 25: goto st25;
		case 26: goto st26;
		case 27: goto st27;
		case 49: goto st49;
		case 28: goto st28;
		case 50: goto st50;
		case 29: goto st29;
		case 30: goto st30;
		case 31: goto st31;
		case 51: goto st51;
		case 52: goto st52;
		case 32: goto st32;
		case 33: goto st33;
		case 34: goto st34;
		case 35: goto st35;
		case 36: goto st36;
		case 37: goto st37;
		case 38: goto st38;
		case 53: goto st53;
		case 39: goto st39;
		case 54: goto st54;
		case 40: goto st40;
		case 41: goto st41;
		case 42: goto st42;
		case 55: goto st55;
		case 56: goto st56;
	default: break;
	}

	if ( ++p == pe )
		goto _test_eof;
_resume:
	switch ( cs )
	{
tr0:
#line 43 "ext/xrb/template.rl"
	{{p = ((te))-1;}{
		rb_funcall(delegate, id_text, 1, XRB_string(ts, te, encoding));
	}}
	goto st43;
tr6:
#line 43 "ext/xrb/template.rl"
	{{p = ((te))-1;}{
		rb_funcall(delegate, id_text, 1, XRB_string(ts, te, encoding));
	}}
	goto st43;
tr10:
#line 23 "ext/xrb/template.rl"
	{
		XRB_raise_error("failed to parse instruction", buffer, p-s);
	}
#line 43 "ext/xrb/template.rl"
	{{p = ((te))-1;}{
		rb_funcall(delegate, id_text, 1, XRB_string(ts, te, encoding));
	}}
	goto st43;
tr15:
#line 1 "NONE"
	{	switch( act ) {
	case 3:
	{{p = ((te))-1;}
		rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
	}
	break;
	case 6:
	{{p = ((te))-1;}
		rb_funcall(delegate, id_text, 1, XRB_string(ts, te, encoding));
	}
	break;
	}
	}
	goto st43;
tr16:
#line 19 "ext/xrb/template.rl"
	{te = p+1;{
		rb_funcall(delegate, id_instruction, 2, XRB_Token_string(instruction, encoding), newline);
	}}
	goto st43;
tr24:
#line 43 "ext/xrb/template.rl"
	{te = p+1;{
		rb_funcall(delegate, id_text, 1, XRB_string(ts, te, encoding));
	}}
	goto st43;
tr79:
#line 43 "ext/xrb/template.rl"
	{te = p;p--;{
		rb_funcall(delegate, id_text, 1, XRB_string(ts, te, encoding));
	}}
	goto st43;
tr82:
#line 43 "ext/xrb/template.rl"
	{te = p;p--;{
		rb_funcall(delegate, id_text, 1, XRB_string(ts, te, encoding));
	}}
	goto st43;
tr84:
	cs = 43;
#line 27 "ext/xrb/template.rl"
	{
		expression.begin = p;
	}
#line 62 "parsers/xrb/template.rl"
	{te = p;p--;{cs = 32;}}
	goto _again;
tr85:
#line 15 "ext/xrb/template.rl"
	{te = p;p--;{
		rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
	}}
	goto st43;
st43:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof43;
case 43:
#line 1 "NONE"
	{ts = p;}
#line 204 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr2;
		case 32: goto tr76;
		case 35: goto st12;
		case 60: goto st13;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr76;
	goto tr75;
tr75:
#line 1 "NONE"
	{te = p+1;}
	goto st44;
tr7:
#line 1 "NONE"
	{te = p+1;}
#line 23 "parsers/xrb/template.rl"
	{
		fprintf(stderr, "backtrack p=%s te=%s\n", p, te);
		p -= 1;
		te -= 1;
	}
	goto st44;
st44:
	if ( ++p == pe )
		goto _test_eof44;
case 44:
#line 232 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr2;
		case 35: goto st4;
		case 60: goto st5;
	}
	goto tr75;
tr2:
#line 1 "NONE"
	{te = p+1;}
	goto st45;
st45:
	if ( ++p == pe )
		goto _test_eof45;
case 45:
#line 247 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr2;
		case 35: goto st2;
		case 60: goto st3;
	}
	goto st1;
tr5:
#line 23 "parsers/xrb/template.rl"
	{
		fprintf(stderr, "backtrack p=%s te=%s\n", p, te);
		p -= 1;
		te -= 1;
	}
	goto st1;
st1:
	if ( ++p == pe )
		goto _test_eof1;
case 1:
#line 266 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr2;
		case 35: goto st2;
		case 60: goto st3;
	}
	goto st1;
st2:
	if ( ++p == pe )
		goto _test_eof2;
case 2:
	if ( (*p) == 123 )
		goto tr0;
	goto tr5;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
	if ( (*p) == 63 )
		goto tr0;
	goto tr5;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
	if ( (*p) == 123 )
		goto tr6;
	goto tr7;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
	if ( (*p) == 63 )
		goto tr6;
	goto tr7;
tr76:
#line 1 "NONE"
	{te = p+1;}
#line 43 "ext/xrb/template.rl"
	{act = 6;}
	goto st46;
st46:
	if ( ++p == pe )
		goto _test_eof46;
case 46:
#line 311 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr2;
		case 32: goto tr76;
		case 35: goto st4;
		case 60: goto st6;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr76;
	goto tr75;
st6:
	if ( ++p == pe )
		goto _test_eof6;
case 6:
	if ( (*p) == 63 )
		goto st7;
	goto tr7;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
	if ( (*p) == 114 )
		goto st8;
	goto tr6;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
	if ( (*p) == 32 )
		goto tr11;
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr11;
	goto tr6;
tr11:
#line 7 "ext/xrb/template.rl"
	{
		instruction.begin = p;
	}
	goto st9;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
#line 354 "ext/xrb/template.c"
	if ( (*p) == 63 )
		goto tr13;
	goto st9;
tr13:
#line 11 "ext/xrb/template.rl"
	{
		instruction.end = p;
	}
	goto st10;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
#line 368 "ext/xrb/template.c"
	if ( (*p) == 62 )
		goto st11;
	goto st9;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
	switch( (*p) ) {
		case 10: goto tr16;
		case 32: goto st11;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st11;
	goto tr15;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
	if ( (*p) == 123 )
		goto st47;
	goto tr7;
st47:
	if ( ++p == pe )
		goto _test_eof47;
case 47:
	goto tr84;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
	if ( (*p) == 63 )
		goto st14;
	goto tr7;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
	switch( (*p) ) {
		case 47: goto tr20;
		case 96: goto tr20;
		case 114: goto st18;
	}
	if ( (*p) < 59 ) {
		if ( 0 <= (*p) && (*p) <= 44 )
			goto tr20;
	} else if ( (*p) > 64 ) {
		if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr20;
		} else if ( (*p) >= 91 )
			goto tr20;
	} else
		goto tr20;
	goto st15;
st15:
	if ( ++p == pe )
		goto _test_eof15;
case 15:
	switch( (*p) ) {
		case 32: goto st16;
		case 47: goto tr20;
		case 96: goto tr20;
	}
	if ( (*p) < 14 ) {
		if ( (*p) > 8 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto st16;
		} else if ( (*p) >= 0 )
			goto tr20;
	} else if ( (*p) > 44 ) {
		if ( (*p) < 91 ) {
			if ( 59 <= (*p) && (*p) <= 64 )
				goto tr20;
		} else if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr20;
		} else
			goto tr20;
	} else
		goto tr20;
	goto st15;
tr20:
#line 23 "ext/xrb/template.rl"
	{
		XRB_raise_error("failed to parse instruction", buffer, p-s);
	}
	goto st0;
#line 456 "ext/xrb/template.c"
st0:
cs = 0;
	goto _out;
st16:
	if ( ++p == pe )
		goto _test_eof16;
case 16:
	if ( (*p) == 63 )
		goto st17;
	goto st16;
st17:
	if ( ++p == pe )
		goto _test_eof17;
case 17:
	if ( (*p) == 62 )
		goto tr24;
	goto st16;
st18:
	if ( ++p == pe )
		goto _test_eof18;
case 18:
	switch( (*p) ) {
		case 32: goto tr25;
		case 47: goto tr20;
		case 96: goto tr20;
	}
	if ( (*p) < 14 ) {
		if ( (*p) > 8 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto tr25;
		} else if ( (*p) >= 0 )
			goto tr20;
	} else if ( (*p) > 44 ) {
		if ( (*p) < 91 ) {
			if ( 59 <= (*p) && (*p) <= 64 )
				goto tr20;
		} else if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr20;
		} else
			goto tr20;
	} else
		goto tr20;
	goto st15;
tr25:
#line 7 "ext/xrb/template.rl"
	{
		instruction.begin = p;
	}
	goto st19;
st19:
	if ( ++p == pe )
		goto _test_eof19;
case 19:
#line 511 "ext/xrb/template.c"
	if ( (*p) == 63 )
		goto tr27;
	goto st19;
tr27:
#line 11 "ext/xrb/template.rl"
	{
		instruction.end = p;
	}
	goto st20;
st20:
	if ( ++p == pe )
		goto _test_eof20;
case 20:
#line 525 "ext/xrb/template.c"
	if ( (*p) == 62 )
		goto tr28;
	goto st19;
tr28:
#line 1 "NONE"
	{te = p+1;}
#line 15 "ext/xrb/template.rl"
	{act = 3;}
	goto st48;
st48:
	if ( ++p == pe )
		goto _test_eof48;
case 48:
#line 539 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr16;
		case 32: goto st11;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st11;
	goto tr85;
tr32:
#line 17 "parsers/xrb/template.rl"
	{{stack[top++] = 21;goto st21;}}
	goto st21;
st21:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof21;
case 21:
#line 557 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st22;
		case 39: goto st30;
		case 123: goto tr32;
		case 125: goto tr33;
	}
	goto st21;
tr48:
#line 13 "parsers/xrb/template.rl"
	{{stack[top++] = 22;goto st21;}}
	goto st22;
st22:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof22;
case 22:
#line 575 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st23;
		case 35: goto st29;
	}
	goto st22;
tr38:
#line 17 "parsers/xrb/template.rl"
	{{stack[top++] = 23;goto st21;}}
	goto st23;
tr40:
#line 13 "parsers/xrb/template.rl"
	{{stack[top++] = 23;goto st21;}}
#line 17 "parsers/xrb/template.rl"
	{{stack[top++] = 23;goto st21;}}
	goto st23;
st23:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof23;
case 23:
#line 597 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st24;
		case 39: goto st25;
		case 123: goto tr38;
		case 125: goto tr39;
	}
	goto st23;
st24:
	if ( ++p == pe )
		goto _test_eof24;
case 24:
	switch( (*p) ) {
		case 35: goto st24;
		case 39: goto st25;
		case 123: goto tr40;
		case 125: goto tr39;
	}
	goto st23;
tr47:
#line 13 "parsers/xrb/template.rl"
	{{stack[top++] = 25;goto st21;}}
	goto st25;
st25:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof25;
case 25:
#line 626 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st26;
		case 35: goto st28;
		case 39: goto st26;
	}
	goto st25;
tr44:
#line 17 "parsers/xrb/template.rl"
	{{stack[top++] = 26;goto st21;}}
	goto st26;
tr46:
#line 13 "parsers/xrb/template.rl"
	{{stack[top++] = 26;goto st21;}}
#line 17 "parsers/xrb/template.rl"
	{{stack[top++] = 26;goto st21;}}
	goto st26;
st26:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof26;
case 26:
#line 649 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st27;
		case 123: goto tr44;
		case 125: goto tr45;
	}
	goto st26;
st27:
	if ( ++p == pe )
		goto _test_eof27;
case 27:
	switch( (*p) ) {
		case 35: goto st27;
		case 123: goto tr46;
		case 125: goto tr45;
	}
	goto st26;
tr45:
#line 20 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st49;
st49:
	if ( ++p == pe )
		goto _test_eof49;
case 49:
#line 674 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st26;
		case 35: goto st28;
		case 39: goto st26;
	}
	goto st25;
st28:
	if ( ++p == pe )
		goto _test_eof28;
case 28:
	switch( (*p) ) {
		case 34: goto st26;
		case 35: goto st28;
		case 39: goto st26;
		case 123: goto tr47;
	}
	goto st25;
tr39:
#line 20 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st50;
st50:
	if ( ++p == pe )
		goto _test_eof50;
case 50:
#line 700 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st23;
		case 35: goto st29;
	}
	goto st22;
st29:
	if ( ++p == pe )
		goto _test_eof29;
case 29:
	switch( (*p) ) {
		case 34: goto st23;
		case 35: goto st29;
		case 123: goto tr48;
	}
	goto st22;
st30:
	if ( ++p == pe )
		goto _test_eof30;
case 30:
	if ( (*p) == 39 )
		goto st31;
	goto st30;
tr50:
#line 17 "parsers/xrb/template.rl"
	{{stack[top++] = 31;goto st21;}}
	goto st31;
st31:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof31;
case 31:
#line 733 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st25;
		case 123: goto tr50;
		case 125: goto tr51;
	}
	goto st31;
tr51:
#line 20 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st51;
st51:
	if ( ++p == pe )
		goto _test_eof51;
case 51:
#line 748 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st31;
	goto st30;
tr33:
#line 20 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st52;
st52:
	if ( ++p == pe )
		goto _test_eof52;
case 52:
#line 760 "ext/xrb/template.c"
	goto st0;
tr55:
#line 17 "parsers/xrb/template.rl"
	{{stack[top++] = 32;goto st21;}}
	goto st32;
st32:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof32;
case 32:
#line 772 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st33;
		case 39: goto st41;
		case 123: goto tr55;
		case 125: goto tr56;
	}
	goto st32;
tr71:
#line 13 "parsers/xrb/template.rl"
	{{stack[top++] = 33;goto st21;}}
	goto st33;
st33:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof33;
case 33:
#line 790 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st34;
		case 35: goto st40;
	}
	goto st33;
tr61:
#line 17 "parsers/xrb/template.rl"
	{{stack[top++] = 34;goto st21;}}
	goto st34;
tr63:
#line 13 "parsers/xrb/template.rl"
	{{stack[top++] = 34;goto st21;}}
#line 17 "parsers/xrb/template.rl"
	{{stack[top++] = 34;goto st21;}}
	goto st34;
st34:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof34;
case 34:
#line 812 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st35;
		case 39: goto st36;
		case 123: goto tr61;
		case 125: goto tr62;
	}
	goto st34;
st35:
	if ( ++p == pe )
		goto _test_eof35;
case 35:
	switch( (*p) ) {
		case 35: goto st35;
		case 39: goto st36;
		case 123: goto tr63;
		case 125: goto tr62;
	}
	goto st34;
tr70:
#line 13 "parsers/xrb/template.rl"
	{{stack[top++] = 36;goto st21;}}
	goto st36;
st36:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof36;
case 36:
#line 841 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st37;
		case 35: goto st39;
		case 39: goto st37;
	}
	goto st36;
tr67:
#line 17 "parsers/xrb/template.rl"
	{{stack[top++] = 37;goto st21;}}
	goto st37;
tr69:
#line 13 "parsers/xrb/template.rl"
	{{stack[top++] = 37;goto st21;}}
#line 17 "parsers/xrb/template.rl"
	{{stack[top++] = 37;goto st21;}}
	goto st37;
st37:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof37;
case 37:
#line 864 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st38;
		case 123: goto tr67;
		case 125: goto tr68;
	}
	goto st37;
st38:
	if ( ++p == pe )
		goto _test_eof38;
case 38:
	switch( (*p) ) {
		case 35: goto st38;
		case 123: goto tr69;
		case 125: goto tr68;
	}
	goto st37;
tr68:
	cs = 53;
#line 31 "ext/xrb/template.rl"
	{
		expression.end = p;
	}
#line 35 "ext/xrb/template.rl"
	{
		rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
	}
#line 21 "parsers/xrb/template.rl"
	{cs = 43;}
	goto _again;
st53:
	if ( ++p == pe )
		goto _test_eof53;
case 53:
#line 898 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st37;
		case 35: goto st39;
		case 39: goto st37;
	}
	goto st36;
st39:
	if ( ++p == pe )
		goto _test_eof39;
case 39:
	switch( (*p) ) {
		case 34: goto st37;
		case 35: goto st39;
		case 39: goto st37;
		case 123: goto tr70;
	}
	goto st36;
tr62:
	cs = 54;
#line 31 "ext/xrb/template.rl"
	{
		expression.end = p;
	}
#line 35 "ext/xrb/template.rl"
	{
		rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
	}
#line 21 "parsers/xrb/template.rl"
	{cs = 43;}
	goto _again;
st54:
	if ( ++p == pe )
		goto _test_eof54;
case 54:
#line 933 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st34;
		case 35: goto st40;
	}
	goto st33;
st40:
	if ( ++p == pe )
		goto _test_eof40;
case 40:
	switch( (*p) ) {
		case 34: goto st34;
		case 35: goto st40;
		case 123: goto tr71;
	}
	goto st33;
st41:
	if ( ++p == pe )
		goto _test_eof41;
case 41:
	if ( (*p) == 39 )
		goto st42;
	goto st41;
tr73:
#line 17 "parsers/xrb/template.rl"
	{{stack[top++] = 42;goto st21;}}
	goto st42;
st42:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof42;
case 42:
#line 966 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st36;
		case 123: goto tr73;
		case 125: goto tr74;
	}
	goto st42;
tr74:
	cs = 55;
#line 31 "ext/xrb/template.rl"
	{
		expression.end = p;
	}
#line 35 "ext/xrb/template.rl"
	{
		rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
	}
#line 21 "parsers/xrb/template.rl"
	{cs = 43;}
	goto _again;
st55:
	if ( ++p == pe )
		goto _test_eof55;
case 55:
#line 990 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st42;
	goto st41;
tr56:
	cs = 56;
#line 31 "ext/xrb/template.rl"
	{
		expression.end = p;
	}
#line 35 "ext/xrb/template.rl"
	{
		rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
	}
#line 21 "parsers/xrb/template.rl"
	{cs = 43;}
	goto _again;
st56:
	if ( ++p == pe )
		goto _test_eof56;
case 56:
#line 1011 "ext/xrb/template.c"
	goto st0;
	}
	_test_eof43: cs = 43; goto _test_eof; 
	_test_eof44: cs = 44; goto _test_eof; 
	_test_eof45: cs = 45; goto _test_eof; 
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof46: cs = 46; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 
	_test_eof12: cs = 12; goto _test_eof; 
	_test_eof47: cs = 47; goto _test_eof; 
	_test_eof13: cs = 13; goto _test_eof; 
	_test_eof14: cs = 14; goto _test_eof; 
	_test_eof15: cs = 15; goto _test_eof; 
	_test_eof16: cs = 16; goto _test_eof; 
	_test_eof17: cs = 17; goto _test_eof; 
	_test_eof18: cs = 18; goto _test_eof; 
	_test_eof19: cs = 19; goto _test_eof; 
	_test_eof20: cs = 20; goto _test_eof; 
	_test_eof48: cs = 48; goto _test_eof; 
	_test_eof21: cs = 21; goto _test_eof; 
	_test_eof22: cs = 22; goto _test_eof; 
	_test_eof23: cs = 23; goto _test_eof; 
	_test_eof24: cs = 24; goto _test_eof; 
	_test_eof25: cs = 25; goto _test_eof; 
	_test_eof26: cs = 26; goto _test_eof; 
	_test_eof27: cs = 27; goto _test_eof; 
	_test_eof49: cs = 49; goto _test_eof; 
	_test_eof28: cs = 28; goto _test_eof; 
	_test_eof50: cs = 50; goto _test_eof; 
	_test_eof29: cs = 29; goto _test_eof; 
	_test_eof30: cs = 30; goto _test_eof; 
	_test_eof31: cs = 31; goto _test_eof; 
	_test_eof51: cs = 51; goto _test_eof; 
	_test_eof52: cs = 52; goto _test_eof; 
	_test_eof32: cs = 32; goto _test_eof; 
	_test_eof33: cs = 33; goto _test_eof; 
	_test_eof34: cs = 34; goto _test_eof; 
	_test_eof35: cs = 35; goto _test_eof; 
	_test_eof36: cs = 36; goto _test_eof; 
	_test_eof37: cs = 37; goto _test_eof; 
	_test_eof38: cs = 38; goto _test_eof; 
	_test_eof53: cs = 53; goto _test_eof; 
	_test_eof39: cs = 39; goto _test_eof; 
	_test_eof54: cs = 54; goto _test_eof; 
	_test_eof40: cs = 40; goto _test_eof; 
	_test_eof41: cs = 41; goto _test_eof; 
	_test_eof42: cs = 42; goto _test_eof; 
	_test_eof55: cs = 55; goto _test_eof; 
	_test_eof56: cs = 56; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 44: goto tr79;
	case 45: goto tr82;
	case 1: goto tr0;
	case 2: goto tr0;
	case 3: goto tr0;
	case 4: goto tr6;
	case 5: goto tr6;
	case 46: goto tr79;
	case 6: goto tr6;
	case 7: goto tr6;
	case 8: goto tr10;
	case 9: goto tr10;
	case 10: goto tr10;
	case 11: goto tr15;
	case 47: goto tr84;
	case 48: goto tr85;
	case 14: 
	case 15: 
	case 16: 
	case 17: 
	case 18: 
	case 19: 
	case 20: 
#line 23 "ext/xrb/template.rl"
	{
		XRB_raise_error("failed to parse instruction", buffer, p-s);
	}
	break;
	case 32: 
	case 33: 
	case 34: 
	case 35: 
	case 36: 
	case 37: 
	case 38: 
	case 39: 
	case 40: 
	case 41: 
	case 42: 
#line 39 "ext/xrb/template.rl"
	{
		XRB_raise_error("failed to parse expression", buffer, p-s);
	}
	break;
#line 1119 "ext/xrb/template.c"
	}
	}

	_out: {}
	}

#line 70 "ext/xrb/template.rl"

	
	if (p != eof) {
		XRB_raise_error("could not parse all input", buffer, p-s);
	}
	
	return Qnil;
}
