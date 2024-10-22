
#line 1 "ext/xrb/template.rl"

#include "template.h"


#line 8 "ext/xrb/template.c"
static const int XRB_template_parser_start = 24;
static const int XRB_template_parser_first_final = 24;
static const int XRB_template_parser_error = 0;

static const int XRB_template_parser_en_parse_nested_expression = 1;
static const int XRB_template_parser_en_parse_expression = 12;
static const int XRB_template_parser_en_main = 24;


#line 80 "ext/xrb/template.rl"


VALUE XRB_Native_parse_template(VALUE self, VALUE buffer, VALUE delegate) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	rb_encoding *encoding = rb_enc_get(string);
	
	// VALUE newline = rb_obj_freeze(rb_enc_str_new("\n", 1, encoding));
	
	const char *s, *p, *pe, *eof, *ts, *te;
	unsigned long cs, top = 0, stack[32] = {0}, act;
	
	XRB_Token expression = {0}, instruction = {0}, text = {0}, token = {0};
	
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
		case 24: goto st24;
		case 25: goto st25;
		case 26: goto st26;
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
		case 37: goto st37;
		case 38: goto st38;
		case 39: goto st39;
		case 40: goto st40;
		case 41: goto st41;
		case 42: goto st42;
		case 43: goto st43;
		case 44: goto st44;
		case 45: goto st45;
		case 46: goto st46;
		case 47: goto st47;
		case 48: goto st48;
		case 49: goto st49;
		case 50: goto st50;
		case 51: goto st51;
		case 52: goto st52;
		case 53: goto st53;
		case 54: goto st54;
		case 55: goto st55;
		case 56: goto st56;
		case 57: goto st57;
		case 1: goto st1;
		case 2: goto st2;
		case 3: goto st3;
		case 4: goto st4;
		case 5: goto st5;
		case 6: goto st6;
		case 7: goto st7;
		case 58: goto st58;
		case 8: goto st8;
		case 59: goto st59;
		case 9: goto st9;
		case 10: goto st10;
		case 11: goto st11;
		case 60: goto st60;
		case 61: goto st61;
		case 0: goto st0;
		case 12: goto st12;
		case 13: goto st13;
		case 14: goto st14;
		case 15: goto st15;
		case 16: goto st16;
		case 17: goto st17;
		case 18: goto st18;
		case 19: goto st19;
		case 62: goto st62;
		case 20: goto st20;
		case 63: goto st63;
		case 21: goto st21;
		case 22: goto st22;
		case 23: goto st23;
		case 64: goto st64;
		case 65: goto st65;
	default: break;
	}

	if ( ++p == pe )
		goto _test_eof;
_resume:
	switch ( cs )
	{
tr55:
#line 52 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text end %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p;
		
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
#line 1 "NONE"
	{	switch( act ) {
	default:
	{{p = ((te))-1;}}
	break;
	}
	}
	goto st24;
tr59:
#line 52 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text end %.*s\n", (int)(p-text.begin), text.begin);
		text.end = p;
		
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
#line 40 "parsers/xrb/template.rl"
	{te = p;p--;}
	goto st24;
st24:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof24;
case 24:
#line 1 "NONE"
	{ts = p;}
#line 167 "ext/xrb/template.c"
	switch( (*p) ) {
		case 9: goto tr52;
		case 32: goto tr52;
		case 35: goto tr53;
		case 60: goto tr54;
	}
	if ( 11 <= (*p) && (*p) <= 13 )
		goto tr52;
	goto tr51;
tr51:
#line 1 "NONE"
	{te = p+1;}
#line 47 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
	}
#line 40 "parsers/xrb/template.rl"
	{act = 2;}
	goto st25;
tr56:
#line 1 "NONE"
	{te = p+1;}
#line 40 "parsers/xrb/template.rl"
	{act = 2;}
	goto st25;
tr85:
#line 1 "NONE"
	{te = p+1;}
#line 39 "parsers/xrb/template.rl"
	{act = 1;}
	goto st25;
