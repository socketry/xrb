
#line 1 "ext/xrb/template.rl"

#include "template.h"


#line 8 "ext/xrb/template.c"
static const int XRB_template_parser_start = 29;
static const int XRB_template_parser_first_final = 29;
static const int XRB_template_parser_error = 0;

static const int XRB_template_parser_en_parse_nested_expression = 6;
static const int XRB_template_parser_en_parse_expression = 17;
static const int XRB_template_parser_en_main = 29;


#line 96 "ext/xrb/template.rl"


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
		case 29: goto st29;
		case 30: goto st30;
		case 31: goto st31;
		case 32: goto st32;
		case 33: goto st33;
		case 34: goto st34;
		case 35: goto st35;
		case 36: goto st36;
		case 37: goto st37;
		case 38: goto st38;
		case 39: goto st39;
		case 1: goto st1;
		case 2: goto st2;
		case 3: goto st3;
		case 40: goto st40;
		case 41: goto st41;
		case 42: goto st42;
		case 43: goto st43;
		case 4: goto st4;
		case 5: goto st5;
		case 44: goto st44;
		case 6: goto st6;
		case 7: goto st7;
		case 8: goto st8;
		case 9: goto st9;
		case 10: goto st10;
		case 11: goto st11;
		case 12: goto st12;
		case 45: goto st45;
		case 13: goto st13;
		case 46: goto st46;
		case 14: goto st14;
		case 15: goto st15;
		case 16: goto st16;
		case 47: goto st47;
		case 48: goto st48;
		case 0: goto st0;
		case 17: goto st17;
		case 18: goto st18;
		case 19: goto st19;
		case 20: goto st20;
		case 21: goto st21;
		case 22: goto st22;
		case 23: goto st23;
		case 24: goto st24;
		case 49: goto st49;
		case 25: goto st25;
		case 50: goto st50;
		case 26: goto st26;
		case 27: goto st27;
		case 28: goto st28;
		case 51: goto st51;
		case 52: goto st52;
	default: break;
	}

	if ( ++p == pe )
		goto _test_eof;
_resume:
	switch ( cs )
	{
tr0:
#line 27 "ext/xrb/template.rl"
	{
		XRB_raise_error("failed to parse instruction", buffer, p-s);
	}
#line 76 "ext/xrb/template.rl"
	{{p = ((te))-1;}{
		if (delimiter.begin && delimiter.end) {
			text.end = delimiter.begin;
			
			// Backtrack:
			p = delimiter.begin - 1;
		}
		
		// fprintf(stderr, "\033[32m => emit text %.*s\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}}
	goto st29;
tr4:
#line 1 "NONE"
	{	switch( act ) {
	case 3:
	{{p = ((te))-1;}
		// fprintf(stderr, "\033[32m => emit instruction %.*s\033[0m\n", (int)(instruction.end-instruction.begin), instruction.begin);
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
		
		// fprintf(stderr, "\033[32m => emit text %.*s\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}
	break;
	}
	}
	goto st29;
tr5:
#line 22 "ext/xrb/template.rl"
	{te = p+1;{
		// fprintf(stderr, "\033[32m => emit multiline instruction %.*s\033[0m\n", (int)(instruction.end-instruction.begin), instruction.begin);
		rb_funcall(delegate, id_instruction, 2, XRB_Token_string(instruction, encoding), newline);
	}}
	goto st29;
tr62:
#line 88 "ext/xrb/template.rl"
	{te = p+1;{
		// fprintf(stderr, "\033[32m => emit newline\033[0m\n");
		rb_funcall(delegate, id_instruction, 1, newline);
	}}
	goto st29;
tr65:
#line 61 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text end %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p;
	}
#line 66 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "\033[34m text delimiter begin %s\033[0m\n", p);
		delimiter.begin = p;
	}
#line 76 "ext/xrb/template.rl"
	{te = p;p--;{
		if (delimiter.begin && delimiter.end) {
			text.end = delimiter.begin;
			
			// Backtrack:
			p = delimiter.begin - 1;
		}
		
		// fprintf(stderr, "\033[32m => emit text %.*s\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}}
	goto st29;
tr69:
#line 71 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "\033[34m text delimiter end %s\033[0m\n", p);
		delimiter.end = p;
	}
#line 76 "ext/xrb/template.rl"
	{te = p+1;{
		if (delimiter.begin && delimiter.end) {
			text.end = delimiter.begin;
			
			// Backtrack:
			p = delimiter.begin - 1;
		}
		
		// fprintf(stderr, "\033[32m => emit text %.*s\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}}
	goto st29;
tr77:
#line 76 "ext/xrb/template.rl"
	{te = p;p--;{
		if (delimiter.begin && delimiter.end) {
			text.end = delimiter.begin;
			
			// Backtrack:
			p = delimiter.begin - 1;
		}
		
		// fprintf(stderr, "\033[32m => emit text %.*s\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}}
	goto st29;
tr78:
#line 45 "parsers/xrb/template.rl"
	{te = p+1;{{stack[top++] = 29;goto st17;}}}
#line 61 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text end %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p;
	}
#line 66 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "\033[34m text delimiter begin %s\033[0m\n", p);
		delimiter.begin = p;
	}
	goto st29;
tr82:
#line 17 "ext/xrb/template.rl"
	{te = p;p--;{
		// fprintf(stderr, "\033[32m => emit instruction %.*s\033[0m\n", (int)(instruction.end-instruction.begin), instruction.begin);
		rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
	}}
	goto st29;
st29:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof29;
case 29:
#line 1 "NONE"
	{ts = p;}
#line 258 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr62;
		case 32: goto tr61;
		case 35: goto tr63;
		case 60: goto tr64;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr61;
	goto tr60;
tr60:
#line 53 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
	goto st30;
st30:
	if ( ++p == pe )
		goto _test_eof30;
case 30:
#line 282 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr65;
		case 35: goto tr67;
		case 60: goto tr68;
	}
	goto st30;
tr67:
#line 61 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text end %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p;
	}
#line 66 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "\033[34m text delimiter begin %s\033[0m\n", p);
		delimiter.begin = p;
	}
	goto st31;
st31:
	if ( ++p == pe )
		goto _test_eof31;
case 31:
#line 305 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr65;
		case 35: goto tr67;
		case 60: goto tr68;
		case 123: goto tr69;
	}
	goto st30;
tr68:
#line 61 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text end %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p;
	}
