
#line 1 "ext/xrb/template.rl"

#include "template.h"


#line 8 "ext/xrb/template.c"
static const int XRB_template_parser_start = 49;
static const int XRB_template_parser_first_final = 49;
static const int XRB_template_parser_error = 0;

static const int XRB_template_parser_en_parse_nested_expression = 26;
static const int XRB_template_parser_en_parse_expression = 37;
static const int XRB_template_parser_en_main = 49;


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
		case 49: goto st49;
		case 50: goto st50;
		case 51: goto st51;
		case 1: goto st1;
		case 2: goto st2;
		case 3: goto st3;
		case 4: goto st4;
		case 5: goto st5;
		case 52: goto st52;
		case 53: goto st53;
		case 54: goto st54;
		case 55: goto st55;
		case 56: goto st56;
		case 57: goto st57;
		case 58: goto st58;
		case 59: goto st59;
		case 60: goto st60;
		case 6: goto st6;
		case 7: goto st7;
		case 8: goto st8;
		case 9: goto st9;
		case 61: goto st61;
		case 10: goto st10;
		case 11: goto st11;
		case 12: goto st12;
		case 13: goto st13;
		case 14: goto st14;
		case 15: goto st15;
		case 16: goto st16;
		case 62: goto st62;
		case 63: goto st63;
		case 64: goto st64;
		case 65: goto st65;
		case 17: goto st17;
		case 18: goto st18;
		case 19: goto st19;
		case 66: goto st66;
		case 67: goto st67;
		case 20: goto st20;
		case 21: goto st21;
		case 22: goto st22;
		case 23: goto st23;
		case 68: goto st68;
		case 24: goto st24;
		case 25: goto st25;
		case 26: goto st26;
		case 27: goto st27;
		case 28: goto st28;
		case 29: goto st29;
		case 30: goto st30;
		case 31: goto st31;
		case 32: goto st32;
		case 69: goto st69;
		case 33: goto st33;
		case 70: goto st70;
		case 34: goto st34;
		case 35: goto st35;
		case 36: goto st36;
		case 71: goto st71;
		case 72: goto st72;
		case 0: goto st0;
		case 37: goto st37;
		case 38: goto st38;
		case 39: goto st39;
		case 40: goto st40;
		case 41: goto st41;
		case 42: goto st42;
		case 43: goto st43;
		case 44: goto st44;
		case 73: goto st73;
		case 45: goto st45;
		case 74: goto st74;
		case 46: goto st46;
		case 47: goto st47;
		case 48: goto st48;
		case 75: goto st75;
		case 76: goto st76;
	default: break;
	}

	if ( ++p == pe )
		goto _test_eof;