tr86:
	cs = 25;
#line 1 "NONE"
	{te = p+1;}
#line 40 "parsers/xrb/template.rl"
	{act = 2;}
#line 34 "parsers/xrb/template.rl"
	{cs = 12;}
	goto _again;
st25:
	if ( ++p == pe )
		goto _test_eof25;
case 25:
#line 213 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr57;
		case 60: goto tr58;
	}
	goto tr56;
tr57:
#line 61 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token begin %s\n", p);
		token.begin = p;
	}
	goto st26;
st26:
	if ( ++p == pe )
		goto _test_eof26;
case 26:
#line 230 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr57;
		case 60: goto tr58;
		case 123: goto tr60;
	}
	goto tr56;
tr58:
#line 61 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token begin %s\n", p);
		token.begin = p;
	}
	goto st27;
st27:
	if ( ++p == pe )
		goto _test_eof27;
case 27:
#line 248 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr57;
		case 60: goto tr58;
		case 63: goto st28;
	}
	goto tr56;
st28:
	if ( ++p == pe )
		goto _test_eof28;
case 28:
	switch( (*p) ) {
		case 35: goto tr57;
		case 60: goto tr58;
		case 114: goto tr62;
	}
	goto tr56;
tr62:
#line 66 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token end %.*s\n", (int)(p-token.begin), token.begin);
		token.end = p;
		
		text.end = token.begin;
		
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
	goto st29;
st29:
	if ( ++p == pe )
		goto _test_eof29;
case 29:
#line 282 "ext/xrb/template.c"
	switch( (*p) ) {
		case 32: goto tr63;
		case 35: goto tr57;
		case 60: goto tr58;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr63;
	goto tr56;
tr68:
	cs = 30;
#line 66 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token end %.*s\n", (int)(p-token.begin), token.begin);
		token.end = p;
		
		text.end = token.begin;
		
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
#line 29 "parsers/xrb/template.rl"
	{cs = 12;}
	goto _again;
tr63:
#line 7 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction begin %s\n", p);
		instruction.begin = p;
	}
	goto st30;
st30:
	if ( ++p == pe )
		goto _test_eof30;
case 30:
#line 318 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr65;
		case 60: goto tr66;
		case 63: goto tr67;
	}
	goto st30;
tr65:
#line 61 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token begin %s\n", p);
		token.begin = p;
	}
	goto st31;
st31:
	if ( ++p == pe )
		goto _test_eof31;
case 31:
#line 336 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr65;
		case 60: goto tr66;
		case 63: goto tr67;
		case 123: goto tr68;
	}
	goto st30;
tr66:
#line 61 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token begin %s\n", p);
		token.begin = p;
	}
	goto st32;
st32:
	if ( ++p == pe )
		goto _test_eof32;
case 32:
#line 355 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr65;
		case 60: goto tr66;
		case 63: goto tr69;
	}
	goto st30;
tr69:
#line 12 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
		
		if (instruction.end > instruction.begin) {
			rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
		}
	}
	goto st33;
st33:
	if ( ++p == pe )
		goto _test_eof33;
case 33:
#line 377 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr65;
		case 60: goto tr66;
		case 62: goto st34;
		case 114: goto tr71;
	}
	goto st30;
tr60:
	cs = 34;
#line 66 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token end %.*s\n", (int)(p-token.begin), token.begin);
		token.end = p;
		
		text.end = token.begin;
		
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
#line 29 "parsers/xrb/template.rl"
	{cs = 12;}
	goto _again;
st34:
	if ( ++p == pe )
		goto _test_eof34;
case 34:
#line 405 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr57;
		case 60: goto tr58;
	}
	goto tr56;
tr71:
#line 66 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token end %.*s\n", (int)(p-token.begin), token.begin);
		token.end = p;
		
		text.end = token.begin;
		
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
	goto st35;
st35:
	if ( ++p == pe )
		goto _test_eof35;