#line 66 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "\033[34m text delimiter begin %s\033[0m\n", p);
		delimiter.begin = p;
	}
	goto st32;
st32:
	if ( ++p == pe )
		goto _test_eof32;
case 32:
#line 329 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr65;
		case 35: goto tr67;
		case 60: goto tr68;
		case 63: goto st33;
	}
	goto st30;
st33:
	if ( ++p == pe )
		goto _test_eof33;
case 33:
	switch( (*p) ) {
		case 10: goto tr65;
		case 35: goto tr67;
		case 60: goto tr68;
		case 114: goto st34;
	}
	goto st30;
st34:
	if ( ++p == pe )
		goto _test_eof34;
case 34:
	switch( (*p) ) {
		case 32: goto tr69;
		case 35: goto tr67;
		case 60: goto tr68;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr69;
	goto st30;
tr61:
#line 53 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
	goto st35;
st35:
	if ( ++p == pe )
		goto _test_eof35;
case 35:
#line 374 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr65;
		case 32: goto st35;
		case 35: goto tr67;
		case 60: goto tr73;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st35;
	goto st30;
tr73:
#line 61 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text end %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p;
	}
#line 66 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "\033[34m text delimiter begin %s\033[0m\n", p);
		delimiter.begin = p;
	}
	goto st36;
st36:
	if ( ++p == pe )
		goto _test_eof36;
case 36:
#line 400 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr65;
		case 35: goto tr67;
		case 60: goto tr68;
		case 63: goto st37;
	}
	goto st30;
st37:
	if ( ++p == pe )
		goto _test_eof37;
case 37:
	switch( (*p) ) {
		case 10: goto tr65;
		case 35: goto tr67;
		case 60: goto tr68;
		case 114: goto st38;
	}
	goto st30;
st38:
	if ( ++p == pe )
		goto _test_eof38;
case 38:
	switch( (*p) ) {
		case 32: goto tr76;
		case 35: goto tr67;
		case 60: goto tr68;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr76;
	goto st30;
tr76:
#line 1 "NONE"
	{te = p+1;}
#line 7 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "instruction begin %s\n", p);
		instruction.begin = p;
	}
#line 71 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "\033[34m text delimiter end %s\033[0m\n", p);
		delimiter.end = p;
	}
#line 76 "ext/xrb/template.rl"
	{act = 5;}
	goto st39;
st39:
	if ( ++p == pe )
		goto _test_eof39;
case 39:
#line 451 "ext/xrb/template.c"
	if ( (*p) == 63 )
		goto tr2;
	goto st1;
st1:
	if ( ++p == pe )
		goto _test_eof1;
case 1:
	if ( (*p) == 63 )
		goto tr2;
	goto st1;