_resume:
	switch ( cs )
	{
tr0:
#line 1 "NONE"
	{	switch( act ) {
	case 1:
	{{p = ((te))-1;}
		// fprintf(stderr, "\033[32m => emit multiline instruction %.*s\033[0m\n", (int)(instruction.end-instruction.begin), instruction.begin);
		rb_funcall(delegate, id_instruction, 2, XRB_Token_string(instruction, encoding), newline);
	}
	break;
	case 2:
	{{p = ((te))-1;}
		if (delimiter.begin && delimiter.end) {
			text.end = delimiter.begin;
			
			// Backtrack:
			p = delimiter.begin - 1;
		}
		
		fprintf(stderr, "\033[32m => emit text \"%.*s\"\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}
	break;
	case 4:
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
		
		fprintf(stderr, "\033[32m => emit text \"%.*s\"\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}
	break;
	}
	}
	goto st49;
tr7:
#line 27 "ext/xrb/template.rl"
	{
		XRB_raise_error("failed to parse instruction", buffer, p-s);
	}
#line 1 "NONE"
	{	switch( act ) {
	case 1:
	{{p = ((te))-1;}
		// fprintf(stderr, "\033[32m => emit multiline instruction %.*s\033[0m\n", (int)(instruction.end-instruction.begin), instruction.begin);
		rb_funcall(delegate, id_instruction, 2, XRB_Token_string(instruction, encoding), newline);
	}
	break;
	case 2:
	{{p = ((te))-1;}
		if (delimiter.begin && delimiter.end) {
			text.end = delimiter.begin;
			
			// Backtrack:
			p = delimiter.begin - 1;
		}
		
		fprintf(stderr, "\033[32m => emit text \"%.*s\"\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}
	break;
	case 4:
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
		
		fprintf(stderr, "\033[32m => emit text \"%.*s\"\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}
	break;
	}
	}
	goto st49;
tr11:
#line 22 "ext/xrb/template.rl"
	{te = p+1;{
		// fprintf(stderr, "\033[32m => emit multiline instruction %.*s\033[0m\n", (int)(instruction.end-instruction.begin), instruction.begin);
		rb_funcall(delegate, id_instruction, 2, XRB_Token_string(instruction, encoding), newline);
	}}
	goto st49;
tr12:
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
		
		fprintf(stderr, "\033[32m => emit text \"%.*s\"\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}}
	goto st49;
tr14:
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
		
		fprintf(stderr, "\033[32m => emit text \"%.*s\"\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}}
	goto st49;
tr92:
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
		
		fprintf(stderr, "\033[32m => emit text \"%.*s\"\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}}
	goto st49;
tr97:
#line 61 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text end %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p;
	}
#line 1 "NONE"
	{	switch( act ) {
	case 1:
	{{p = ((te))-1;}
		// fprintf(stderr, "\033[32m => emit multiline instruction %.*s\033[0m\n", (int)(instruction.end-instruction.begin), instruction.begin);
		rb_funcall(delegate, id_instruction, 2, XRB_Token_string(instruction, encoding), newline);
	}
	break;
	case 2:
	{{p = ((te))-1;}
		if (delimiter.begin && delimiter.end) {
			text.end = delimiter.begin;
			
			// Backtrack:
			p = delimiter.begin - 1;
		}
		
		fprintf(stderr, "\033[32m => emit text \"%.*s\"\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}
	break;
	case 4:
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
		
		fprintf(stderr, "\033[32m => emit text \"%.*s\"\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}
	break;
	}
	}
	goto st49;
tr98:
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
		
		fprintf(stderr, "\033[32m => emit text \"%.*s\"\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}}
	goto st49;
tr108:
#line 76 "ext/xrb/template.rl"
	{te = p;p--;{
		if (delimiter.begin && delimiter.end) {
			text.end = delimiter.begin;
			
			// Backtrack:
			p = delimiter.begin - 1;
		}
		
		fprintf(stderr, "\033[32m => emit text \"%.*s\"\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}}
	goto st49;
tr109:
#line 61 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text end %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p;
	}
#line 76 "ext/xrb/template.rl"
	{te = p;p--;{
		if (delimiter.begin && delimiter.end) {
			text.end = delimiter.begin;
			
			// Backtrack:
			p = delimiter.begin - 1;
		}
		
		fprintf(stderr, "\033[32m => emit text \"%.*s\"\033[0m\n", (int)(text.end-text.begin), text.begin);
		rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
	}}
	goto st49;
tr110:
#line 52 "parsers/xrb/template.rl"
	{te = p+1;{{stack[top++] = 49;goto st37;}}}
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
	goto st49;
tr115:
#line 17 "ext/xrb/template.rl"
	{te = p;p--;{
		// fprintf(stderr, "\033[32m => emit instruction %.*s\033[0m\n", (int)(instruction.end-instruction.begin), instruction.begin);
		rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
	}}
	goto st49;
st49:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof49;
case 49:
#line 1 "NONE"
	{ts = p;}
#line 428 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr89;
		case 32: goto tr88;
		case 35: goto tr90;
		case 60: goto tr91;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr88;
	goto tr87;
tr87:
#line 53 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
	goto st50;
st50:
	if ( ++p == pe )
		goto _test_eof50;
case 50:
#line 452 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr94;
		case 35: goto tr95;
		case 60: goto tr96;
	}
	goto st50;
tr2:
#line 1 "NONE"
	{te = p+1;}
#line 76 "ext/xrb/template.rl"
	{act = 2;}
	goto st51;
tr23:
#line 1 "NONE"
	{te = p+1;}
#line 22 "ext/xrb/template.rl"
	{act = 1;}
	goto st51;
tr89:
#line 1 "NONE"
	{te = p+1;}
#line 53 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
#line 76 "ext/xrb/template.rl"
	{act = 2;}
	goto st51;
tr94:
#line 1 "NONE"
	{te = p+1;}
#line 76 "ext/xrb/template.rl"
	{act = 2;}
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
	goto st51;
tr101:
#line 1 "NONE"
	{te = p+1;}
#line 76 "ext/xrb/template.rl"
	{act = 2;}
#line 71 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "\033[34m text delimiter end %s\033[0m\n", p);
		delimiter.end = p;
	}
	goto st51;
st51:
	if ( ++p == pe )
		goto _test_eof51;
case 51:
#line 516 "ext/xrb/template.c"
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
		case 10: goto tr2;
		case 32: goto tr0;
		case 35: goto st2;
		case 60: goto st3;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr0;
	goto st1;
tr95:
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
	goto st52;
st52:
	if ( ++p == pe )
		goto _test_eof52;
case 52:
#line 595 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr94;
		case 35: goto tr95;
		case 60: goto tr96;
		case 123: goto tr98;
	}
	goto st50;
tr96:
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
	goto st53;
st53:
	if ( ++p == pe )
		goto _test_eof53;
case 53:
#line 619 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr94;
		case 35: goto tr95;
		case 60: goto tr96;
		case 63: goto st54;
	}
	goto st50;
st54:
	if ( ++p == pe )
		goto _test_eof54;
case 54:
	switch( (*p) ) {
		case 10: goto tr94;
		case 35: goto tr95;
		case 60: goto tr96;
		case 114: goto st55;
	}
	goto st50;
st55:
	if ( ++p == pe )
		goto _test_eof55;
case 55:
	switch( (*p) ) {
		case 10: goto tr101;
		case 32: goto tr98;
		case 35: goto tr95;
		case 60: goto tr96;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr98;
	goto st50;
tr88:
#line 53 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
	goto st56;
st56:
	if ( ++p == pe )
		goto _test_eof56;
case 56:
#line 665 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr94;
		case 32: goto st56;
		case 35: goto tr95;
		case 60: goto tr103;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st56;
	goto st50;
tr103:
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
	goto st57;
st57:
	if ( ++p == pe )
		goto _test_eof57;
case 57:
#line 691 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr94;
		case 35: goto tr95;
		case 60: goto tr96;
		case 63: goto st58;
	}
	goto st50;
st58:
	if ( ++p == pe )
		goto _test_eof58;
case 58:
	switch( (*p) ) {
		case 10: goto tr94;
		case 35: goto tr95;
		case 60: goto tr96;
		case 114: goto st59;
	}
	goto st50;
st59:
	if ( ++p == pe )
		goto _test_eof59;
case 59:
	switch( (*p) ) {
		case 10: goto tr107;
		case 32: goto tr106;
		case 35: goto tr95;
		case 60: goto tr96;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr106;
	goto st50;
tr106:
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
	goto st60;
st60:
	if ( ++p == pe )
		goto _test_eof60;
case 60:
#line 743 "ext/xrb/template.c"
	switch( (*p) ) {
		case 32: goto st9;
		case 63: goto tr9;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st9;
	goto st6;
st6:
	if ( ++p == pe )
		goto _test_eof6;
case 6:
	if ( (*p) == 63 )
		goto tr9;
	goto st6;
tr9:
#line 12 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
	}
	goto st7;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
#line 769 "ext/xrb/template.c"
	if ( (*p) == 62 )
		goto st8;
	goto st6;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
	switch( (*p) ) {
		case 10: goto tr11;
		case 32: goto st8;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st8;
	goto tr0;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
	switch( (*p) ) {
		case 32: goto st9;
		case 63: goto tr9;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st9;
	goto st6;
tr16:
#line 1 "NONE"
	{te = p+1;}
#line 76 "ext/xrb/template.rl"
	{act = 2;}
	goto st61;
tr107:
#line 1 "NONE"
	{te = p+1;}
#line 7 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "instruction begin %s\n", p);
		instruction.begin = p;
	}
#line 76 "ext/xrb/template.rl"
	{act = 2;}
#line 71 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "\033[34m text delimiter end %s\033[0m\n", p);
		delimiter.end = p;
	}
	goto st61;
st61:
	if ( ++p == pe )
		goto _test_eof61;
case 61:
#line 821 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr16;
		case 35: goto st11;
		case 60: goto st12;
		case 63: goto tr19;
	}
	goto st10;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
	switch( (*p) ) {
		case 10: goto tr16;
		case 35: goto st11;
		case 60: goto st12;
		case 63: goto tr19;
	}
	goto st10;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
	switch( (*p) ) {
		case 10: goto tr16;
		case 35: goto st11;
		case 60: goto st12;
		case 63: goto tr19;
		case 123: goto st6;
	}
	goto st10;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
	switch( (*p) ) {
		case 10: goto tr16;
		case 35: goto st11;
		case 60: goto st12;
		case 63: goto tr20;
	}
	goto st10;
tr20:
#line 12 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
	}
	goto st13;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
#line 874 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr16;
		case 35: goto st11;
		case 60: goto st12;
		case 62: goto st14;
		case 114: goto st15;
	}
	goto st10;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
	switch( (*p) ) {
		case 10: goto tr23;
		case 32: goto st14;
		case 35: goto st2;
		case 60: goto st3;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st14;
	goto st1;
st15:
	if ( ++p == pe )
		goto _test_eof15;
case 15:
	switch( (*p) ) {
		case 10: goto tr16;
		case 32: goto st6;
		case 35: goto st11;
		case 60: goto st12;
		case 63: goto tr19;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st6;
	goto st10;
tr19:
#line 12 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
	}
	goto st16;
st16:
	if ( ++p == pe )
		goto _test_eof16;
case 16:
#line 921 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr16;
		case 35: goto st11;
		case 60: goto st12;
		case 62: goto st14;
	}
	goto st10;
tr90:
#line 53 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
	goto st62;
st62:
	if ( ++p == pe )
		goto _test_eof62;
case 62:
#line 943 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr94;
		case 35: goto tr95;
		case 60: goto tr96;
		case 123: goto tr110;
	}
	goto st50;
tr91:
#line 53 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
	goto st63;
st63:
	if ( ++p == pe )
		goto _test_eof63;
case 63:
#line 965 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr94;
		case 35: goto tr95;
		case 60: goto tr96;
		case 63: goto st64;
	}
	goto st50;
st64:
	if ( ++p == pe )
		goto _test_eof64;
case 64:
	switch( (*p) ) {
		case 10: goto tr94;
		case 35: goto tr95;
		case 60: goto tr96;
		case 114: goto tr112;
	}
	goto st50;
tr112:
#line 1 "NONE"
	{te = p+1;}
#line 76 "ext/xrb/template.rl"
	{act = 5;}
	goto st65;
st65:
	if ( ++p == pe )
		goto _test_eof65;
case 65:
#line 994 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr114;
		case 32: goto tr113;
		case 35: goto tr95;
		case 60: goto tr96;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr113;
	goto st50;
tr113:
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
	goto st17;
st17:
	if ( ++p == pe )
		goto _test_eof17;
case 17:
#line 1025 "ext/xrb/template.c"
	switch( (*p) ) {
		case 32: goto st17;
		case 63: goto tr26;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st17;
	goto st18;
st18:
	if ( ++p == pe )
		goto _test_eof18;
case 18:
	if ( (*p) == 63 )
		goto tr26;
	goto st18;
tr26:
#line 12 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
	}
	goto st19;
st19:
	if ( ++p == pe )
		goto _test_eof19;
case 19:
#line 1051 "ext/xrb/template.c"
	if ( (*p) == 62 )
		goto tr27;
	goto st18;
tr27:
#line 1 "NONE"
	{te = p+1;}
#line 17 "ext/xrb/template.rl"
	{act = 4;}
	goto st66;
st66:
	if ( ++p == pe )
		goto _test_eof66;
case 66:
#line 1065 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr11;
		case 32: goto st8;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st8;
	goto tr115;
tr29:
#line 1 "NONE"
	{te = p+1;}
#line 76 "ext/xrb/template.rl"
	{act = 2;}
	goto st67;
tr114:
#line 1 "NONE"
	{te = p+1;}
#line 7 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "instruction begin %s\n", p);
		instruction.begin = p;
	}
#line 76 "ext/xrb/template.rl"
	{act = 2;}
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
	goto st67;
st67:
	if ( ++p == pe )
		goto _test_eof67;
case 67:
#line 1104 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr29;
		case 35: goto st21;
		case 60: goto st22;
		case 63: goto tr32;
	}
	goto st20;
st20:
	if ( ++p == pe )
		goto _test_eof20;
case 20:
	switch( (*p) ) {
		case 10: goto tr29;
		case 35: goto st21;
		case 60: goto st22;
		case 63: goto tr32;
	}
	goto st20;
st21:
	if ( ++p == pe )
		goto _test_eof21;
case 21:
	switch( (*p) ) {
		case 10: goto tr29;
		case 35: goto st21;
		case 60: goto st22;
		case 63: goto tr32;
		case 123: goto st18;
	}
	goto st20;
st22:
	if ( ++p == pe )
		goto _test_eof22;
case 22:
	switch( (*p) ) {
		case 10: goto tr29;
		case 35: goto st21;
		case 60: goto st22;
		case 63: goto tr33;
	}
	goto st20;
tr33:
#line 12 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
	}
	goto st23;
st23:
	if ( ++p == pe )
		goto _test_eof23;
case 23:
#line 1157 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr29;
		case 35: goto st21;
		case 60: goto st22;
		case 62: goto tr34;
		case 114: goto st24;
	}
	goto st20;
tr34:
#line 1 "NONE"
	{te = p+1;}
#line 17 "ext/xrb/template.rl"
	{act = 4;}
	goto st68;
st68:
	if ( ++p == pe )
		goto _test_eof68;
case 68:
#line 1176 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr23;
		case 32: goto st14;
		case 35: goto st2;
		case 60: goto st3;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st14;
	goto st1;
st24:
	if ( ++p == pe )
		goto _test_eof24;
case 24:
	switch( (*p) ) {
		case 10: goto tr29;
		case 32: goto st18;
		case 35: goto st21;
		case 60: goto st22;
		case 63: goto tr32;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st18;
	goto st20;
tr32:
#line 12 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
	}
	goto st25;
st25:
	if ( ++p == pe )
		goto _test_eof25;
case 25:
#line 1211 "ext/xrb/template.c"
	switch( (*p) ) {
		case 10: goto tr29;
		case 35: goto st21;
		case 60: goto st22;
		case 62: goto tr34;
	}
	goto st20;
tr39:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 26;goto st26;}}
	goto st26;
st26:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof26;
case 26:
#line 1229 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st27;
		case 39: goto st35;
		case 123: goto tr39;
		case 125: goto tr40;
	}
	goto st26;
