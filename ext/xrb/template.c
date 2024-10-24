
#line 1 "ext/xrb/template.rl"

#include "template.h"


#line 8 "ext/xrb/template.c"
static const int XRB_template_parser_start = 34;
static const int XRB_template_parser_first_final = 34;
static const int XRB_template_parser_error = 0;

static const int XRB_template_parser_en_parse_nested_expression = 11;
static const int XRB_template_parser_en_parse_expression = 22;
static const int XRB_template_parser_en_main = 34;


#line 89 "ext/xrb/template.rl"


VALUE XRB_Native_parse_template(VALUE self, VALUE buffer, VALUE delegate) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	rb_encoding *encoding = rb_enc_get(string);
	
	VALUE newline = rb_obj_freeze(rb_enc_str_new("\n", 1, encoding));
	
	const char *s, *p, *pe, *eof, *ts, *te;
	unsigned long cs, top = 0, stack[32] = {0}, act;
	
	XRB_Token expression = {0}, instruction = {0}, text = {0}, delimiter = {0};
	
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
		case 34: goto st34;
		case 35: goto st35;
		case 36: goto st36;
		case 1: goto st1;
		case 2: goto st2;
		case 3: goto st3;
		case 4: goto st4;
		case 5: goto st5;
		case 37: goto st37;
		case 38: goto st38;
		case 39: goto st39;
		case 40: goto st40;
		case 41: goto st41;
		case 42: goto st42;
		case 43: goto st43;
		case 44: goto st44;
		case 45: goto st45;
		case 6: goto st6;
		case 7: goto st7;
		case 8: goto st8;
		case 46: goto st46;
		case 47: goto st47;
		case 48: goto st48;
		case 49: goto st49;
		case 50: goto st50;
		case 9: goto st9;
		case 10: goto st10;
		case 51: goto st51;
		case 11: goto st11;
		case 12: goto st12;
		case 13: goto st13;
		case 14: goto st14;
		case 15: goto st15;
		case 16: goto st16;
		case 17: goto st17;
		case 52: goto st52;
		case 18: goto st18;
		case 53: goto st53;
		case 19: goto st19;
		case 20: goto st20;
		case 21: goto st21;
		case 54: goto st54;
		case 55: goto st55;
		case 0: goto st0;
		case 22: goto st22;
		case 23: goto st23;
		case 24: goto st24;
		case 25: goto st25;
		case 26: goto st26;
		case 27: goto st27;
		case 28: goto st28;
		case 29: goto st29;
		case 56: goto st56;
		case 30: goto st30;
		case 57: goto st57;
		case 31: goto st31;
		case 32: goto st32;
		case 33: goto st33;
		case 58: goto st58;
		case 59: goto st59;
	default: break;
	}

	if ( ++p == pe )
		goto _test_eof;