tr2:
#line 12 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
	}
	goto st2;
st2:
	if ( ++p == pe )
		goto _test_eof2;
case 2:
#line 473 "ext/xrb/template.c"
	if ( (*p) == 62 )
		goto st3;
	goto st1;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
	switch( (*p) ) {
		case 10: goto tr5;
		case 32: goto st3;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st3;
	goto tr4;
tr63:
#line 53 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
	goto st40;
st40:
	if ( ++p == pe )
		goto _test_eof40;
case 40:
#line 502 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr65;
		case 35: goto tr67;
		case 60: goto tr68;
		case 123: goto tr78;
	}
	goto st30;
tr64:
#line 53 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
	goto st41;
st41:
	if ( ++p == pe )
		goto _test_eof41;
case 41:
#line 524 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr65;
		case 35: goto tr67;
		case 60: goto tr68;
		case 63: goto st42;
	}
	goto st30;
st42:
	if ( ++p == pe )
		goto _test_eof42;
case 42:
	switch( (*p) ) {
		case 10: goto tr65;
		case 35: goto tr67;
		case 60: goto tr68;
		case 114: goto tr80;
	}
	goto st30;
tr80:
#line 1 "NONE"
	{te = p+1;}
	goto st43;
st43:
	if ( ++p == pe )
		goto _test_eof43;
case 43:
#line 551 "ext/xrb/template.c"
	switch( (*p) ) {
		case 32: goto tr81;
		case 35: goto tr67;
		case 60: goto tr68;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr81;
	goto st30;
tr81:
#line 7 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "instruction begin %s\n", p);
		instruction.begin = p;
	}
#line 61 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text end %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p;
	}
#line 66 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "\033[34m text delimiter begin %s\033[0m\n", p);
		delimiter.begin = p;
	}
	goto st4;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
#line 581 "ext/xrb/template.c"
	if ( (*p) == 63 )
		goto tr7;
	goto st4;
tr7:
#line 12 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
	}
	goto st5;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
#line 596 "ext/xrb/template.c"
	if ( (*p) == 62 )
		goto tr8;
	goto st4;
tr8:
#line 1 "NONE"
	{te = p+1;}
#line 17 "ext/xrb/template.rl"
	{act = 3;}
	goto st44;
st44:
	if ( ++p == pe )
		goto _test_eof44;
case 44:
#line 610 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr5;
		case 32: goto st3;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st3;
	goto tr82;
tr12:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 6;goto st6;}}
	goto st6;
st6:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof6;
case 6:
#line 628 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st7;
		case 39: goto st15;
		case 123: goto tr12;
		case 125: goto tr13;
	}
	goto st6;
tr28:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 7;goto st6;}}
	goto st7;
st7:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof7;
case 7:
#line 646 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st8;
		case 35: goto st14;
	}
	goto st7;
tr18:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 8;goto st6;}}
	goto st8;
tr20:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 8;goto st6;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 8;goto st6;}}
	goto st8;
st8:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof8;
case 8:
#line 668 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st9;
		case 39: goto st10;
		case 123: goto tr18;
		case 125: goto tr19;
	}
	goto st8;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
	switch( (*p) ) {
		case 35: goto st9;
		case 39: goto st10;
		case 123: goto tr20;
		case 125: goto tr19;
	}
	goto st8;
tr27:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 10;goto st6;}}
	goto st10;
st10:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof10;
case 10:
#line 697 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st11;
		case 35: goto st13;
		case 39: goto st11;
	}
	goto st10;
tr24:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 11;goto st6;}}
	goto st11;
tr26:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 11;goto st6;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 11;goto st6;}}
	goto st11;
st11:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof11;
case 11:
#line 720 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st12;
		case 123: goto tr24;
		case 125: goto tr25;
	}
	goto st11;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
	switch( (*p) ) {
		case 35: goto st12;
		case 123: goto tr26;
		case 125: goto tr25;
	}
	goto st11;
tr25:
#line 20 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st45;
st45:
	if ( ++p == pe )
		goto _test_eof45;
case 45:
#line 745 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st11;
		case 35: goto st13;
		case 39: goto st11;
	}
	goto st10;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
	switch( (*p) ) {
		case 34: goto st11;
		case 35: goto st13;
		case 39: goto st11;
		case 123: goto tr27;
	}
	goto st10;
tr19:
#line 20 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st46;
st46:
	if ( ++p == pe )
		goto _test_eof46;
case 46:
#line 771 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st8;
		case 35: goto st14;
	}
	goto st7;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
	switch( (*p) ) {
		case 34: goto st8;
		case 35: goto st14;
		case 123: goto tr28;
	}
	goto st7;