tr55:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 27;goto st26;}}
	goto st27;
st27:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof27;
case 27:
#line 1247 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st28;
		case 35: goto st34;
	}
	goto st27;
tr45:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 28;goto st26;}}
	goto st28;
tr47:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 28;goto st26;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 28;goto st26;}}
	goto st28;
st28:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof28;
case 28:
#line 1269 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st29;
		case 39: goto st30;
		case 123: goto tr45;
		case 125: goto tr46;
	}
	goto st28;
st29:
	if ( ++p == pe )
		goto _test_eof29;
case 29:
	switch( (*p) ) {
		case 35: goto st29;
		case 39: goto st30;
		case 123: goto tr47;
		case 125: goto tr46;
	}
	goto st28;
tr54:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 30;goto st26;}}
	goto st30;
st30:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof30;
case 30:
#line 1298 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st31;
		case 35: goto st33;
		case 39: goto st31;
	}
	goto st30;
tr51:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 31;goto st26;}}
	goto st31;
tr53:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 31;goto st26;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 31;goto st26;}}
	goto st31;
st31:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof31;
case 31:
#line 1321 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st32;
		case 123: goto tr51;
		case 125: goto tr52;
	}
	goto st31;
st32:
	if ( ++p == pe )
		goto _test_eof32;
case 32:
	switch( (*p) ) {
		case 35: goto st32;
		case 123: goto tr53;
		case 125: goto tr52;
	}
	goto st31;