_resume:
	switch ( cs )
	{
tr0:
#line 75 "ext/xrb/template.rl"
	{{p = ((te))-1;}{
		text.begin = ts;
		text.end = te;
		
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}}
	goto st34;
tr7:
#line 23 "ext/xrb/template.rl"
	{
		XRB_raise_error("failed to parse instruction", buffer, p-s);
	}
#line 64 "ext/xrb/template.rl"
	{{p = ((te))-1;}{
		if (delimiter.begin && delimiter.end) {
			text.end = delimiter.begin;
			
			// Backtrack:
			p = delimiter.begin - 1;
		}
		
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}}
	goto st34;
tr11:
#line 1 "NONE"
	{	switch( act ) {
	case 4:
	{{p = ((te))-1;}
		rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
	}
	break;
	case 5:
	{{p = ((te))-1;}
		if (delimiter.begin && delimiter.end) {
			text.end = delimiter.begin;
			
			// Backtrack:
			p = delimiter.begin - 1;
		}
		
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}
	break;
	}
	}
	goto st34;
tr12:
#line 19 "ext/xrb/template.rl"
	{te = p+1;{
		rb_funcall(delegate, id_instruction, 2, XRB_Token_string(instruction, encoding), newline);
	}}
	goto st34;
tr72:
#line 52 "ext/xrb/template.rl"
	{
		text.end = p;
	}
#line 56 "ext/xrb/template.rl"
	{
		delimiter.begin = p;
	}
#line 64 "ext/xrb/template.rl"
	{te = p;p--;{
		if (delimiter.begin && delimiter.end) {
			text.end = delimiter.begin;
			
			// Backtrack:
			p = delimiter.begin - 1;
		}
		
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}}
	goto st34;
tr77:
#line 75 "ext/xrb/template.rl"
	{te = p;p--;{
		text.begin = ts;
		text.end = te;
		
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}}
	goto st34;
tr78:
#line 60 "ext/xrb/template.rl"
	{
		delimiter.end = p;
	}
#line 64 "ext/xrb/template.rl"
	{te = p+1;{
		if (delimiter.begin && delimiter.end) {
			text.end = delimiter.begin;
			
			// Backtrack:
			p = delimiter.begin - 1;
		}
		
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}}
	goto st34;
tr86:
#line 64 "ext/xrb/template.rl"
	{te = p;p--;{
		if (delimiter.begin && delimiter.end) {
			text.end = delimiter.begin;
			
			// Backtrack:
			p = delimiter.begin - 1;
		}
		
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}}
	goto st34;
tr87:
#line 58 "parsers/xrb/template.rl"
	{te = p+1;{{stack[top++] = 34;goto st22;}}}
#line 60 "ext/xrb/template.rl"
	{
		delimiter.end = p;
	}
	goto st34;
tr91:
#line 15 "ext/xrb/template.rl"
	{te = p;p--;{
		rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
	}}
	goto st34;
st34:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof34;
case 34:
#line 1 "NONE"
	{ts = p;}
#line 259 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr69;
		case 32: goto tr68;
		case 35: goto tr70;
		case 60: goto tr71;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr68;
	goto tr67;
tr67:
#line 45 "ext/xrb/template.rl"
	{
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
	goto st35;
st35:
	if ( ++p == pe )
		goto _test_eof35;
case 35:
#line 282 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr74;
		case 35: goto tr75;
		case 60: goto tr76;
	}
	goto st35;
tr2:
#line 1 "NONE"
	{te = p+1;}
	goto st36;
tr69:
#line 1 "NONE"
	{te = p+1;}
#line 45 "ext/xrb/template.rl"
	{
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
#line 52 "ext/xrb/template.rl"
	{
		text.end = p;
	}
#line 56 "ext/xrb/template.rl"
	{
		delimiter.begin = p;
	}
	goto st36;
tr74:
#line 1 "NONE"
	{te = p+1;}
#line 52 "ext/xrb/template.rl"
	{
		text.end = p;
	}
#line 56 "ext/xrb/template.rl"
	{
		delimiter.begin = p;
	}
	goto st36;
st36:
	if ( ++p == pe )
		goto _test_eof36;
case 36:
#line 328 "ext/xrb/template.c"
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
	switch( (*p) ) {
		case 10: goto tr2;
		case 35: goto st2;
		case 60: goto st3;
		case 123: goto tr0;
	}
	goto st1;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
	switch( (*p) ) {
		case 10: goto tr2;
		case 35: goto st2;
		case 60: goto st3;
		case 63: goto st4;
	}
	goto st1;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
	switch( (*p) ) {
		case 10: goto tr2;
		case 35: goto st2;
		case 60: goto st3;
		case 114: goto st5;
	}
	goto st1;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
	switch( (*p) ) {
		case 32: goto tr0;
		case 35: goto st2;
		case 60: goto st3;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr0;
	goto st1;
tr75:
#line 52 "ext/xrb/template.rl"
	{
		text.end = p;
	}
#line 56 "ext/xrb/template.rl"
	{
		delimiter.begin = p;
	}
	goto st37;
st37:
	if ( ++p == pe )
		goto _test_eof37;
case 37:
#line 404 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr74;
		case 35: goto tr75;
		case 60: goto tr76;
		case 123: goto tr78;
	}
	goto st35;
tr76:
#line 52 "ext/xrb/template.rl"
	{
		text.end = p;
	}
#line 56 "ext/xrb/template.rl"
	{
		delimiter.begin = p;
	}
	goto st38;
st38:
	if ( ++p == pe )
		goto _test_eof38;
case 38:
#line 426 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr74;
		case 35: goto tr75;
		case 60: goto tr76;
		case 63: goto st39;
	}
	goto st35;
st39:
	if ( ++p == pe )
		goto _test_eof39;
case 39:
	switch( (*p) ) {
		case 10: goto tr74;
		case 35: goto tr75;
		case 60: goto tr76;
		case 114: goto st40;
	}
	goto st35;
st40:
	if ( ++p == pe )
		goto _test_eof40;
case 40:
	switch( (*p) ) {
		case 32: goto tr78;
		case 35: goto tr75;
		case 60: goto tr76;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr78;
	goto st35;
tr68:
#line 45 "ext/xrb/template.rl"
	{
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
	goto st41;
st41:
	if ( ++p == pe )
		goto _test_eof41;
case 41:
#line 470 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr74;
		case 32: goto st41;
		case 35: goto tr75;
		case 60: goto tr82;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st41;
	goto st35;
tr82:
#line 52 "ext/xrb/template.rl"
	{
		text.end = p;
	}
#line 56 "ext/xrb/template.rl"
	{
		delimiter.begin = p;
	}
	goto st42;
st42:
	if ( ++p == pe )
		goto _test_eof42;
case 42:
#line 494 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr74;
		case 35: goto tr75;
		case 60: goto tr76;
		case 63: goto st43;
	}
	goto st35;
st43:
	if ( ++p == pe )
		goto _test_eof43;
case 43:
	switch( (*p) ) {
		case 10: goto tr74;
		case 35: goto tr75;
		case 60: goto tr76;
		case 114: goto st44;
	}
	goto st35;
st44:
	if ( ++p == pe )
		goto _test_eof44;
case 44:
	switch( (*p) ) {
		case 32: goto tr85;
		case 35: goto tr75;
		case 60: goto tr76;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr85;
	goto st35;
tr85:
#line 1 "NONE"
	{te = p+1;}
#line 7 "ext/xrb/template.rl"
	{
		instruction.begin = p;
	}
#line 60 "ext/xrb/template.rl"
	{
		delimiter.end = p;
	}
#line 64 "ext/xrb/template.rl"
	{act = 5;}
	goto st45;
st45:
	if ( ++p == pe )
		goto _test_eof45;
case 45:
#line 543 "ext/xrb/template.c"
	if ( (*p) == 63 )
		goto tr9;
	goto st6;
st6:
	if ( ++p == pe )
		goto _test_eof6;
case 6:
	if ( (*p) == 63 )
		goto tr9;
	goto st6;
tr9:
#line 11 "ext/xrb/template.rl"
	{
		instruction.end = p;
	}
	goto st7;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
#line 564 "ext/xrb/template.c"
	if ( (*p) == 62 )
		goto st8;
	goto st6;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
	switch( (*p) ) {
		case 10: goto tr12;
		case 32: goto st8;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st8;
	goto tr11;
tr70:
#line 45 "ext/xrb/template.rl"
	{
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
#line 52 "ext/xrb/template.rl"
	{
		text.end = p;
	}
#line 56 "ext/xrb/template.rl"
	{
		delimiter.begin = p;
	}
	goto st46;
st46:
	if ( ++p == pe )
		goto _test_eof46;
case 46:
#line 600 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr74;
		case 35: goto tr75;
		case 60: goto tr76;
		case 123: goto tr87;
	}
	goto st35;
tr71:
#line 45 "ext/xrb/template.rl"
	{
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
#line 52 "ext/xrb/template.rl"
	{
		text.end = p;
	}
#line 56 "ext/xrb/template.rl"
	{
		delimiter.begin = p;
	}
	goto st47;
st47:
	if ( ++p == pe )
		goto _test_eof47;
case 47:
#line 629 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr74;
		case 35: goto tr75;
		case 60: goto tr76;
		case 63: goto st48;
	}
	goto st35;
st48:
	if ( ++p == pe )
		goto _test_eof48;
case 48:
	switch( (*p) ) {
		case 10: goto tr74;
		case 35: goto tr75;
		case 60: goto tr76;
		case 114: goto st49;
	}
	goto st35;
st49:
	if ( ++p == pe )
		goto _test_eof49;
case 49:
	switch( (*p) ) {
		case 32: goto tr90;
		case 35: goto tr75;
		case 60: goto tr76;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr90;
	goto st35;
tr90:
#line 1 "NONE"
	{te = p+1;}
#line 7 "ext/xrb/template.rl"
	{
		instruction.begin = p;
	}
#line 60 "ext/xrb/template.rl"
	{
		delimiter.end = p;
	}
	goto st50;
st50:
	if ( ++p == pe )
		goto _test_eof50;
case 50:
#line 676 "ext/xrb/template.c"
	if ( (*p) == 63 )
		goto tr14;
	goto st9;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
	if ( (*p) == 63 )
		goto tr14;
	goto st9;
tr14:
#line 11 "ext/xrb/template.rl"
	{
		instruction.end = p;
	}
	goto st10;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
#line 697 "ext/xrb/template.c"
	if ( (*p) == 62 )
		goto tr15;
	goto st9;
tr15:
#line 1 "NONE"
	{te = p+1;}
#line 15 "ext/xrb/template.rl"
	{act = 4;}
	goto st51;
st51:
	if ( ++p == pe )
		goto _test_eof51;
case 51:
#line 711 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr12;
		case 32: goto st8;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st8;
	goto tr91;
tr19:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 11;goto st11;}}
	goto st11;
st11:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof11;
case 11:
#line 729 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st12;
		case 39: goto st20;
		case 123: goto tr19;
		case 125: goto tr20;
	}
	goto st11;
tr35:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 12;goto st11;}}
	goto st12;