case 35:
#line 428 "ext/xrb/template.c"
	switch( (*p) ) {
		case 32: goto tr63;
		case 35: goto tr65;
		case 60: goto tr66;
		case 63: goto tr67;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr63;
	goto st30;
tr67:
#line 12 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
		
		if (instruction.end > instruction.begin) {
			rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
		}
	}
	goto st36;
st36:
	if ( ++p == pe )
		goto _test_eof36;
case 36:
#line 453 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr65;
		case 60: goto tr66;
		case 62: goto st34;
	}
	goto st30;
tr52:
#line 47 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
	}
	goto st37;
st37:
	if ( ++p == pe )
		goto _test_eof37;
case 37:
#line 471 "ext/xrb/template.c"
	switch( (*p) ) {
		case 9: goto st37;
		case 32: goto st37;
		case 35: goto tr57;
		case 60: goto tr73;
	}
	if ( 11 <= (*p) && (*p) <= 13 )
		goto st37;
	goto tr56;
tr73:
#line 61 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token begin %s\n", p);
		token.begin = p;
	}
	goto st38;
st38:
	if ( ++p == pe )
		goto _test_eof38;
case 38:
#line 492 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr57;
		case 60: goto tr58;
		case 63: goto st39;
	}
	goto tr56;
st39:
	if ( ++p == pe )
		goto _test_eof39;
case 39:
	switch( (*p) ) {
		case 35: goto tr57;
		case 60: goto tr58;
		case 114: goto tr75;
	}
	goto tr56;
tr75:
#line 66 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token end %.*s\n", (int)(p-token.begin), token.begin);
		token.end = p;
		
		text.end = token.begin;
		
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
	goto st40;
st40:
	if ( ++p == pe )
		goto _test_eof40;
case 40:
#line 526 "ext/xrb/template.c"
	switch( (*p) ) {
		case 32: goto tr76;
		case 35: goto tr57;
		case 60: goto tr58;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr76;
	goto tr56;
tr81:
	cs = 41;
#line 66 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token end %.*s\n", (int)(p-token.begin), token.begin);
		token.end = p;
		
		text.end = token.begin;
		
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
#line 29 "parsers/xrb/template.rl"
	{cs = 12;}
	goto _again;
tr76:
#line 7 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction begin %s\n", p);
		instruction.begin = p;
	}
	goto st41;
st41:
	if ( ++p == pe )
		goto _test_eof41;
case 41:
#line 562 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr78;
		case 60: goto tr79;
		case 63: goto tr80;
	}
	goto st41;
tr78:
#line 61 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token begin %s\n", p);
		token.begin = p;
	}
	goto st42;
st42:
	if ( ++p == pe )
		goto _test_eof42;
case 42:
#line 580 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr78;
		case 60: goto tr79;
		case 63: goto tr80;
		case 123: goto tr81;
	}
	goto st41;
tr79:
#line 61 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token begin %s\n", p);
		token.begin = p;
	}
	goto st43;
st43:
	if ( ++p == pe )
		goto _test_eof43;
case 43:
#line 599 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr78;
		case 60: goto tr79;
		case 63: goto tr82;
	}
	goto st41;
tr82:
#line 12 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
		
		if (instruction.end > instruction.begin) {
			rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
		}
	}
	goto st44;
st44:
	if ( ++p == pe )
		goto _test_eof44;
case 44:
#line 621 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr78;
		case 60: goto tr79;
		case 62: goto st45;
		case 114: goto tr84;
	}
	goto st41;
st45:
	if ( ++p == pe )
		goto _test_eof45;