tr52:
#line 20 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st69;
st69:
	if ( ++p == pe )
		goto _test_eof69;
case 69:
#line 1346 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st31;
		case 35: goto st33;
		case 39: goto st31;
	}
	goto st30;
st33:
	if ( ++p == pe )
		goto _test_eof33;
case 33:
	switch( (*p) ) {
		case 34: goto st31;
		case 35: goto st33;
		case 39: goto st31;
		case 123: goto tr54;
	}
	goto st30;
tr46:
#line 20 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st70;
st70:
	if ( ++p == pe )
		goto _test_eof70;
case 70:
#line 1372 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st28;
		case 35: goto st34;
	}
	goto st27;
st34:
	if ( ++p == pe )
		goto _test_eof34;
case 34:
	switch( (*p) ) {
		case 34: goto st28;
		case 35: goto st34;
		case 123: goto tr55;
	}
	goto st27;
st35:
	if ( ++p == pe )
		goto _test_eof35;
case 35:
	if ( (*p) == 39 )
		goto st36;
	goto st35;
tr57:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 36;goto st26;}}
	goto st36;
st36:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof36;
case 36:
#line 1405 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st30;
		case 123: goto tr57;
		case 125: goto tr58;
	}
	goto st36;
tr58:
#line 20 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st71;
st71:
	if ( ++p == pe )
		goto _test_eof71;