st12:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof12;
case 12:
#line 747 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st13;
		case 35: goto st19;
	}
	goto st12;
tr25:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 13;goto st11;}}
	goto st13;
tr27:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 13;goto st11;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 13;goto st11;}}
	goto st13;
st13:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof13;
case 13:
#line 769 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st14;
		case 39: goto st15;
		case 123: goto tr25;
		case 125: goto tr26;
	}
	goto st13;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
	switch( (*p) ) {
		case 35: goto st14;
		case 39: goto st15;
		case 123: goto tr27;
		case 125: goto tr26;
	}
	goto st13;
tr34:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 15;goto st11;}}
	goto st15;
st15:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof15;
case 15:
#line 798 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st16;
		case 35: goto st18;
		case 39: goto st16;
	}
	goto st15;
tr31:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 16;goto st11;}}
	goto st16;
tr33:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 16;goto st11;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 16;goto st11;}}
	goto st16;
st16:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof16;
case 16:
#line 821 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st17;
		case 123: goto tr31;
		case 125: goto tr32;
	}
	goto st16;
st17:
	if ( ++p == pe )
		goto _test_eof17;
case 17:
	switch( (*p) ) {
		case 35: goto st17;
		case 123: goto tr33;
		case 125: goto tr32;
	}
	goto st16;