case 45:
	switch( (*p) ) {
		case 10: goto tr85;
		case 32: goto st45;
		case 35: goto tr57;
		case 60: goto tr58;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto st45;
	goto tr56;
tr84:
#line 66 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token end %.*s\n", (int)(p-token.begin), token.begin);
		token.end = p;
		
		text.end = token.begin;
		
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
	goto st46;
st46:
	if ( ++p == pe )
		goto _test_eof46;
case 46:
#line 659 "ext/xrb/template.c"
	switch( (*p) ) {
		case 32: goto tr76;
		case 35: goto tr78;
		case 60: goto tr79;
		case 63: goto tr80;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr76;
	goto st41;
tr80:
#line 12 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
		
		if (instruction.end > instruction.begin) {
			rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
		}
	}
	goto st47;
st47:
	if ( ++p == pe )
		goto _test_eof47;
case 47:
#line 684 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr78;
		case 60: goto tr79;
		case 62: goto st45;
	}
	goto st41;
tr53:
#line 47 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
	}
	goto st48;
st48:
	if ( ++p == pe )
		goto _test_eof48;
case 48:
#line 702 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr57;
		case 60: goto tr58;
		case 123: goto tr86;
	}
	goto tr56;
tr54:
#line 47 "ext/xrb/template.rl"
	{
		fprintf(stderr, "text begin %s\n", p);
		text.begin = p;
	}
	goto st49;
st49:
	if ( ++p == pe )
		goto _test_eof49;
case 49:
#line 720 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr57;
		case 60: goto tr58;
		case 63: goto st50;
	}
	goto tr56;
st50:
	if ( ++p == pe )
		goto _test_eof50;
case 50:
	switch( (*p) ) {
		case 35: goto tr57;
		case 60: goto tr58;
		case 114: goto st51;
	}
	goto tr56;
st51:
	if ( ++p == pe )
		goto _test_eof51;
case 51:
	switch( (*p) ) {
		case 32: goto tr89;
		case 35: goto tr57;
		case 60: goto tr58;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr89;
	goto tr56;
tr94:
	cs = 52;
#line 66 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token end %.*s\n", (int)(p-token.begin), token.begin);
		token.end = p;
		
		text.end = token.begin;
		
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
#line 29 "parsers/xrb/template.rl"
	{cs = 12;}
	goto _again;
tr89:
#line 7 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction begin %s\n", p);
		instruction.begin = p;
	}
	goto st52;
st52:
	if ( ++p == pe )
		goto _test_eof52;
case 52:
#line 776 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr91;
		case 60: goto tr92;
		case 63: goto tr93;
	}
	goto st52;
tr91:
#line 61 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token begin %s\n", p);
		token.begin = p;
	}
	goto st53;
st53:
	if ( ++p == pe )
		goto _test_eof53;
case 53:
#line 794 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr91;
		case 60: goto tr92;
		case 63: goto tr93;
		case 123: goto tr94;
	}
	goto st52;
tr92:
#line 61 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token begin %s\n", p);
		token.begin = p;
	}
	goto st54;
st54:
	if ( ++p == pe )
		goto _test_eof54;
case 54:
#line 813 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr91;
		case 60: goto tr92;
		case 63: goto tr95;
	}
	goto st52;
tr95:
#line 12 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
		
		if (instruction.end > instruction.begin) {
			rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
		}
	}
	goto st55;
st55:
	if ( ++p == pe )
		goto _test_eof55;
case 55:
#line 835 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr91;
		case 60: goto tr92;
		case 62: goto st45;
		case 114: goto tr96;
	}
	goto st52;
tr96:
#line 66 "ext/xrb/template.rl"
	{
		fprintf(stderr, "token end %.*s\n", (int)(p-token.begin), token.begin);
		token.end = p;
		
		text.end = token.begin;
		
		if (text.end > text.begin) {
			rb_funcall(delegate, id_text, 1, XRB_Token_string(text, encoding));
		}
	}
	goto st56;
st56:
	if ( ++p == pe )
		goto _test_eof56;