case 71:
#line 1420 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st36;
	goto st35;
tr40:
#line 20 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st72;
st72:
	if ( ++p == pe )
		goto _test_eof72;
case 72:
#line 1432 "ext/xrb/template.c"
	goto st0;
st0:
cs = 0;
	goto _out;
st37:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof37;
case 37:
#line 1443 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto tr60;
		case 39: goto tr61;
		case 123: goto tr62;
		case 125: goto tr63;
	}
	goto tr59;
tr67:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 38;goto st26;}}
	goto st38;
tr59:
#line 31 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "expression begin %s\n", p);
		expression.begin = p;
	}
	goto st38;
tr62:
#line 31 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "expression begin %s\n", p);
		expression.begin = p;
	}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 38;goto st26;}}
	goto st38;
st38:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof38;
case 38:
#line 1477 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st39;
		case 39: goto st47;
		case 123: goto tr67;
		case 125: goto tr68;
	}
	goto st38;
tr83:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 39;goto st26;}}
	goto st39;
tr60:
#line 31 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "expression begin %s\n", p);
		expression.begin = p;
	}
	goto st39;
st39:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof39;
case 39:
#line 1502 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st40;
		case 35: goto st46;
	}
	goto st39;
tr73:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 40;goto st26;}}
	goto st40;