tr32:
#line 20 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st52;
st52:
	if ( ++p == pe )
		goto _test_eof52;
case 52:
#line 846 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st16;
		case 35: goto st18;
		case 39: goto st16;
	}
	goto st15;
st18:
	if ( ++p == pe )
		goto _test_eof18;
case 18:
	switch( (*p) ) {
		case 34: goto st16;
		case 35: goto st18;
		case 39: goto st16;
		case 123: goto tr34;
	}
	goto st15;
tr26:
#line 20 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st53;
st53:
	if ( ++p == pe )
		goto _test_eof53;
case 53:
#line 872 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st13;
		case 35: goto st19;
	}
	goto st12;
st19:
	if ( ++p == pe )
		goto _test_eof19;
case 19:
	switch( (*p) ) {
		case 34: goto st13;
		case 35: goto st19;
		case 123: goto tr35;
	}
	goto st12;
st20:
	if ( ++p == pe )
		goto _test_eof20;
case 20:
	if ( (*p) == 39 )
		goto st21;
	goto st20;
tr37:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 21;goto st11;}}
	goto st21;
st21:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof21;
case 21:
#line 905 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st15;
		case 123: goto tr37;
		case 125: goto tr38;
	}
	goto st21;
tr38:
#line 20 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st54;
st54:
	if ( ++p == pe )
		goto _test_eof54;
case 54:
#line 920 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st21;
	goto st20;
tr20:
#line 20 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st55;
st55:
	if ( ++p == pe )
		goto _test_eof55;
case 55:
#line 932 "ext/xrb/template.c"
	goto st0;
st0:
cs = 0;
	goto _out;
st22:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof22;
case 22:
#line 943 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto tr40;
		case 39: goto tr41;
		case 123: goto tr42;
		case 125: goto tr43;
	}
	goto tr39;