case 56:
#line 860 "ext/xrb/template.c"
	switch( (*p) ) {
		case 32: goto tr89;
		case 35: goto tr91;
		case 60: goto tr92;
		case 63: goto tr93;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr89;
	goto st52;
tr93:
#line 12 "ext/xrb/template.rl"
	{
		fprintf(stderr, "instruction end %.*s\n", (int)(p-instruction.begin), instruction.begin);
		instruction.end = p;
		
		if (instruction.end > instruction.begin) {
			rb_funcall(delegate, id_instruction, 1, XRB_Token_string(instruction, encoding));
		}
	}
	goto st57;
st57:
	if ( ++p == pe )
		goto _test_eof57;
case 57:
#line 885 "ext/xrb/template.c"
	switch( (*p) ) {
		case 35: goto tr91;
		case 60: goto tr92;
		case 62: goto st45;
	}
	goto st52;
tr3:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 1;goto st1;}}
	goto st1;
st1:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof1;
case 1:
#line 902 "ext/xrb/template.c"
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
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof2;
case 2:
#line 920 "ext/xrb/template.c"
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
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof3;
case 3:
#line 942 "ext/xrb/template.c"
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
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof5;
case 5:
#line 971 "ext/xrb/template.c"
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
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof6;
case 6:
#line 994 "ext/xrb/template.c"
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
	goto st58;
st58:
	if ( ++p == pe )
		goto _test_eof58;
case 58:
#line 1019 "ext/xrb/template.c"
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
	goto st59;
st59:
	if ( ++p == pe )
		goto _test_eof59;
case 59:
#line 1045 "ext/xrb/template.c"
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
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof11;
case 11:
#line 1078 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st5;
		case 123: goto tr21;
		case 125: goto tr22;
	}
	goto st11;
tr22:
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st60;
st60:
	if ( ++p == pe )
		goto _test_eof60;
case 60:
#line 1093 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st11;
	goto st10;
tr4:
#line 21 "parsers/xrb/template.rl"
	{{cs = stack[--top];goto _again;}}
	goto st61;
st61:
	if ( ++p == pe )
		goto _test_eof61;
case 61:
#line 1105 "ext/xrb/template.c"
	goto st0;
st0:
cs = 0;
	goto _out;
st12:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof12;
case 12:
#line 1116 "ext/xrb/template.c"
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
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof13;
case 13:
#line 1150 "ext/xrb/template.c"
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
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof14;
case 14:
#line 1175 "ext/xrb/template.c"
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
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof15;
case 15:
#line 1197 "ext/xrb/template.c"
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
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof17;
case 17:
#line 1226 "ext/xrb/template.c"
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
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof18;
case 18:
#line 1249 "ext/xrb/template.c"
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
	cs = 62;
#line 34 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
		
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 22 "parsers/xrb/template.rl"
	{cs = 24;}
	goto _again;
st62:
	if ( ++p == pe )
		goto _test_eof62;
case 62:
#line 1284 "ext/xrb/template.c"
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
	cs = 63;
#line 34 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
		
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 22 "parsers/xrb/template.rl"
	{cs = 24;}
	goto _again;
st63:
	if ( ++p == pe )
		goto _test_eof63;
case 63:
#line 1320 "ext/xrb/template.c"
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
#line 1347 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st23;
	goto st22;
tr49:
#line 18 "parsers/xrb/template.rl"
	{{stack[top++] = 23;goto st1;}}
	goto st23;
st23:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof23;
case 23:
#line 1361 "ext/xrb/template.c"
	switch( (*p) ) {
		case 34: goto st17;
		case 123: goto tr49;
		case 125: goto tr50;
	}
	goto st23;
tr50:
	cs = 64;
#line 34 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
		
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 22 "parsers/xrb/template.rl"
	{cs = 24;}
	goto _again;
st64:
	if ( ++p == pe )
		goto _test_eof64;
case 64:
#line 1386 "ext/xrb/template.c"
	if ( (*p) == 39 )
		goto st23;
	goto st22;
tr27:
	cs = 65;
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
	{cs = 24;}
	goto _again;
tr32:
	cs = 65;
#line 34 "ext/xrb/template.rl"
	{
		fprintf(stderr, "expression end %.*s\n", (int)(p-expression.begin), expression.begin);
		expression.end = p;
		
		if (expression.end > expression.begin) {
			rb_funcall(delegate, id_expression, 1, XRB_Token_string(expression, encoding));
		}
	}