tr75:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 40;goto st26;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 40;goto st26;}}
	goto st40;
st40:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof40;
case 40:
#line 1524 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st41;
		case 39: goto st42;
		case 123: goto tr73;
		case 125: goto tr74;
	}
	goto st40;
st41:
	if ( ++p == pe )
		goto _test_eof41;
case 41:
	switch( (*p) ) {
		case 35: goto st41;
		case 39: goto st42;
		case 123: goto tr75;
		case 125: goto tr74;
	}
	goto st40;
tr82:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 42;goto st26;}}
	goto st42;
st42:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof42;
case 42:
#line 1553 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st43;
		case 35: goto st45;
		case 39: goto st43;
	}
	goto st42;
tr79:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 43;goto st26;}}
	goto st43;
tr81:
#line 14 "parsers/xrb/template.rl"
	{{stack[top++] = 43;goto st26;}}
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 43;goto st26;}}
	goto st43;
st43:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof43;
case 43:
#line 1576 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto st44;
		case 123: goto tr79;
		case 125: goto tr80;
	}
	goto st43;
st44:
	if ( ++p == pe )
		goto _test_eof44;
case 44:
	switch( (*p) ) {
		case 35: goto st44;
		case 123: goto tr81;
		case 125: goto tr80;
	}
	goto st43;