st15:
	if ( ++p == pe )
		goto _test_eof15;
case 15:
	if ( (*p) == 39 )
		goto st16;
	goto st15;
tr30:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 16;goto st6;}}
	goto st16;
st16:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof16;
case 16:
#line 804 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st10;
		case 123: goto tr30;
		case 125: goto tr31;
	}
	goto st16;
tr31:
#line 20 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st47;
st47:
	if ( ++p == pe )
		goto _test_eof47;
case 47:
#line 819 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st16;
	goto st15;
tr13:
#line 20 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st48;
st48:
	if ( ++p == pe )
		goto _test_eof48;
case 48:
#line 831 "ext/xrb/template.c"
	goto st0;
st0:
cs = 0;
	goto _out;
st17:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof17;
case 17:
#line 842 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto tr33;
		case 39: goto tr34;
		case 123: goto tr35;
		case 125: goto tr36;
	}
	goto tr32;
tr40:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 18;goto st6;}}
	goto st18;
tr32:
#line 31 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "expression begin %s\n", p);
		expression.begin = p;
	}
	goto st18;
tr35:
#line 31 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "expression begin %s\n", p);
		expression.begin = p;
	}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 18;goto st6;}}
	goto st18;
st18:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof18;
case 18:
#line 876 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st19;
		case 39: goto st27;
		case 123: goto tr40;
		case 125: goto tr41;
	}
	goto st18;
tr56:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 19;goto st6;}}
	goto st19;
tr33:
#line 31 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "expression begin %s\n", p);
		expression.begin = p;
	}
	goto st19;
st19:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof19;
case 19:
#line 901 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st20;
		case 35: goto st26;
	}
	goto st19;
tr46:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 20;goto st6;}}
	goto st20;
tr48:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 20;goto st6;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 20;goto st6;}}
	goto st20;
st20:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof20;
case 20:
#line 923 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st21;
		case 39: goto st22;
		case 123: goto tr46;
		case 125: goto tr47;
	}
	goto st20;
st21:
	if ( ++p == pe )
		goto _test_eof21;
case 21:
	switch( (*p) ) {
		case 35: goto st21;
		case 39: goto st22;
		case 123: goto tr48;
		case 125: goto tr47;
	}
	goto st20;
tr55:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 22;goto st6;}}
	goto st22;
st22:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof22;
case 22:
#line 952 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st23;
		case 35: goto st25;
		case 39: goto st23;
	}
	goto st22;
tr52:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 23;goto st6;}}
	goto st23;
tr54:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 23;goto st6;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 23;goto st6;}}
	goto st23;
st23:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof23;
case 23:
#line 975 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st24;
		case 123: goto tr52;
		case 125: goto tr53;
	}
	goto st23;
st24:
	if ( ++p == pe )
		goto _test_eof24;
case 24:
	switch( (*p) ) {
		case 35: goto st24;
		case 123: goto tr54;
		case 125: goto tr53;
	}
	goto st23;
tr53:
#line 36 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
	}
#line 41 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "\033[32m => emit expression %.*s\033[0m\n", (int)(expression.end-expression.begin), expression.begin);
		
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st49;
st49:
	if ( ++p == pe )
		goto _test_eof49;
case 49:
#line 1013 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st23;
		case 35: goto st25;
		case 39: goto st23;
	}
	goto st22;
st25:
	if ( ++p == pe )
		goto _test_eof25;
case 25:
	switch( (*p) ) {
		case 34: goto st23;
		case 35: goto st25;
		case 39: goto st23;
		case 123: goto tr55;
	}
	goto st22;
tr47:
#line 36 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
	}
#line 41 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "\033[32m => emit expression %.*s\033[0m\n", (int)(expression.end-expression.begin), expression.begin);
		
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st50;
st50:
	if ( ++p == pe )
		goto _test_eof50;
case 50:
#line 1052 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st20;
		case 35: goto st26;
	}
	goto st19;
st26:
	if ( ++p == pe )
		goto _test_eof26;
case 26:
	switch( (*p) ) {
		case 34: goto st20;
		case 35: goto st26;
		case 123: goto tr56;
	}
	goto st19;
tr34:
#line 31 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "expression begin %s\n", p);
		expression.begin = p;
	}
	goto st27;
st27:
	if ( ++p == pe )
		goto _test_eof27;
case 27:
#line 1079 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st28;
	goto st27;
tr58:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 28;goto st6;}}
	goto st28;
st28:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof28;
case 28:
#line 1093 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st22;
		case 123: goto tr58;
		case 125: goto tr59;
	}
	goto st28;