#line 22 "parsers/xrb/template.rl"
	{cs = 24;}
	goto _again;
st65:
	if ( ++p == pe )
		goto _test_eof65;
case 65:
#line 1427 "ext/xrb/template.c"
	goto st0;
	}
	_test_eof24: cs = 24; goto _test_eof; 
	_test_eof25: cs = 25; goto _test_eof; 
	_test_eof26: cs = 26; goto _test_eof; 
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
	_test_eof37: cs = 37; goto _test_eof; 
	_test_eof38: cs = 38; goto _test_eof; 
	_test_eof39: cs = 39; goto _test_eof; 
	_test_eof40: cs = 40; goto _test_eof; 
	_test_eof41: cs = 41; goto _test_eof; 
	_test_eof42: cs = 42; goto _test_eof; 
	_test_eof43: cs = 43; goto _test_eof; 
	_test_eof44: cs = 44; goto _test_eof; 
	_test_eof45: cs = 45; goto _test_eof; 
	_test_eof46: cs = 46; goto _test_eof; 
	_test_eof47: cs = 47; goto _test_eof; 
	_test_eof48: cs = 48; goto _test_eof; 
	_test_eof49: cs = 49; goto _test_eof; 
	_test_eof50: cs = 50; goto _test_eof; 
	_test_eof51: cs = 51; goto _test_eof; 
	_test_eof52: cs = 52; goto _test_eof; 
	_test_eof53: cs = 53; goto _test_eof; 
	_test_eof54: cs = 54; goto _test_eof; 
	_test_eof55: cs = 55; goto _test_eof; 
	_test_eof56: cs = 56; goto _test_eof; 
	_test_eof57: cs = 57; goto _test_eof; 
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof58: cs = 58; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof59: cs = 59; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 
	_test_eof60: cs = 60; goto _test_eof; 
	_test_eof61: cs = 61; goto _test_eof; 
	_test_eof12: cs = 12; goto _test_eof; 
	_test_eof13: cs = 13; goto _test_eof; 
	_test_eof14: cs = 14; goto _test_eof; 
	_test_eof15: cs = 15; goto _test_eof; 
	_test_eof16: cs = 16; goto _test_eof; 
	_test_eof17: cs = 17; goto _test_eof; 
	_test_eof18: cs = 18; goto _test_eof; 
	_test_eof19: cs = 19; goto _test_eof; 
	_test_eof62: cs = 62; goto _test_eof; 
	_test_eof20: cs = 20; goto _test_eof; 
	_test_eof63: cs = 63; goto _test_eof; 
	_test_eof21: cs = 21; goto _test_eof; 
	_test_eof22: cs = 22; goto _test_eof; 
	_test_eof23: cs = 23; goto _test_eof; 
	_test_eof64: cs = 64; goto _test_eof; 
	_test_eof65: cs = 65; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 25: goto tr55;
	case 26: goto tr59;
	case 27: goto tr59;
	case 28: goto tr59;
	case 29: goto tr59;
	case 30: goto tr59;
	case 31: goto tr59;
	case 32: goto tr59;
	case 33: goto tr59;
	case 34: goto tr59;
	case 35: goto tr59;
	case 36: goto tr59;
	case 37: goto tr59;
	case 38: goto tr59;
	case 39: goto tr59;
	case 40: goto tr59;
	case 41: goto tr59;
	case 42: goto tr59;
	case 43: goto tr59;
	case 44: goto tr59;
	case 45: goto tr59;
	case 46: goto tr59;
	case 47: goto tr59;
	case 48: goto tr59;
	case 49: goto tr59;
	case 50: goto tr59;
	case 51: goto tr59;
	case 52: goto tr59;
	case 53: goto tr59;
	case 54: goto tr59;
	case 55: goto tr59;
	case 56: goto tr59;
	case 57: goto tr59;
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
#line 1550 "ext/xrb/template.c"
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