tr80:
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
	goto st73;
st73:
	if ( ++p == pe )
		goto _test_eof73;
case 73:
#line 1614 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st43;
		case 35: goto st45;
		case 39: goto st43;
	}
	goto st42;
st45:
	if ( ++p == pe )
		goto _test_eof45;
case 45:
	switch( (*p) ) {
		case 34: goto st43;
		case 35: goto st45;
		case 39: goto st43;
		case 123: goto tr82;
	}
	goto st42;
tr74:
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
	goto st74;
st74:
	if ( ++p == pe )
		goto _test_eof74;
case 74:
#line 1653 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st40;
		case 35: goto st46;
	}
	goto st39;
st46:
	if ( ++p == pe )
		goto _test_eof46;
case 46:
	switch( (*p) ) {
		case 34: goto st40;
		case 35: goto st46;
		case 123: goto tr83;
	}
	goto st39;
tr61:
#line 31 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "expression begin %s\n", p);
		expression.begin = p;
	}
	goto st47;
st47:
	if ( ++p == pe )
		goto _test_eof47;
case 47:
#line 1680 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st48;
	goto st47;
tr85:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 48;goto st26;}}
	goto st48;
st48:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof48;
case 48:
#line 1694 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st42;
		case 123: goto tr85;
		case 125: goto tr86;
	}
	goto st48;
tr86:
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
	goto st75;
st75:
	if ( ++p == pe )
		goto _test_eof75;
case 75:
#line 1722 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st48;
	goto st47;
tr63:
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
	goto st76;
tr68:
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
	goto st76;
st76:
	if ( ++p == pe )
		goto _test_eof76;
