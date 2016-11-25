
#line 1 "template.rl"

#include "template.h"


#line 8 "template.c"
static const int Trenni_template_parser_start = 45;
static const int Trenni_template_parser_first_final = 45;
static const int Trenni_template_parser_error = 0;

static const int Trenni_template_parser_en_parse_nested_expression = 23;
static const int Trenni_template_parser_en_parse_expression = 34;
static const int Trenni_template_parser_en_main = 45;


#line 50 "template.rl"


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
	
	
#line 42 "template.c"
	{
	cs = Trenni_template_parser_start;
	top = 0;
	ts = 0;
	te = 0;
	act = 0;
	}

#line 51 "template.c"
	{
	if ( p == pe )
		goto _test_eof;
	goto _resume;

_again:
	switch ( cs ) {
		case 45: goto st45;
		case 46: goto st46;
		case 47: goto st47;
		case 1: goto st1;
		case 2: goto st2;
		case 3: goto st3;
		case 4: goto st4;
		case 5: goto st5;
		case 48: goto st48;
		case 6: goto st6;
		case 7: goto st7;
		case 8: goto st8;
		case 9: goto st9;
		case 10: goto st10;
		case 11: goto st11;
		case 12: goto st12;
		case 49: goto st49;
		case 13: goto st13;
		case 50: goto st50;
		case 14: goto st14;
		case 15: goto st15;
		case 16: goto st16;
		case 0: goto st0;
		case 17: goto st17;
		case 18: goto st18;
		case 19: goto st19;
		case 20: goto st20;
		case 21: goto st21;
		case 22: goto st22;
		case 23: goto st23;
		case 24: goto st24;
		case 25: goto st25;
		case 26: goto st26;
		case 27: goto st27;
		case 28: goto st28;
		case 29: goto st29;
		case 51: goto st51;
		case 30: goto st30;
		case 52: goto st52;
		case 31: goto st31;
		case 32: goto st32;
		case 33: goto st33;
		case 53: goto st53;
		case 54: goto st54;
		case 34: goto st34;
		case 35: goto st35;
		case 36: goto st36;
		case 37: goto st37;
		case 38: goto st38;
		case 39: goto st39;
		case 40: goto st40;
		case 55: goto st55;
		case 41: goto st41;
		case 56: goto st56;
		case 42: goto st42;
		case 43: goto st43;
		case 44: goto st44;
		case 57: goto st57;
		case 58: goto st58;
	default: break;
	}

	if ( ++p == pe )
		goto _test_eof;
_resume:
	switch ( cs )
	{
tr0:
#line 43 "template.rl"
	{{p = ((te))-1;}{
		rb_funcall(delegate, id_text, 1, Trenni_string(ts, te));
	}}
	goto st45;
tr5:
#line 43 "template.rl"
	{{p = ((te))-1;}{
		rb_funcall(delegate, id_text, 1, Trenni_string(ts, te));
	}}
	goto st45;
tr9:
#line 23 "template.rl"
	{
		Trenni_raise_error("failed to parse instruction", buffer, p-s);
	}
#line 43 "template.rl"
	{{p = ((te))-1;}{
		rb_funcall(delegate, id_text, 1, Trenni_string(ts, te));
	}}
	goto st45;
tr17:
#line 1 "NONE"
	{	switch( act ) {
	case 1:
	{{p = ((te))-1;}
		rb_funcall(delegate, id_instruction, 2, Trenni_token(instruction), newline);
	}
	break;
	case 3:
	{{p = ((te))-1;}
		rb_funcall(delegate, id_instruction, 1, Trenni_token(instruction));
	}
	break;
	case 6:
	{{p = ((te))-1;}
		rb_funcall(delegate, id_text, 1, Trenni_string(ts, te));
	}
	break;
	}
	}
	goto st45;
tr26:
#line 43 "template.rl"
	{te = p+1;{
		rb_funcall(delegate, id_text, 1, Trenni_string(ts, te));
	}}
	goto st45;
tr83:
#line 43 "template.rl"
	{te = p;p--;{
		rb_funcall(delegate, id_text, 1, Trenni_string(ts, te));
	}}
	goto st45;
tr86:
#line 43 "template.rl"
	{te = p;p--;{
		rb_funcall(delegate, id_text, 1, Trenni_string(ts, te));
	}}
	goto st45;
tr88:
	cs = 45;
#line 27 "template.rl"
	{
		expression.begin = p;
	}
#line 53 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{te = p;p--;{cs = 34;}}
	goto _again;
st45:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof45;
case 45:
#line 1 "NONE"
	{ts = p;}
#line 204 "template.c"
	switch( (*p) ) {
		case 10: goto tr2;
		case 32: goto tr80;
		case 35: goto st13;
		case 60: goto st14;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr80;
	goto tr6;
tr6:
#line 1 "NONE"
	{te = p+1;}
	goto st46;
st46:
	if ( ++p == pe )
		goto _test_eof46;
case 46:
#line 222 "template.c"
	switch( (*p) ) {
		case 10: goto tr2;
		case 35: goto st4;
		case 60: goto st5;
	}
	goto tr6;
tr2:
#line 1 "NONE"
	{te = p+1;}
	goto st47;
st47:
	if ( ++p == pe )
		goto _test_eof47;
case 47:
#line 237 "template.c"
	switch( (*p) ) {
		case 10: goto tr2;
		case 35: goto st2;
		case 60: goto st3;
	}
	goto st1;
st1:
	if ( ++p == pe )
		goto _test_eof1;
case 1:
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
	goto st1;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
	if ( (*p) == 63 )
		goto tr0;
	goto st1;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
	if ( (*p) == 123 )
		goto tr5;
	goto tr6;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
	if ( (*p) == 63 )
		goto tr5;
	goto tr6;
tr80:
#line 1 "NONE"
	{te = p+1;}
#line 43 "template.rl"
	{act = 6;}
	goto st48;
st48:
	if ( ++p == pe )
		goto _test_eof48;
case 48:
#line 292 "template.c"
	switch( (*p) ) {
		case 10: goto tr2;
		case 32: goto tr80;
		case 35: goto st4;
		case 60: goto st6;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr80;
	goto tr6;
st6:
	if ( ++p == pe )
		goto _test_eof6;
case 6:
	if ( (*p) == 63 )
		goto st7;
	goto tr6;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
	if ( (*p) == 114 )
		goto st8;
	goto tr5;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
	if ( (*p) == 32 )
		goto st9;
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st9;
	goto tr5;
tr12:
#line 7 "template.rl"
	{
		instruction.begin = p;
	}
	goto st9;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
#line 335 "template.c"
	switch( (*p) ) {
		case 32: goto tr12;
		case 63: goto tr13;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr12;
	goto tr11;
tr11:
#line 7 "template.rl"
	{
		instruction.begin = p;
	}
	goto st10;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
#line 353 "template.c"
	if ( (*p) == 63 )
		goto tr15;
	goto st10;
tr13:
#line 7 "template.rl"
	{
		instruction.begin = p;
	}
#line 11 "template.rl"
	{
		instruction.end = p;
	}
	goto st11;
tr15:
#line 11 "template.rl"
	{
		instruction.end = p;
	}
	goto st11;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
#line 377 "template.c"
	if ( (*p) == 62 )
		goto st12;
	goto st10;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
	switch( (*p) ) {
		case 10: goto tr18;
		case 32: goto st12;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st12;
	goto tr17;
tr18:
#line 1 "NONE"
	{te = p+1;}
#line 19 "template.rl"
	{act = 1;}
	goto st49;
tr33:
#line 1 "NONE"
	{te = p+1;}
#line 15 "template.rl"
	{act = 3;}
	goto st49;
st49:
	if ( ++p == pe )
		goto _test_eof49;
case 49:
#line 408 "template.c"
	switch( (*p) ) {
		case 10: goto tr18;
		case 32: goto st12;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st12;
	goto tr17;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
	if ( (*p) == 123 )
		goto st50;
	goto tr6;
st50:
	if ( ++p == pe )
		goto _test_eof50;
case 50:
	goto tr88;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
	if ( (*p) == 63 )
		goto st15;
	goto tr6;
st15:
	if ( ++p == pe )
		goto _test_eof15;
case 15:
	switch( (*p) ) {
		case 47: goto tr22;
		case 96: goto tr22;
		case 114: goto st19;
	}
	if ( (*p) < 59 ) {
		if ( 0 <= (*p) && (*p) <= 44 )
			goto tr22;
	} else if ( (*p) > 64 ) {
		if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr22;
		} else if ( (*p) >= 91 )
			goto tr22;
	} else
		goto tr22;
	goto st16;
st16:
	if ( ++p == pe )
		goto _test_eof16;
case 16:
	switch( (*p) ) {
		case 32: goto st17;
		case 47: goto tr22;
		case 96: goto tr22;
	}
	if ( (*p) < 14 ) {
		if ( (*p) > 8 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto st17;
		} else if ( (*p) >= 0 )
			goto tr22;
	} else if ( (*p) > 44 ) {
		if ( (*p) < 91 ) {
			if ( 59 <= (*p) && (*p) <= 64 )
				goto tr22;
		} else if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr22;
		} else
			goto tr22;
	} else
		goto tr22;
	goto st16;
tr22:
#line 23 "template.rl"
	{
		Trenni_raise_error("failed to parse instruction", buffer, p-s);
	}
	goto st0;
#line 489 "template.c"
st0:
cs = 0;
	goto _out;
st17:
	if ( ++p == pe )
		goto _test_eof17;
case 17:
	if ( (*p) == 63 )
		goto st18;
	goto st17;
st18:
	if ( ++p == pe )
		goto _test_eof18;
case 18:
	if ( (*p) == 62 )
		goto tr26;
	goto st17;
st19:
	if ( ++p == pe )
		goto _test_eof19;
case 19:
	switch( (*p) ) {
		case 32: goto st20;
		case 47: goto tr22;
		case 96: goto tr22;
	}
	if ( (*p) < 14 ) {
		if ( (*p) > 8 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto st20;
		} else if ( (*p) >= 0 )
			goto tr22;
	} else if ( (*p) > 44 ) {
		if ( (*p) < 91 ) {
			if ( 59 <= (*p) && (*p) <= 64 )
				goto tr22;
		} else if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr22;
		} else
			goto tr22;
	} else
		goto tr22;
	goto st16;
tr29:
#line 7 "template.rl"
	{
		instruction.begin = p;
	}
	goto st20;
st20:
	if ( ++p == pe )
		goto _test_eof20;
case 20:
#line 544 "template.c"
	switch( (*p) ) {
		case 32: goto tr29;
		case 63: goto tr30;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr29;
	goto tr28;
tr28:
#line 7 "template.rl"
	{
		instruction.begin = p;
	}
	goto st21;
st21:
	if ( ++p == pe )
		goto _test_eof21;
case 21:
#line 562 "template.c"
	if ( (*p) == 63 )
		goto tr32;
	goto st21;
tr30:
#line 7 "template.rl"
	{
		instruction.begin = p;
	}
#line 11 "template.rl"
	{
		instruction.end = p;
	}
	goto st22;
tr32:
#line 11 "template.rl"
	{
		instruction.end = p;
	}
	goto st22;
st22:
	if ( ++p == pe )
		goto _test_eof22;
case 22:
#line 586 "template.c"
	if ( (*p) == 62 )
		goto tr33;
	goto st21;
tr37:
#line 17 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 23; goto st23;}}
	goto st23;
st23:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof23;
case 23:
#line 600 "template.c"
	switch( (*p) ) {
		case 34: goto st24;
		case 39: goto st32;
		case 123: goto tr37;
		case 125: goto tr38;
	}
	goto st23;
tr53:
#line 13 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 24; goto st23;}}
	goto st24;
st24:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof24;
case 24:
#line 618 "template.c"
	switch( (*p) ) {
		case 34: goto st25;
		case 35: goto st31;
	}
	goto st24;
tr43:
#line 17 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 25; goto st23;}}
	goto st25;
tr45:
#line 13 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 25; goto st23;}}
#line 17 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 25; goto st23;}}
	goto st25;
st25:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof25;
case 25:
#line 640 "template.c"
	switch( (*p) ) {
		case 35: goto st26;
		case 39: goto st27;
		case 123: goto tr43;
		case 125: goto tr44;
	}
	goto st25;
st26:
	if ( ++p == pe )
		goto _test_eof26;
case 26:
	switch( (*p) ) {
		case 35: goto st26;
		case 39: goto st27;
		case 123: goto tr45;
		case 125: goto tr44;
	}
	goto st25;
tr52:
#line 13 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 27; goto st23;}}
	goto st27;
st27:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof27;
case 27:
#line 669 "template.c"
	switch( (*p) ) {
		case 34: goto st28;
		case 35: goto st30;
		case 39: goto st28;
	}
	goto st27;
tr49:
#line 17 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 28; goto st23;}}
	goto st28;
tr51:
#line 13 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 28; goto st23;}}
#line 17 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 28; goto st23;}}
	goto st28;
st28:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof28;
case 28:
#line 692 "template.c"
	switch( (*p) ) {
		case 35: goto st29;
		case 123: goto tr49;
		case 125: goto tr50;
	}
	goto st28;
st29:
	if ( ++p == pe )
		goto _test_eof29;
case 29:
	switch( (*p) ) {
		case 35: goto st29;
		case 123: goto tr51;
		case 125: goto tr50;
	}
	goto st28;
tr50:
#line 20 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st51;
st51:
	if ( ++p == pe )
		goto _test_eof51;
case 51:
#line 717 "template.c"
	switch( (*p) ) {
		case 34: goto st28;
		case 35: goto st30;
		case 39: goto st28;
	}
	goto st27;
st30:
	if ( ++p == pe )
		goto _test_eof30;
case 30:
	switch( (*p) ) {
		case 34: goto st28;
		case 35: goto st30;
		case 39: goto st28;
		case 123: goto tr52;
	}
	goto st27;
tr44:
#line 20 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st52;
st52:
	if ( ++p == pe )
		goto _test_eof52;
case 52:
#line 743 "template.c"
	switch( (*p) ) {
		case 34: goto st25;
		case 35: goto st31;
	}
	goto st24;
st31:
	if ( ++p == pe )
		goto _test_eof31;
case 31:
	switch( (*p) ) {
		case 34: goto st25;
		case 35: goto st31;
		case 123: goto tr53;
	}
	goto st24;
st32:
	if ( ++p == pe )
		goto _test_eof32;
case 32:
	if ( (*p) == 39 )
		goto st33;
	goto st32;
tr55:
#line 17 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 33; goto st23;}}
	goto st33;
st33:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof33;
case 33:
#line 776 "template.c"
	switch( (*p) ) {
		case 34: goto st27;
		case 123: goto tr55;
		case 125: goto tr56;
	}
	goto st33;
tr56:
#line 20 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st53;
st53:
	if ( ++p == pe )
		goto _test_eof53;
case 53:
#line 791 "template.c"
	if ( (*p) == 39 )
		goto st33;
	goto st32;
tr38:
#line 20 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st54;
st54:
	if ( ++p == pe )
		goto _test_eof54;
case 54:
#line 803 "template.c"
	goto st0;
tr60:
#line 17 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 34; goto st23;}}
	goto st34;
st34:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof34;
case 34:
#line 815 "template.c"
	switch( (*p) ) {
		case 34: goto st35;
		case 39: goto st43;
		case 123: goto tr60;
		case 125: goto tr61;
	}
	goto st34;
tr76:
#line 13 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 35; goto st23;}}
	goto st35;
st35:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof35;
case 35:
#line 833 "template.c"
	switch( (*p) ) {
		case 34: goto st36;
		case 35: goto st42;
	}
	goto st35;
tr66:
#line 17 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 36; goto st23;}}
	goto st36;
tr68:
#line 13 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 36; goto st23;}}
#line 17 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 36; goto st23;}}
	goto st36;
st36:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof36;
case 36:
#line 855 "template.c"
	switch( (*p) ) {
		case 35: goto st37;
		case 39: goto st38;
		case 123: goto tr66;
		case 125: goto tr67;
	}
	goto st36;
st37:
	if ( ++p == pe )
		goto _test_eof37;
case 37:
	switch( (*p) ) {
		case 35: goto st37;
		case 39: goto st38;
		case 123: goto tr68;
		case 125: goto tr67;
	}
	goto st36;
tr75:
#line 13 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 38; goto st23;}}
	goto st38;
st38:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof38;
case 38:
#line 884 "template.c"
	switch( (*p) ) {
		case 34: goto st39;
		case 35: goto st41;
		case 39: goto st39;
	}
	goto st38;
tr72:
#line 17 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 39; goto st23;}}
	goto st39;
tr74:
#line 13 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 39; goto st23;}}
#line 17 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 39; goto st23;}}
	goto st39;
st39:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof39;
case 39:
#line 907 "template.c"
	switch( (*p) ) {
		case 35: goto st40;
		case 123: goto tr72;
		case 125: goto tr73;
	}
	goto st39;
st40:
	if ( ++p == pe )
		goto _test_eof40;
case 40:
	switch( (*p) ) {
		case 35: goto st40;
		case 123: goto tr74;
		case 125: goto tr73;
	}
	goto st39;
tr73:
	cs = 55;
#line 31 "template.rl"
	{
		expression.end = p;
	}
#line 35 "template.rl"
	{
		rb_funcall(delegate, id_expression, 1, Trenni_token(expression));
	}
#line 21 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{cs = 45;}
	goto _again;
st55:
	if ( ++p == pe )
		goto _test_eof55;
case 55:
#line 941 "template.c"
	switch( (*p) ) {
		case 34: goto st39;
		case 35: goto st41;
		case 39: goto st39;
	}
	goto st38;
st41:
	if ( ++p == pe )
		goto _test_eof41;
case 41:
	switch( (*p) ) {
		case 34: goto st39;
		case 35: goto st41;
		case 39: goto st39;
		case 123: goto tr75;
	}
	goto st38;
tr67:
	cs = 56;
#line 31 "template.rl"
	{
		expression.end = p;
	}
#line 35 "template.rl"
	{
		rb_funcall(delegate, id_expression, 1, Trenni_token(expression));
	}
#line 21 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{cs = 45;}
	goto _again;
st56:
	if ( ++p == pe )
		goto _test_eof56;
case 56:
#line 976 "template.c"
	switch( (*p) ) {
		case 34: goto st36;
		case 35: goto st42;
	}
	goto st35;
st42:
	if ( ++p == pe )
		goto _test_eof42;
case 42:
	switch( (*p) ) {
		case 34: goto st36;
		case 35: goto st42;
		case 123: goto tr76;
	}
	goto st35;
st43:
	if ( ++p == pe )
		goto _test_eof43;
case 43:
	if ( (*p) == 39 )
		goto st44;
	goto st43;
tr78:
#line 17 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 44; goto st23;}}
	goto st44;
st44:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof44;
case 44:
#line 1009 "template.c"
	switch( (*p) ) {
		case 34: goto st38;
		case 123: goto tr78;
		case 125: goto tr79;
	}
	goto st44;
tr79:
	cs = 57;
#line 31 "template.rl"
	{
		expression.end = p;
	}
#line 35 "template.rl"
	{
		rb_funcall(delegate, id_expression, 1, Trenni_token(expression));
	}
#line 21 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{cs = 45;}
	goto _again;
st57:
	if ( ++p == pe )
		goto _test_eof57;
case 57:
#line 1033 "template.c"
	if ( (*p) == 39 )
		goto st44;
	goto st43;
tr61:
	cs = 58;
#line 31 "template.rl"
	{
		expression.end = p;
	}
#line 35 "template.rl"
	{
		rb_funcall(delegate, id_expression, 1, Trenni_token(expression));
	}
#line 21 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{cs = 45;}
	goto _again;
st58:
	if ( ++p == pe )
		goto _test_eof58;
case 58:
#line 1054 "template.c"
	goto st0;
	}
	_test_eof45: cs = 45; goto _test_eof; 
	_test_eof46: cs = 46; goto _test_eof; 
	_test_eof47: cs = 47; goto _test_eof; 
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof48: cs = 48; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 
	_test_eof12: cs = 12; goto _test_eof; 
	_test_eof49: cs = 49; goto _test_eof; 
	_test_eof13: cs = 13; goto _test_eof; 
	_test_eof50: cs = 50; goto _test_eof; 
	_test_eof14: cs = 14; goto _test_eof; 
	_test_eof15: cs = 15; goto _test_eof; 
	_test_eof16: cs = 16; goto _test_eof; 
	_test_eof17: cs = 17; goto _test_eof; 
	_test_eof18: cs = 18; goto _test_eof; 
	_test_eof19: cs = 19; goto _test_eof; 
	_test_eof20: cs = 20; goto _test_eof; 
	_test_eof21: cs = 21; goto _test_eof; 
	_test_eof22: cs = 22; goto _test_eof; 
	_test_eof23: cs = 23; goto _test_eof; 
	_test_eof24: cs = 24; goto _test_eof; 
	_test_eof25: cs = 25; goto _test_eof; 
	_test_eof26: cs = 26; goto _test_eof; 
	_test_eof27: cs = 27; goto _test_eof; 
	_test_eof28: cs = 28; goto _test_eof; 
	_test_eof29: cs = 29; goto _test_eof; 
	_test_eof51: cs = 51; goto _test_eof; 
	_test_eof30: cs = 30; goto _test_eof; 
	_test_eof52: cs = 52; goto _test_eof; 
	_test_eof31: cs = 31; goto _test_eof; 
	_test_eof32: cs = 32; goto _test_eof; 
	_test_eof33: cs = 33; goto _test_eof; 
	_test_eof53: cs = 53; goto _test_eof; 
	_test_eof54: cs = 54; goto _test_eof; 
	_test_eof34: cs = 34; goto _test_eof; 
	_test_eof35: cs = 35; goto _test_eof; 
	_test_eof36: cs = 36; goto _test_eof; 
	_test_eof37: cs = 37; goto _test_eof; 
	_test_eof38: cs = 38; goto _test_eof; 
	_test_eof39: cs = 39; goto _test_eof; 
	_test_eof40: cs = 40; goto _test_eof; 
	_test_eof55: cs = 55; goto _test_eof; 
	_test_eof41: cs = 41; goto _test_eof; 
	_test_eof56: cs = 56; goto _test_eof; 
	_test_eof42: cs = 42; goto _test_eof; 
	_test_eof43: cs = 43; goto _test_eof; 
	_test_eof44: cs = 44; goto _test_eof; 
	_test_eof57: cs = 57; goto _test_eof; 
	_test_eof58: cs = 58; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 46: goto tr83;
	case 47: goto tr86;
	case 1: goto tr0;
	case 2: goto tr0;
	case 3: goto tr0;
	case 4: goto tr5;
	case 5: goto tr5;
	case 48: goto tr83;
	case 6: goto tr5;
	case 7: goto tr5;
	case 8: goto tr9;
	case 9: goto tr9;
	case 10: goto tr9;
	case 11: goto tr9;
	case 12: goto tr17;
	case 49: goto tr17;
	case 50: goto tr88;
	case 15: 
	case 16: 
	case 17: 
	case 18: 
	case 19: 
	case 20: 
	case 21: 
	case 22: 
#line 23 "template.rl"
	{
		Trenni_raise_error("failed to parse instruction", buffer, p-s);
	}
	break;
	case 34: 
	case 35: 
	case 36: 
	case 37: 
	case 38: 
	case 39: 
	case 40: 
	case 41: 
	case 42: 
	case 43: 
	case 44: 
#line 39 "template.rl"
	{
		Trenni_raise_error("failed to parse expression", buffer, p-s);
	}
	break;
#line 1166 "template.c"
	}
	}

	_out: {}
	}

#line 75 "template.rl"

	
	if (p != eof) {
		Trenni_raise_error("could not parse all input", buffer, p-s);
	}
	
	return Qnil;
}