tr47:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 23;goto st11;}}
	goto st23;
tr39:
#line 27 "ext/xrb/template.rl"
	{
		expression.begin = p;
	}
	goto st23;
tr42:
#line 27 "ext/xrb/template.rl"
	{
		expression.begin = p;
	}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 23;goto st11;}}
	goto st23;
st23:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof23;
case 23:
#line 975 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st24;
		case 39: goto st32;
		case 123: goto tr47;
		case 125: goto tr48;
	}
	goto st23;
tr63:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 24;goto st11;}}
	goto st24;
tr40:
#line 27 "ext/xrb/template.rl"
	{
		expression.begin = p;
	}
	goto st24;
st24:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof24;
case 24:
#line 999 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st25;
		case 35: goto st31;
	}
	goto st24;
tr53:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 25;goto st11;}}
	goto st25;
tr55:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 25;goto st11;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 25;goto st11;}}
	goto st25;
st25:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof25;
case 25:
#line 1021 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st26;
		case 39: goto st27;
		case 123: goto tr53;
		case 125: goto tr54;
	}
	goto st25;
st26:
	if ( ++p == pe )
		goto _test_eof26;
case 26:
	switch( (*p) ) {
		case 35: goto st26;
		case 39: goto st27;
		case 123: goto tr55;
		case 125: goto tr54;
	}
	goto st25;
tr62:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 27;goto st11;}}
	goto st27;
st27:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof27;
case 27:
#line 1050 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st28;
		case 35: goto st30;
		case 39: goto st28;
	}
	goto st27;
tr59:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 28;goto st11;}}
	goto st28;
tr61:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 28;goto st11;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 28;goto st11;}}
	goto st28;
st28:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof28;
case 28:
#line 1073 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st29;
		case 123: goto tr59;
		case 125: goto tr60;
	}
	goto st28;
st29:
	if ( ++p == pe )
		goto _test_eof29;
case 29:
	switch( (*p) ) {
		case 35: goto st29;
		case 123: goto tr61;
		case 125: goto tr60;
	}
	goto st28;
tr60:
#line 31 "ext/xrb/template.rl"
	{
		expression.end = p;
	}
#line 35 "ext/xrb/template.rl"
	{
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st56;
st56:
	if ( ++p == pe )
		goto _test_eof56;
case 56:
#line 1108 "ext/xrb/template.c"
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
		case 123: goto tr62;
	}
	goto st27;
tr54:
#line 31 "ext/xrb/template.rl"
	{
		expression.end = p;
	}
#line 35 "ext/xrb/template.rl"
	{
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st57;
st57:
	if ( ++p == pe )
		goto _test_eof57;
case 57:
#line 1144 "ext/xrb/template.c"
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
		case 123: goto tr63;
	}
	goto st24;
tr41:
#line 27 "ext/xrb/template.rl"
	{
		expression.begin = p;
	}
	goto st32;
st32:
	if ( ++p == pe )
		goto _test_eof32;
case 32:
#line 1170 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st33;
	goto st32;
tr65:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 33;goto st11;}}
	goto st33;
st33:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof33;
case 33:
#line 1184 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st27;
		case 123: goto tr65;
		case 125: goto tr66;
	}
	goto st33;
tr66:
#line 31 "ext/xrb/template.rl"
	{
		expression.end = p;
	}