case 76:
#line 1769 "ext/xrb/template.c"
	goto st0;
	}
	_test_eof49: cs = 49; goto _test_eof; 
	_test_eof50: cs = 50; goto _test_eof; 
	_test_eof51: cs = 51; goto _test_eof; 
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof52: cs = 52; goto _test_eof; 
	_test_eof53: cs = 53; goto _test_eof; 
	_test_eof54: cs = 54; goto _test_eof; 
	_test_eof55: cs = 55; goto _test_eof; 
	_test_eof56: cs = 56; goto _test_eof; 
	_test_eof57: cs = 57; goto _test_eof; 
	_test_eof58: cs = 58; goto _test_eof; 
	_test_eof59: cs = 59; goto _test_eof; 
	_test_eof60: cs = 60; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof61: cs = 61; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 
	_test_eof12: cs = 12; goto _test_eof; 
	_test_eof13: cs = 13; goto _test_eof; 
	_test_eof14: cs = 14; goto _test_eof; 
	_test_eof15: cs = 15; goto _test_eof; 
	_test_eof16: cs = 16; goto _test_eof; 
	_test_eof62: cs = 62; goto _test_eof; 
	_test_eof63: cs = 63; goto _test_eof; 
	_test_eof64: cs = 64; goto _test_eof; 
	_test_eof65: cs = 65; goto _test_eof; 
	_test_eof17: cs = 17; goto _test_eof; 
	_test_eof18: cs = 18; goto _test_eof; 
	_test_eof19: cs = 19; goto _test_eof; 
	_test_eof66: cs = 66; goto _test_eof; 
	_test_eof67: cs = 67; goto _test_eof; 
	_test_eof20: cs = 20; goto _test_eof; 
	_test_eof21: cs = 21; goto _test_eof; 
	_test_eof22: cs = 22; goto _test_eof; 
	_test_eof23: cs = 23; goto _test_eof; 
	_test_eof68: cs = 68; goto _test_eof; 
	_test_eof24: cs = 24; goto _test_eof; 
	_test_eof25: cs = 25; goto _test_eof; 
	_test_eof26: cs = 26; goto _test_eof; 
	_test_eof27: cs = 27; goto _test_eof; 
	_test_eof28: cs = 28; goto _test_eof; 
	_test_eof29: cs = 29; goto _test_eof; 
	_test_eof30: cs = 30; goto _test_eof; 
	_test_eof31: cs = 31; goto _test_eof; 
	_test_eof32: cs = 32; goto _test_eof; 
	_test_eof69: cs = 69; goto _test_eof; 
	_test_eof33: cs = 33; goto _test_eof; 
	_test_eof70: cs = 70; goto _test_eof; 
	_test_eof34: cs = 34; goto _test_eof; 
	_test_eof35: cs = 35; goto _test_eof; 
	_test_eof36: cs = 36; goto _test_eof; 
	_test_eof71: cs = 71; goto _test_eof; 
	_test_eof72: cs = 72; goto _test_eof; 
	_test_eof37: cs = 37; goto _test_eof; 
	_test_eof38: cs = 38; goto _test_eof; 
	_test_eof39: cs = 39; goto _test_eof; 
	_test_eof40: cs = 40; goto _test_eof; 
	_test_eof41: cs = 41; goto _test_eof; 
	_test_eof42: cs = 42; goto _test_eof; 
	_test_eof43: cs = 43; goto _test_eof; 
	_test_eof44: cs = 44; goto _test_eof; 
	_test_eof73: cs = 73; goto _test_eof; 
	_test_eof45: cs = 45; goto _test_eof; 
	_test_eof74: cs = 74; goto _test_eof; 
	_test_eof46: cs = 46; goto _test_eof; 
	_test_eof47: cs = 47; goto _test_eof; 
	_test_eof48: cs = 48; goto _test_eof; 
	_test_eof75: cs = 75; goto _test_eof; 
	_test_eof76: cs = 76; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 50: goto tr92;
	case 51: goto tr97;
	case 1: goto tr0;
	case 2: goto tr0;
	case 3: goto tr0;
	case 4: goto tr0;
	case 5: goto tr0;
	case 52: goto tr92;
	case 53: goto tr92;
	case 54: goto tr92;
	case 55: goto tr92;
	case 56: goto tr92;
	case 57: goto tr92;
	case 58: goto tr92;
	case 59: goto tr92;
	case 60: goto tr108;
	case 6: goto tr7;
	case 7: goto tr7;
	case 8: goto tr0;
	case 9: goto tr12;
	case 61: goto tr109;
	case 10: goto tr14;
	case 11: goto tr14;
	case 12: goto tr14;
	case 13: goto tr14;
	case 14: goto tr0;
	case 15: goto tr14;
	case 16: goto tr14;
	case 62: goto tr92;
	case 63: goto tr92;
	case 64: goto tr92;
	case 65: goto tr92;
	case 17: goto tr12;
	case 18: goto tr7;
	case 19: goto tr7;
	case 66: goto tr115;
	case 67: goto tr109;
	case 20: goto tr14;
	case 21: goto tr14;
	case 22: goto tr14;
	case 23: goto tr14;
	case 68: goto tr115;
	case 24: goto tr14;
	case 25: goto tr14;
	case 37: 
	case 38: 
	case 39: 
	case 40: 
	case 41: 
	case 42: 
	case 43: 
	case 44: 
	case 45: 
	case 46: 
	case 47: 
	case 48: 
#line 49 "ext/xrb/template.rl"
	{
		XRB_raise_error("failed to parse expression", buffer, p-s);
	}
	break;
	case 49: 
#line 53 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
		
		delimiter.begin = NULL;
		delimiter.end = NULL;
	}
#line 61 "ext/xrb/template.rl"
	{
		// fprintf(stderr, "text end %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p;
	}
	break;
#line 1929 "ext/xrb/template.c"
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