tr59:
#line 36 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
	}
#line 41 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "\033[32m => emit expression %.*s\033[0m\n", (int)(expression.end-expression.begin), expression.begin);
		
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st51;
st51:
	if ( ++p == pe )
		goto _test_eof51;
case 51:
#line 1121 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st28;
	goto st27;
tr36:
#line 31 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "expression begin %s\n", p);
		expression.begin = p;
	}
#line 36 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
	}
#line 41 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "\033[32m => emit expression %.*s\033[0m\n", (int)(expression.end-expression.begin), expression.begin);
		
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st52;
tr41:
#line 36 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
	}
#line 41 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "\033[32m => emit expression %.*s\033[0m\n", (int)(expression.end-expression.begin), expression.begin);
		
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st52;
st52:
	if ( ++p == pe )
		goto _test_eof52;
case 52:
#line 1168 "ext/xrb/template.c"
	goto st0;
	}
	_test_eof29: cs = 29; goto _test_eof; 
	_test_eof30: cs = 30; goto _test_eof; 
	_test_eof31: cs = 31; goto _test_eof; 
	_test_eof32: cs = 32; goto _test_eof; 
	_test_eof33: cs = 33; goto _test_eof; 
	_test_eof34: cs = 34; goto _test_eof; 
	_test_eof35: cs = 35; goto _test_eof; 
	_test_eof36: cs = 36; goto _test_eof; 
	_test_eof37: cs = 37; goto _test_eof; 
	_test_eof38: cs = 38; goto _test_eof; 
	_test_eof39: cs = 39; goto _test_eof; 
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof40: cs = 40; goto _test_eof; 
	_test_eof41: cs = 41; goto _test_eof; 
	_test_eof42: cs = 42; goto _test_eof; 
	_test_eof43: cs = 43; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof44: cs = 44; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 
	_test_eof12: cs = 12; goto _test_eof; 
	_test_eof45: cs = 45; goto _test_eof; 
	_test_eof13: cs = 13; goto _test_eof; 
	_test_eof46: cs = 46; goto _test_eof; 
	_test_eof14: cs = 14; goto _test_eof; 
	_test_eof15: cs = 15; goto _test_eof; 
	_test_eof16: cs = 16; goto _test_eof; 
	_test_eof47: cs = 47; goto _test_eof; 
	_test_eof48: cs = 48; goto _test_eof; 
	_test_eof17: cs = 17; goto _test_eof; 
	_test_eof18: cs = 18; goto _test_eof; 
	_test_eof19: cs = 19; goto _test_eof; 
	_test_eof20: cs = 20; goto _test_eof; 
	_test_eof21: cs = 21; goto _test_eof; 
	_test_eof22: cs = 22; goto _test_eof; 
	_test_eof23: cs = 23; goto _test_eof; 
	_test_eof24: cs = 24; goto _test_eof; 
	_test_eof49: cs = 49; goto _test_eof; 
	_test_eof25: cs = 25; goto _test_eof; 
	_test_eof50: cs = 50; goto _test_eof; 
	_test_eof26: cs = 26; goto _test_eof; 
	_test_eof27: cs = 27; goto _test_eof; 
	_test_eof28: cs = 28; goto _test_eof; 
	_test_eof51: cs = 51; goto _test_eof; 
	_test_eof52: cs = 52; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 30: goto tr65;
	case 31: goto tr65;
	case 32: goto tr65;
	case 33: goto tr65;
	case 34: goto tr65;
	case 35: goto tr65;
	case 36: goto tr65;
	case 37: goto tr65;
	case 38: goto tr65;
	case 39: goto tr77;
	case 1: goto tr0;
	case 2: goto tr0;
	case 3: goto tr4;
	case 40: goto tr65;
	case 41: goto tr65;
	case 42: goto tr65;
	case 43: goto tr65;
	case 4: goto tr0;
	case 5: goto tr0;
	case 44: goto tr82;
	case 17: 
	case 18: 
	case 19: 
	case 20: 
	case 21: 
	case 22: 
	case 23: 
	case 24: 
	case 25: 
	case 26: 
	case 27: 
	case 28: 
#line 49 "ext/xrb/template.rl"
	{
		XRB_raise_error("failed to parse expression", buffer, p-s);
	}
	break;
#line 1265 "ext/xrb/template.c"
	}
	}

	_out: {}
	}

#line 116 "ext/xrb/template.rl"

	
	if (p != eof) {
		XRB_raise_error("could not parse all input", buffer, p-s);
	}
	
	return Qnil;
}
