
#line 1 "template.rl"

#include "template.h"


#line 8 "template.c"
static const int Trenni_template_parser_start = 42;
static const int Trenni_template_parser_first_final = 42;
static const int Trenni_template_parser_error = 0;

static const int Trenni_template_parser_en_parse_nested_expression = 20;
static const int Trenni_template_parser_en_parse_expression = 31;
static const int Trenni_template_parser_en_main = 42;


#line 46 "template.rl"


void Trenni_Native_parse_template(VALUE self, VALUE buffer, VALUE delegate) {
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
		case 42: goto st42;
		case 43: goto st43;
		case 44: goto st44;
		case 1: goto st1;
		case 2: goto st2;
		case 3: goto st3;
		case 4: goto st4;
		case 5: goto st5;
		case 45: goto st45;
		case 6: goto st6;
		case 7: goto st7;
		case 8: goto st8;
		case 9: goto st9;
		case 10: goto st10;
		case 11: goto st11;
		case 12: goto st12;
		case 46: goto st46;
		case 13: goto st13;
		case 47: goto st47;
		case 14: goto st14;
		case 15: goto st15;
		case 0: goto st0;
		case 16: goto st16;
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
		case 48: goto st48;
		case 27: goto st27;
		case 49: goto st49;
		case 28: goto st28;
		case 29: goto st29;
		case 30: goto st30;
		case 50: goto st50;
		case 51: goto st51;
		case 31: goto st31;
		case 32: goto st32;
		case 33: goto st33;
		case 34: goto st34;
		case 35: goto st35;
		case 36: goto st36;
		case 37: goto st37;
		case 52: goto st52;
		case 38: goto st38;
		case 53: goto st53;
		case 39: goto st39;
		case 40: goto st40;
		case 41: goto st41;
		case 54: goto st54;
		case 55: goto st55;
	default: break;
	}

	if ( ++p == pe )
		goto _test_eof;