#line 35 "ext/xrb/template.rl"
	{
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st58;
st58:
	if ( ++p == pe )
		goto _test_eof58;
case 58:
#line 1209 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st33;
	goto st32;
tr43:
#line 27 "ext/xrb/template.rl"
	{
		expression.begin = p;
	}
#line 31 "ext/xrb/template.rl"
	{
		expression.end = p;
	}
#line 35 "ext/xrb/template.rl"
	{
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st59;
tr48:
#line 31 "ext/xrb/template.rl"
	{
		expression.end = p;
	}
#line 35 "ext/xrb/template.rl"
	{
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st59;
st59:
	if ( ++p == pe )
		goto _test_eof59;
case 59:
#line 1249 "ext/xrb/template.c"
	goto st0;
	}
	_test_eof34: cs = 34; goto _test_eof; 
	_test_eof35: cs = 35; goto _test_eof; 
	_test_eof36: cs = 36; goto _test_eof; 
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof37: cs = 37; goto _test_eof; 
	_test_eof38: cs = 38; goto _test_eof; 
	_test_eof39: cs = 39; goto _test_eof; 
	_test_eof40: cs = 40; goto _test_eof; 
	_test_eof41: cs = 41; goto _test_eof; 
	_test_eof42: cs = 42; goto _test_eof; 
	_test_eof43: cs = 43; goto _test_eof; 
	_test_eof44: cs = 44; goto _test_eof; 
	_test_eof45: cs = 45; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof46: cs = 46; goto _test_eof; 
	_test_eof47: cs = 47; goto _test_eof; 
	_test_eof48: cs = 48; goto _test_eof; 
	_test_eof49: cs = 49; goto _test_eof; 
	_test_eof50: cs = 50; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof51: cs = 51; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 
	_test_eof12: cs = 12; goto _test_eof; 
	_test_eof13: cs = 13; goto _test_eof; 
	_test_eof14: cs = 14; goto _test_eof; 
	_test_eof15: cs = 15; goto _test_eof; 
	_test_eof16: cs = 16; goto _test_eof; 
	_test_eof17: cs = 17; goto _test_eof; 
	_test_eof52: cs = 52; goto _test_eof; 
	_test_eof18: cs = 18; goto _test_eof; 
	_test_eof53: cs = 53; goto _test_eof; 
	_test_eof19: cs = 19; goto _test_eof; 
	_test_eof20: cs = 20; goto _test_eof; 
	_test_eof21: cs = 21; goto _test_eof; 
	_test_eof54: cs = 54; goto _test_eof; 
	_test_eof55: cs = 55; goto _test_eof; 
	_test_eof22: cs = 22; goto _test_eof; 
	_test_eof23: cs = 23; goto _test_eof; 
	_test_eof24: cs = 24; goto _test_eof; 
	_test_eof25: cs = 25; goto _test_eof; 
	_test_eof26: cs = 26; goto _test_eof; 
	_test_eof27: cs = 27; goto _test_eof; 
	_test_eof28: cs = 28; goto _test_eof; 
	_test_eof29: cs = 29; goto _test_eof; 
	_test_eof56: cs = 56; goto _test_eof; 
	_test_eof30: cs = 30; goto _test_eof; 
	_test_eof57: cs = 57; goto _test_eof; 
	_test_eof31: cs = 31; goto _test_eof; 
	_test_eof32: cs = 32; goto _test_eof; 
	_test_eof33: cs = 33; goto _test_eof; 
	_test_eof58: cs = 58; goto _test_eof; 
	_test_eof59: cs = 59; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 35: goto tr72;
	case 36: goto tr77;
	case 1: goto tr0;
	case 2: goto tr0;
	case 3: goto tr0;
	case 4: goto tr0;
	case 5: goto tr0;
	case 37: goto tr72;
	case 38: goto tr72;
	case 39: goto tr72;
	case 40: goto tr72;
	case 41: goto tr72;
	case 42: goto tr72;
	case 43: goto tr72;
	case 44: goto tr72;
	case 45: goto tr86;
	case 6: goto tr7;
	case 7: goto tr7;
	case 8: goto tr11;
	case 46: goto tr72;
	case 47: goto tr72;
	case 48: goto tr72;
	case 49: goto tr72;
	case 50: goto tr86;
	case 9: goto tr7;
	case 10: goto tr7;
	case 51: goto tr91;
	case 22: 
	case 23: 
	case 24: 
	case 25: 
	case 26: 
	case 27: 
	case 28: 
	case 29: 
	case 30: 
	case 31: 
	case 32: 
	case 33: 
#line 41 "ext/xrb/template.rl"
	{
		XRB_raise_error("failed to parse expression", buffer, p-s);
	}
	break;
	case 34: 
#line 45 "ext/xrb/template.rl"
	{
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
#line 52 "ext/xrb/template.rl"
	{
		text.end = p;
	}
#line 56 "ext/xrb/template.rl"
	{
		delimiter.begin = p;
	}
	break;
#line 1377 "ext/xrb/template.c"
	}
	}

	_out: {}
	}

#line 109 "ext/xrb/template.rl"

	
	if (p != eof) {
		XRB_raise_error("could not parse all input", buffer, p-s);
	}
	
	return Qnil;
}