_resume:
	switch ( cs )
	{
tr0:
#line 39 "template.rl"
	{{p = ((te))-1;}{
		rb_funcall(delegate, rb_intern("text"), 1, Trenni_string(ts, te));
	}}
	goto st42;
tr5:
#line 39 "template.rl"
	{{p = ((te))-1;}{
		rb_funcall(delegate, rb_intern("text"), 1, Trenni_string(ts, te));
	}}
	goto st42;
tr16:
#line 1 "NONE"
	{	switch( act ) {
	case 1:
	{{p = ((te))-1;}
		rb_funcall(delegate, rb_intern("instruction"), 2, Trenni_token(instruction), newline);
	}
	break;
	case 3:
	{{p = ((te))-1;}
		rb_funcall(delegate, rb_intern("instruction"), 1, Trenni_token(instruction));
	}
	break;
	case 5:
	{{p = ((te))-1;}
		rb_funcall(delegate, rb_intern("text"), 1, Trenni_string(ts, te));
	}
	break;
	}
	}
	goto st42;
tr78:
#line 39 "template.rl"
	{te = p;p--;{
		rb_funcall(delegate, rb_intern("text"), 1, Trenni_string(ts, te));
	}}
	goto st42;
tr81:
#line 39 "template.rl"
	{te = p;p--;{
		rb_funcall(delegate, rb_intern("text"), 1, Trenni_string(ts, te));
	}}
	goto st42;
tr83:
	cs = 42;
#line 23 "template.rl"
	{
		expression.begin = p;
	}
#line 47 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{te = p;p--;{cs = 31;}}
	goto _again;
st42:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof42;
case 42:
#line 1 "NONE"
	{ts = p;}
#line 185 "template.c"
	switch( (*p) ) {
		case 10: goto tr2;
		case 32: goto tr75;
		case 35: goto st13;
		case 60: goto st14;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr75;
	goto tr6;
tr6:
#line 1 "NONE"
	{te = p+1;}
	goto st43;
st43:
	if ( ++p == pe )
		goto _test_eof43;
case 43:
#line 203 "template.c"
	switch( (*p) ) {
		case 10: goto tr2;
		case 35: goto st4;
		case 60: goto st5;
	}
	goto tr6;
tr2:
#line 1 "NONE"
	{te = p+1;}
	goto st44;
st44:
	if ( ++p == pe )
		goto _test_eof44;
case 44:
#line 218 "template.c"
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
tr75:
#line 1 "NONE"
	{te = p+1;}
#line 39 "template.rl"
	{act = 5;}
	goto st45;
st45:
	if ( ++p == pe )
		goto _test_eof45;
case 45:
#line 273 "template.c"
	switch( (*p) ) {
		case 10: goto tr2;
		case 32: goto tr75;
		case 35: goto st4;
		case 60: goto st6;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr75;
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
tr11:
#line 7 "template.rl"
	{
		instruction.begin = p;
	}
	goto st9;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
#line 316 "template.c"
	switch( (*p) ) {
		case 32: goto tr11;
		case 63: goto tr12;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr11;
	goto tr10;
tr10:
#line 7 "template.rl"
	{
		instruction.begin = p;
	}
	goto st10;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
#line 334 "template.c"
	if ( (*p) == 63 )
		goto tr14;
	goto st10;
tr12:
#line 7 "template.rl"
	{
		instruction.begin = p;
	}
#line 11 "template.rl"
	{
		instruction.end = p;
	}
	goto st11;
tr14:
#line 11 "template.rl"
	{
		instruction.end = p;
	}
	goto st11;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
#line 358 "template.c"
	if ( (*p) == 62 )
		goto st12;
	goto st10;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
	switch( (*p) ) {
		case 10: goto tr17;
		case 32: goto st12;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st12;
	goto tr16;
tr17:
#line 1 "NONE"
	{te = p+1;}
#line 19 "template.rl"
	{act = 1;}
	goto st46;
tr28:
#line 1 "NONE"
	{te = p+1;}
#line 15 "template.rl"
	{act = 3;}
	goto st46;
st46:
	if ( ++p == pe )
		goto _test_eof46;
case 46:
#line 389 "template.c"
	switch( (*p) ) {
		case 10: goto tr17;
		case 32: goto st12;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st12;
	goto tr16;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
	if ( (*p) == 123 )
		goto st47;
	goto tr6;
st47:
	if ( ++p == pe )
		goto _test_eof47;
case 47:
	goto tr83;
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
	if ( (*p) == 114 )
		goto st16;
	goto st0;
st0:
cs = 0;
	goto _out;
st16:
	if ( ++p == pe )
		goto _test_eof16;
case 16:
	if ( (*p) == 32 )
		goto st17;
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st17;
	goto st0;
tr24:
#line 7 "template.rl"
	{
		instruction.begin = p;
	}
	goto st17;
st17:
	if ( ++p == pe )
		goto _test_eof17;
case 17:
#line 445 "template.c"
	switch( (*p) ) {
		case 32: goto tr24;
		case 63: goto tr25;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr24;
	goto tr23;
tr23:
#line 7 "template.rl"
	{
		instruction.begin = p;
	}
	goto st18;
st18:
	if ( ++p == pe )
		goto _test_eof18;
case 18:
#line 463 "template.c"
	if ( (*p) == 63 )
		goto tr27;
	goto st18;
tr25:
#line 7 "template.rl"
	{
		instruction.begin = p;
	}
#line 11 "template.rl"
	{
		instruction.end = p;
	}
	goto st19;
tr27:
#line 11 "template.rl"
	{
		instruction.end = p;
	}
	goto st19;
st19:
	if ( ++p == pe )
		goto _test_eof19;
case 19:
#line 487 "template.c"
	if ( (*p) == 62 )
		goto tr28;
	goto st18;
tr32:
#line 15 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 20; goto st20;}}
	goto st20;
st20:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof20;
case 20:
#line 501 "template.c"
	switch( (*p) ) {
		case 34: goto st21;
		case 39: goto st29;
		case 123: goto tr32;
		case 125: goto tr33;
	}
	goto st20;
tr48:
#line 11 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 21; goto st20;}}
	goto st21;
st21:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof21;
case 21:
#line 519 "template.c"
	switch( (*p) ) {
		case 34: goto st22;
		case 35: goto st28;
	}
	goto st21;
tr38:
#line 15 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 22; goto st20;}}
	goto st22;
tr40:
#line 11 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 22; goto st20;}}
#line 15 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 22; goto st20;}}
	goto st22;
st22:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof22;
case 22:
#line 541 "template.c"
	switch( (*p) ) {
		case 35: goto st23;
		case 39: goto st24;
		case 123: goto tr38;
		case 125: goto tr39;
	}
	goto st22;
st23:
	if ( ++p == pe )
		goto _test_eof23;
case 23:
	switch( (*p) ) {
		case 35: goto st23;
		case 39: goto st24;
		case 123: goto tr40;
		case 125: goto tr39;
	}
	goto st22;
tr47:
#line 11 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 24; goto st20;}}
	goto st24;
st24:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof24;
case 24:
#line 570 "template.c"
	switch( (*p) ) {
		case 34: goto st25;
		case 35: goto st27;
		case 39: goto st25;
	}
	goto st24;
tr44:
#line 15 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 25; goto st20;}}
	goto st25;
tr46:
#line 11 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 25; goto st20;}}
#line 15 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 25; goto st20;}}
	goto st25;
st25:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof25;
case 25:
#line 593 "template.c"
	switch( (*p) ) {
		case 35: goto st26;
		case 123: goto tr44;
		case 125: goto tr45;
	}
	goto st25;
st26:
	if ( ++p == pe )
		goto _test_eof26;
case 26:
	switch( (*p) ) {
		case 35: goto st26;
		case 123: goto tr46;
		case 125: goto tr45;
	}
	goto st25;
tr45:
#line 18 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st48;
st48:
	if ( ++p == pe )
		goto _test_eof48;
case 48:
#line 618 "template.c"
	switch( (*p) ) {
		case 34: goto st25;
		case 35: goto st27;
		case 39: goto st25;
	}
	goto st24;
st27:
	if ( ++p == pe )
		goto _test_eof27;
case 27:
	switch( (*p) ) {
		case 34: goto st25;
		case 35: goto st27;
		case 39: goto st25;
		case 123: goto tr47;
	}
	goto st24;
tr39:
#line 18 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st49;
st49:
	if ( ++p == pe )
		goto _test_eof49;
case 49:
#line 644 "template.c"
	switch( (*p) ) {
		case 34: goto st22;
		case 35: goto st28;
	}
	goto st21;
st28:
	if ( ++p == pe )
		goto _test_eof28;
case 28:
	switch( (*p) ) {
		case 34: goto st22;
		case 35: goto st28;
		case 123: goto tr48;
	}
	goto st21;
st29:
	if ( ++p == pe )
		goto _test_eof29;
case 29:
	if ( (*p) == 39 )
		goto st30;
	goto st29;
tr50:
#line 15 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 30; goto st20;}}
	goto st30;
st30:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof30;
case 30:
#line 677 "template.c"
	switch( (*p) ) {
		case 34: goto st24;
		case 123: goto tr50;
		case 125: goto tr51;
	}
	goto st30;
tr51:
#line 18 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st50;
st50:
	if ( ++p == pe )
		goto _test_eof50;
case 50:
#line 692 "template.c"
	if ( (*p) == 39 )
		goto st30;
	goto st29;
tr33:
#line 18 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st51;
st51:
	if ( ++p == pe )
		goto _test_eof51;
case 51:
#line 704 "template.c"
	goto st0;
tr55:
#line 15 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 31; goto st20;}}
	goto st31;
st31:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof31;
case 31:
#line 716 "template.c"
	switch( (*p) ) {
		case 34: goto st32;
		case 39: goto st40;
		case 123: goto tr55;
		case 125: goto tr56;
	}
	goto st31;
tr71:
#line 11 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 32; goto st20;}}
	goto st32;
st32:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof32;
case 32:
#line 734 "template.c"
	switch( (*p) ) {
		case 34: goto st33;
		case 35: goto st39;
	}
	goto st32;
tr61:
#line 15 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 33; goto st20;}}
	goto st33;
tr63:
#line 11 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 33; goto st20;}}
#line 15 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 33; goto st20;}}
	goto st33;
st33:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof33;
case 33:
#line 756 "template.c"
	switch( (*p) ) {
		case 35: goto st34;
		case 39: goto st35;
		case 123: goto tr61;
		case 125: goto tr62;
	}
	goto st33;
st34:
	if ( ++p == pe )
		goto _test_eof34;
case 34:
	switch( (*p) ) {
		case 35: goto st34;
		case 39: goto st35;
		case 123: goto tr63;
		case 125: goto tr62;
	}
	goto st33;
tr70:
#line 11 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 35; goto st20;}}
	goto st35;
st35:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof35;
case 35:
#line 785 "template.c"
	switch( (*p) ) {
		case 34: goto st36;
		case 35: goto st38;
		case 39: goto st36;
	}
	goto st35;
tr67:
#line 15 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 36; goto st20;}}
	goto st36;
tr69:
#line 11 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 36; goto st20;}}
#line 15 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 36; goto st20;}}
	goto st36;
st36:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof36;
case 36:
#line 808 "template.c"
	switch( (*p) ) {
		case 35: goto st37;
		case 123: goto tr67;
		case 125: goto tr68;
	}
	goto st36;
st37:
	if ( ++p == pe )
		goto _test_eof37;
case 37:
	switch( (*p) ) {
		case 35: goto st37;
		case 123: goto tr69;
		case 125: goto tr68;
	}
	goto st36;
tr68:
	cs = 52;
#line 27 "template.rl"
	{
		expression.end = p;
	}
#line 31 "template.rl"
	{
		rb_funcall(delegate, rb_intern("expression"), 1, Trenni_token(expression));
	}
#line 19 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{cs = 42;}
	goto _again;
st52:
	if ( ++p == pe )
		goto _test_eof52;
case 52:
#line 842 "template.c"
	switch( (*p) ) {
		case 34: goto st36;
		case 35: goto st38;
		case 39: goto st36;
	}
	goto st35;
st38:
	if ( ++p == pe )
		goto _test_eof38;
case 38:
	switch( (*p) ) {
		case 34: goto st36;
		case 35: goto st38;
		case 39: goto st36;
		case 123: goto tr70;
	}
	goto st35;
tr62:
	cs = 53;
#line 27 "template.rl"
	{
		expression.end = p;
	}
#line 31 "template.rl"
	{
		rb_funcall(delegate, rb_intern("expression"), 1, Trenni_token(expression));
	}
#line 19 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{cs = 42;}
	goto _again;
st53:
	if ( ++p == pe )
		goto _test_eof53;
case 53:
#line 877 "template.c"
	switch( (*p) ) {
		case 34: goto st33;
		case 35: goto st39;
	}
	goto st32;
st39:
	if ( ++p == pe )
		goto _test_eof39;
case 39:
	switch( (*p) ) {
		case 34: goto st33;
		case 35: goto st39;
		case 123: goto tr71;
	}
	goto st32;
st40:
	if ( ++p == pe )
		goto _test_eof40;
case 40:
	if ( (*p) == 39 )
		goto st41;
	goto st40;
tr73:
#line 15 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{{stack[top++] = 41; goto st20;}}
	goto st41;
st41:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof41;
case 41:
#line 910 "template.c"
	switch( (*p) ) {
		case 34: goto st35;
		case 123: goto tr73;
		case 125: goto tr74;
	}
	goto st41;
tr74:
	cs = 54;
#line 27 "template.rl"
	{
		expression.end = p;
	}
#line 31 "template.rl"
	{
		rb_funcall(delegate, rb_intern("expression"), 1, Trenni_token(expression));
	}
#line 19 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{cs = 42;}
	goto _again;
st54:
	if ( ++p == pe )
		goto _test_eof54;
case 54:
#line 934 "template.c"
	if ( (*p) == 39 )
		goto st41;
	goto st40;
tr56:
	cs = 55;
#line 27 "template.rl"
	{
		expression.end = p;
	}
#line 31 "template.rl"
	{
		rb_funcall(delegate, rb_intern("expression"), 1, Trenni_token(expression));
	}
#line 19 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
	{cs = 42;}
	goto _again;
st55:
	if ( ++p == pe )
		goto _test_eof55;
case 55:
#line 955 "template.c"
	goto st0;
	}
	_test_eof42: cs = 42; goto _test_eof; 
	_test_eof43: cs = 43; goto _test_eof; 
	_test_eof44: cs = 44; goto _test_eof; 
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof45: cs = 45; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 
	_test_eof12: cs = 12; goto _test_eof; 
	_test_eof46: cs = 46; goto _test_eof; 
	_test_eof13: cs = 13; goto _test_eof; 
	_test_eof47: cs = 47; goto _test_eof; 
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
	_test_eof48: cs = 48; goto _test_eof; 
	_test_eof27: cs = 27; goto _test_eof; 
	_test_eof49: cs = 49; goto _test_eof; 
	_test_eof28: cs = 28; goto _test_eof; 
	_test_eof29: cs = 29; goto _test_eof; 
	_test_eof30: cs = 30; goto _test_eof; 
	_test_eof50: cs = 50; goto _test_eof; 
	_test_eof51: cs = 51; goto _test_eof; 
	_test_eof31: cs = 31; goto _test_eof; 
	_test_eof32: cs = 32; goto _test_eof; 
	_test_eof33: cs = 33; goto _test_eof; 
	_test_eof34: cs = 34; goto _test_eof; 
	_test_eof35: cs = 35; goto _test_eof; 
	_test_eof36: cs = 36; goto _test_eof; 
	_test_eof37: cs = 37; goto _test_eof; 
	_test_eof52: cs = 52; goto _test_eof; 
	_test_eof38: cs = 38; goto _test_eof; 
	_test_eof53: cs = 53; goto _test_eof; 
	_test_eof39: cs = 39; goto _test_eof; 
	_test_eof40: cs = 40; goto _test_eof; 
	_test_eof41: cs = 41; goto _test_eof; 
	_test_eof54: cs = 54; goto _test_eof; 
	_test_eof55: cs = 55; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 43: goto tr78;
	case 44: goto tr81;
	case 1: goto tr0;
	case 2: goto tr0;
	case 3: goto tr0;
	case 4: goto tr5;
	case 5: goto tr5;
	case 45: goto tr78;
	case 6: goto tr5;
	case 7: goto tr5;
	case 8: goto tr5;
	case 9: goto tr5;
	case 10: goto tr5;
	case 11: goto tr5;
	case 12: goto tr16;
	case 46: goto tr16;
	case 47: goto tr83;
	case 31: 
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
#line 35 "template.rl"
	{
		Trenni_raise_error("failed to parse expression", buffer, p-s);
	}
	break;
#line 1051 "template.c"
	}
	}

	_out: {}
	}

#line 71 "template.rl"

	
	if (p != eof) {
		Trenni_raise_error("could not parse all input", buffer, p-s);
	}
}
