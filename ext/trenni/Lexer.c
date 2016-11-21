
#line 1 "Lexer.rl"
#include <Lexer.h>

typedef struct {
	const char * begin;
	const char * end;
} Token;

static VALUE Trenni_string(const char * begin, const char * end) {
	return rb_str_new(begin, end - begin);
}

static VALUE Trenni_token(Token token) {
	return rb_str_new(token.begin, token.end - token.begin);
}


#line 20 "Lexer.c"
static const int Trenni_Lexer_start = 58;
static const int Trenni_Lexer_first_final = 58;
static const int Trenni_Lexer_error = 0;

static const int Trenni_Lexer_en_main = 58;


#line 127 "Lexer.rl"


static void Trenni_Parser_parse_error(const char * message, VALUE buffer, size_t offset) {
	VALUE exception = rb_funcall(rb_Trenni_ParseError, rb_intern("new"), 3, rb_str_new_cstr(message), buffer, UINT2NUM(offset));
	
	rb_exc_raise(exception);
}

void Trenni_Parser_parse_buffer(VALUE buffer, VALUE delegate) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	const char * s = RSTRING_PTR(string);
	const char * p = s;
	const char * pe = p + RSTRING_LEN(string);
	const char * eof = pe;
	const char * ts = 0;
	const char * te = 0;
	
	unsigned long cs, act;
	
	Token identifier, value, entity, instruction_text;
	unsigned self_closing = 0, has_value = 0;
	
	
#line 53 "Lexer.c"
	{
	cs = Trenni_Lexer_start;
	ts = 0;
	te = 0;
	act = 0;
	}

#line 61 "Lexer.c"
	{
	if ( p == pe )
		goto _test_eof;
	switch ( cs )
	{
tr6:
#line 33 "Lexer.rl"
	{ entity.end = p; }
#line 103 "Lexer.rl"
	{te = p+1;{
		
	}}
	goto st58;
tr9:
#line 32 "Lexer.rl"
	{ entity.end = p; }
#line 103 "Lexer.rl"
	{te = p+1;{
		
	}}
	goto st58;
tr10:
#line 31 "Lexer.rl"
	{ entity.end = p; }
#line 103 "Lexer.rl"
	{te = p+1;{
		
	}}
	goto st58;
tr20:
#line 21 "Lexer.rl"
	{ identifier.end = p; }
#line 61 "Lexer.rl"
	{
		// Reset self-closing state - we don't know yet.
		self_closing = 0;
		
		rb_funcall(delegate, id_open_tag_begin, 1, Trenni_token(identifier));
	}
#line 68 "Lexer.rl"
	{te = p+1;{
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}}
	goto st58;
tr24:
#line 68 "Lexer.rl"
	{te = p+1;{
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}}
	goto st58;
tr29:
#line 21 "Lexer.rl"
	{ identifier.end = p; }
#line 80 "Lexer.rl"
	{
		if (has_value)
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Trenni_token(value));
		else
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
	}
#line 68 "Lexer.rl"
	{te = p+1;{
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}}
	goto st58;
tr40:
#line 87 "Lexer.rl"
	{
		has_value = 1;
	}
#line 80 "Lexer.rl"
	{
		if (has_value)
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Trenni_token(value));
		else
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
	}
#line 68 "Lexer.rl"
	{te = p+1;{
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}}
	goto st58;
tr75:
#line 43 "Lexer.rl"
	{te = p+1;{
		rb_funcall(delegate, id_comment, 1, Trenni_string(ts, te));
	}}
	goto st58;
tr82:
#line 35 "Lexer.rl"
	{te = p+1;{
		rb_funcall(delegate, id_doctype, 1, Trenni_string(ts, te));
	}}
	goto st58;
tr91:
#line 111 "Lexer.rl"
	{te = p+1;{
		rb_funcall(delegate, id_cdata, 1, Trenni_string(ts, te));
	}}
	goto st58;
tr94:
#line 21 "Lexer.rl"
	{ identifier.end = p; }
#line 91 "Lexer.rl"
	{te = p+1;{
		rb_funcall(delegate, id_close_tag, 1, Trenni_token(identifier));
	}}
	goto st58;
tr104:
#line 51 "Lexer.rl"
	{te = p+1;{
		instruction_text.end = te-2;
		
		rb_funcall(delegate, id_instruction, 2, Trenni_token(identifier), Trenni_token(instruction_text));
	}}
	goto st58;
tr108:
#line 119 "Lexer.rl"
	{te = p;p--;{ 
		// Entities are handled separately:
		rb_funcall(delegate, id_text, 1, Trenni_string(ts, te));
	}}
	goto st58;
st58:
#line 1 "NONE"
	{ts = 0;}
	if ( ++p == pe )
		goto _test_eof58;
case 58:
#line 1 "NONE"
	{ts = p;}
#line 193 "Lexer.c"
	switch( (*p) ) {
		case 38: goto st1;
		case 60: goto st7;
	}
	goto st59;
st59:
	if ( ++p == pe )
		goto _test_eof59;
case 59:
	switch( (*p) ) {
		case 38: goto tr108;
		case 60: goto tr108;
	}
	goto st59;
st1:
	if ( ++p == pe )
		goto _test_eof1;
case 1:
	if ( (*p) == 35 )
		goto st2;
	if ( (*p) > 90 ) {
		if ( 97 <= (*p) && (*p) <= 122 )
			goto tr2;
	} else if ( (*p) >= 65 )
		goto tr2;
	goto tr0;
tr0:
#line 107 "Lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse entity", buffer, p-s);
	}
	goto st0;
tr13:
#line 95 "Lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse tag", buffer, p-s);
	}
	goto st0;
tr41:
#line 107 "Lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse entity", buffer, p-s);
	}
#line 95 "Lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse tag", buffer, p-s);
	}
	goto st0;
tr96:
#line 57 "Lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse instruction", buffer, p-s);
	}
	goto st0;
#line 248 "Lexer.c"
st0:
cs = 0;
	goto _out;
st2:
	if ( ++p == pe )
		goto _test_eof2;
case 2:
	if ( (*p) == 120 )
		goto st4;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr3;
	goto tr0;
tr3:
#line 30 "Lexer.rl"
	{ entity.begin = p; }
	goto st3;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
#line 269 "Lexer.c"
	if ( (*p) == 59 )
		goto tr6;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st3;
	goto tr0;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr7;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto tr7;
	} else
		goto tr7;
	goto tr0;
tr7:
#line 30 "Lexer.rl"
	{ entity.begin = p; }
	goto st5;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
#line 296 "Lexer.c"
	if ( (*p) == 59 )
		goto tr9;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st5;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st5;
	} else
		goto st5;
	goto tr0;
tr2:
#line 30 "Lexer.rl"
	{ entity.begin = p; }
	goto st6;
st6:
	if ( ++p == pe )
		goto _test_eof6;
case 6:
#line 316 "Lexer.c"
	if ( (*p) == 59 )
		goto tr10;
	if ( (*p) > 90 ) {
		if ( 97 <= (*p) && (*p) <= 122 )
			goto st6;
	} else if ( (*p) >= 65 )
		goto st6;
	goto tr0;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
	switch( (*p) ) {
		case 33: goto st30;
		case 47: goto st51;
		case 63: goto st53;
		case 96: goto tr13;
	}
	if ( (*p) < 59 ) {
		if ( 0 <= (*p) && (*p) <= 44 )
			goto tr13;
	} else if ( (*p) > 64 ) {
		if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr13;
		} else if ( (*p) >= 91 )
			goto tr13;
	} else
		goto tr13;
	goto tr12;
tr12:
#line 20 "Lexer.rl"
	{ identifier.begin = p; }
	goto st8;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
#line 355 "Lexer.c"
	switch( (*p) ) {
		case 32: goto tr18;
		case 47: goto tr19;
		case 62: goto tr20;
		case 96: goto tr13;
	}
	if ( (*p) < 14 ) {
		if ( (*p) > 8 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto tr18;
		} else if ( (*p) >= 0 )
			goto tr13;
	} else if ( (*p) > 44 ) {
		if ( (*p) < 91 ) {
			if ( 59 <= (*p) && (*p) <= 64 )
				goto tr13;
		} else if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr13;
		} else
			goto tr13;
	} else
		goto tr13;
	goto st8;
tr18:
#line 21 "Lexer.rl"
	{ identifier.end = p; }
#line 61 "Lexer.rl"
	{
		// Reset self-closing state - we don't know yet.
		self_closing = 0;
		
		rb_funcall(delegate, id_open_tag_begin, 1, Trenni_token(identifier));
	}
	goto st9;
tr26:
#line 21 "Lexer.rl"
	{ identifier.end = p; }
#line 80 "Lexer.rl"
	{
		if (has_value)
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Trenni_token(value));
		else
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
	}
	goto st9;
tr38:
#line 87 "Lexer.rl"
	{
		has_value = 1;
	}
#line 80 "Lexer.rl"
	{
		if (has_value)
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Trenni_token(value));
		else
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
	}
	goto st9;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
#line 419 "Lexer.c"
	switch( (*p) ) {
		case 32: goto st9;
		case 47: goto tr23;
		case 62: goto tr24;
		case 96: goto tr13;
	}
	if ( (*p) < 14 ) {
		if ( (*p) > 8 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto st9;
		} else if ( (*p) >= 0 )
			goto tr13;
	} else if ( (*p) > 44 ) {
		if ( (*p) < 91 ) {
			if ( 59 <= (*p) && (*p) <= 64 )
				goto tr13;
		} else if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr13;
		} else
			goto tr13;
	} else
		goto tr13;
	goto tr21;
tr21:
#line 76 "Lexer.rl"
	{
		has_value = 0;
	}
#line 20 "Lexer.rl"
	{ identifier.begin = p; }
	goto st10;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
#line 456 "Lexer.c"
	switch( (*p) ) {
		case 32: goto tr26;
		case 47: goto tr27;
		case 61: goto tr28;
		case 62: goto tr29;
		case 96: goto tr13;
	}
	if ( (*p) < 14 ) {
		if ( (*p) > 8 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto tr26;
		} else if ( (*p) >= 0 )
			goto tr13;
	} else if ( (*p) > 44 ) {
		if ( (*p) < 91 ) {
			if ( 59 <= (*p) && (*p) <= 64 )
				goto tr13;
		} else if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr13;
		} else
			goto tr13;
	} else
		goto tr13;
	goto st10;
tr19:
#line 21 "Lexer.rl"
	{ identifier.end = p; }
#line 61 "Lexer.rl"
	{
		// Reset self-closing state - we don't know yet.
		self_closing = 0;
		
		rb_funcall(delegate, id_open_tag_begin, 1, Trenni_token(identifier));
	}
#line 72 "Lexer.rl"
	{
		self_closing = 1;
	}
	goto st11;
tr23:
#line 72 "Lexer.rl"
	{
		self_closing = 1;
	}
	goto st11;
tr27:
#line 21 "Lexer.rl"
	{ identifier.end = p; }
#line 80 "Lexer.rl"
	{
		if (has_value)
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Trenni_token(value));
		else
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
	}
#line 72 "Lexer.rl"
	{
		self_closing = 1;
	}
	goto st11;
tr39:
#line 87 "Lexer.rl"
	{
		has_value = 1;
	}
#line 80 "Lexer.rl"
	{
		if (has_value)
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Trenni_token(value));
		else
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
	}
#line 72 "Lexer.rl"
	{
		self_closing = 1;
	}
	goto st11;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
#line 539 "Lexer.c"
	if ( (*p) == 62 )
		goto tr24;
	goto tr13;
tr28:
#line 21 "Lexer.rl"
	{ identifier.end = p; }
	goto st12;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
#line 551 "Lexer.c"
	switch( (*p) ) {
		case 34: goto st13;
		case 39: goto st22;
	}
	goto tr13;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
	switch( (*p) ) {
		case 34: goto tr33;
		case 38: goto tr34;
		case 60: goto tr13;
	}
	goto tr32;
tr32:
#line 24 "Lexer.rl"
	{ value.begin = p; }
	goto st14;
tr47:
#line 33 "Lexer.rl"
	{ entity.end = p; }
	goto st14;
tr50:
#line 32 "Lexer.rl"
	{ entity.end = p; }
	goto st14;
tr51:
#line 31 "Lexer.rl"
	{ entity.end = p; }
	goto st14;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
#line 587 "Lexer.c"
	switch( (*p) ) {
		case 34: goto tr36;
		case 38: goto st16;
		case 60: goto tr13;
	}
	goto st14;
tr33:
#line 24 "Lexer.rl"
	{ value.begin = p; }
#line 25 "Lexer.rl"
	{ value.end = p; }
	goto st15;
tr36:
#line 25 "Lexer.rl"
	{ value.end = p; }
	goto st15;
st15:
	if ( ++p == pe )
		goto _test_eof15;
case 15:
#line 608 "Lexer.c"
	switch( (*p) ) {
		case 32: goto tr38;
		case 47: goto tr39;
		case 62: goto tr40;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr38;
	goto tr13;
tr34:
#line 24 "Lexer.rl"
	{ value.begin = p; }
	goto st16;
st16:
	if ( ++p == pe )
		goto _test_eof16;
case 16:
#line 625 "Lexer.c"
	if ( (*p) == 35 )
		goto st17;
	if ( (*p) > 90 ) {
		if ( 97 <= (*p) && (*p) <= 122 )
			goto tr43;
	} else if ( (*p) >= 65 )
		goto tr43;
	goto tr41;
st17:
	if ( ++p == pe )
		goto _test_eof17;
case 17:
	if ( (*p) == 120 )
		goto st19;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr44;
	goto tr41;
tr44:
#line 30 "Lexer.rl"
	{ entity.begin = p; }
	goto st18;
st18:
	if ( ++p == pe )
		goto _test_eof18;
case 18:
#line 651 "Lexer.c"
	if ( (*p) == 59 )
		goto tr47;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st18;
	goto tr41;
st19:
	if ( ++p == pe )
		goto _test_eof19;
case 19:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr48;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto tr48;
	} else
		goto tr48;
	goto tr41;
tr48:
#line 30 "Lexer.rl"
	{ entity.begin = p; }
	goto st20;
st20:
	if ( ++p == pe )
		goto _test_eof20;
case 20:
#line 678 "Lexer.c"
	if ( (*p) == 59 )
		goto tr50;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st20;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st20;
	} else
		goto st20;
	goto tr41;
tr43:
#line 30 "Lexer.rl"
	{ entity.begin = p; }
	goto st21;
st21:
	if ( ++p == pe )
		goto _test_eof21;
case 21:
#line 698 "Lexer.c"
	if ( (*p) == 59 )
		goto tr51;
	if ( (*p) > 90 ) {
		if ( 97 <= (*p) && (*p) <= 122 )
			goto st21;
	} else if ( (*p) >= 65 )
		goto st21;
	goto tr41;
st22:
	if ( ++p == pe )
		goto _test_eof22;
case 22:
	switch( (*p) ) {
		case 38: goto tr54;
		case 39: goto tr33;
		case 60: goto tr13;
	}
	goto tr53;
tr53:
#line 24 "Lexer.rl"
	{ value.begin = p; }
	goto st23;
tr62:
#line 33 "Lexer.rl"
	{ entity.end = p; }
	goto st23;
tr65:
#line 32 "Lexer.rl"
	{ entity.end = p; }
	goto st23;
tr66:
#line 31 "Lexer.rl"
	{ entity.end = p; }
	goto st23;
st23:
	if ( ++p == pe )
		goto _test_eof23;
case 23:
#line 737 "Lexer.c"
	switch( (*p) ) {
		case 38: goto st24;
		case 39: goto tr36;
		case 60: goto tr13;
	}
	goto st23;
tr54:
#line 24 "Lexer.rl"
	{ value.begin = p; }
	goto st24;
st24:
	if ( ++p == pe )
		goto _test_eof24;
case 24:
#line 752 "Lexer.c"
	if ( (*p) == 35 )
		goto st25;
	if ( (*p) > 90 ) {
		if ( 97 <= (*p) && (*p) <= 122 )
			goto tr58;
	} else if ( (*p) >= 65 )
		goto tr58;
	goto tr41;
st25:
	if ( ++p == pe )
		goto _test_eof25;
case 25:
	if ( (*p) == 120 )
		goto st27;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr59;
	goto tr41;
tr59:
#line 30 "Lexer.rl"
	{ entity.begin = p; }
	goto st26;
st26:
	if ( ++p == pe )
		goto _test_eof26;
case 26:
#line 778 "Lexer.c"
	if ( (*p) == 59 )
		goto tr62;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st26;
	goto tr41;
st27:
	if ( ++p == pe )
		goto _test_eof27;
case 27:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr63;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto tr63;
	} else
		goto tr63;
	goto tr41;
tr63:
#line 30 "Lexer.rl"
	{ entity.begin = p; }
	goto st28;
st28:
	if ( ++p == pe )
		goto _test_eof28;
case 28:
#line 805 "Lexer.c"
	if ( (*p) == 59 )
		goto tr65;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st28;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st28;
	} else
		goto st28;
	goto tr41;
tr58:
#line 30 "Lexer.rl"
	{ entity.begin = p; }
	goto st29;
st29:
	if ( ++p == pe )
		goto _test_eof29;
case 29:
#line 825 "Lexer.c"
	if ( (*p) == 59 )
		goto tr66;
	if ( (*p) > 90 ) {
		if ( 97 <= (*p) && (*p) <= 122 )
			goto st29;
	} else if ( (*p) >= 65 )
		goto st29;
	goto tr41;
st30:
	if ( ++p == pe )
		goto _test_eof30;
case 30:
	switch( (*p) ) {
		case 45: goto st31;
		case 68: goto st35;
		case 91: goto st42;
	}
	goto st0;
st31:
	if ( ++p == pe )
		goto _test_eof31;
case 31:
	if ( (*p) == 45 )
		goto st32;
	goto st0;
st32:
	if ( ++p == pe )
		goto _test_eof32;
case 32:
	if ( (*p) == 45 )
		goto st33;
	goto st32;
st33:
	if ( ++p == pe )
		goto _test_eof33;
case 33:
	if ( (*p) == 45 )
		goto st34;
	goto st32;
st34:
	if ( ++p == pe )
		goto _test_eof34;
case 34:
	switch( (*p) ) {
		case 45: goto st34;
		case 62: goto tr75;
	}
	goto st32;
st35:
	if ( ++p == pe )
		goto _test_eof35;
case 35:
	if ( (*p) == 79 )
		goto st36;
	goto st0;
st36:
	if ( ++p == pe )
		goto _test_eof36;
case 36:
	if ( (*p) == 67 )
		goto st37;
	goto st0;
st37:
	if ( ++p == pe )
		goto _test_eof37;
case 37:
	if ( (*p) == 84 )
		goto st38;
	goto st0;
st38:
	if ( ++p == pe )
		goto _test_eof38;
case 38:
	if ( (*p) == 89 )
		goto st39;
	goto st0;
st39:
	if ( ++p == pe )
		goto _test_eof39;
case 39:
	if ( (*p) == 80 )
		goto st40;
	goto st0;
st40:
	if ( ++p == pe )
		goto _test_eof40;
case 40:
	if ( (*p) == 69 )
		goto st41;
	goto st0;
st41:
	if ( ++p == pe )
		goto _test_eof41;
case 41:
	if ( (*p) == 62 )
		goto tr82;
	goto st41;
st42:
	if ( ++p == pe )
		goto _test_eof42;
case 42:
	if ( (*p) == 67 )
		goto st43;
	goto st0;
st43:
	if ( ++p == pe )
		goto _test_eof43;
case 43:
	if ( (*p) == 68 )
		goto st44;
	goto st0;
st44:
	if ( ++p == pe )
		goto _test_eof44;
case 44:
	if ( (*p) == 65 )
		goto st45;
	goto st0;
st45:
	if ( ++p == pe )
		goto _test_eof45;
case 45:
	if ( (*p) == 84 )
		goto st46;
	goto st0;
st46:
	if ( ++p == pe )
		goto _test_eof46;
case 46:
	if ( (*p) == 65 )
		goto st47;
	goto st0;
st47:
	if ( ++p == pe )
		goto _test_eof47;
case 47:
	if ( (*p) == 91 )
		goto st48;
	goto st0;
st48:
	if ( ++p == pe )
		goto _test_eof48;
case 48:
	if ( (*p) == 93 )
		goto st49;
	goto st48;
st49:
	if ( ++p == pe )
		goto _test_eof49;
case 49:
	if ( (*p) == 93 )
		goto st50;
	goto st48;
st50:
	if ( ++p == pe )
		goto _test_eof50;
case 50:
	switch( (*p) ) {
		case 62: goto tr91;
		case 93: goto st50;
	}
	goto st48;
st51:
	if ( ++p == pe )
		goto _test_eof51;
case 51:
	switch( (*p) ) {
		case 47: goto tr13;
		case 96: goto tr13;
	}
	if ( (*p) < 59 ) {
		if ( 0 <= (*p) && (*p) <= 44 )
			goto tr13;
	} else if ( (*p) > 64 ) {
		if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr13;
		} else if ( (*p) >= 91 )
			goto tr13;
	} else
		goto tr13;
	goto tr92;
tr92:
#line 20 "Lexer.rl"
	{ identifier.begin = p; }
	goto st52;
st52:
	if ( ++p == pe )
		goto _test_eof52;
case 52:
#line 1016 "Lexer.c"
	switch( (*p) ) {
		case 47: goto tr13;
		case 62: goto tr94;
		case 96: goto tr13;
	}
	if ( (*p) < 59 ) {
		if ( 0 <= (*p) && (*p) <= 44 )
			goto tr13;
	} else if ( (*p) > 64 ) {
		if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr13;
		} else if ( (*p) >= 91 )
			goto tr13;
	} else
		goto tr13;
	goto st52;
st53:
	if ( ++p == pe )
		goto _test_eof53;
case 53:
	switch( (*p) ) {
		case 47: goto tr96;
		case 96: goto tr96;
	}
	if ( (*p) < 59 ) {
		if ( 0 <= (*p) && (*p) <= 44 )
			goto tr96;
	} else if ( (*p) > 64 ) {
		if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr96;
		} else if ( (*p) >= 91 )
			goto tr96;
	} else
		goto tr96;
	goto tr95;
tr95:
#line 20 "Lexer.rl"
	{ identifier.begin = p; }
	goto st54;
st54:
	if ( ++p == pe )
		goto _test_eof54;
case 54:
#line 1062 "Lexer.c"
	switch( (*p) ) {
		case 32: goto tr98;
		case 47: goto tr96;
		case 96: goto tr96;
	}
	if ( (*p) < 14 ) {
		if ( (*p) > 8 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto tr98;
		} else if ( (*p) >= 0 )
			goto tr96;
	} else if ( (*p) > 44 ) {
		if ( (*p) < 91 ) {
			if ( 59 <= (*p) && (*p) <= 64 )
				goto tr96;
		} else if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr96;
		} else
			goto tr96;
	} else
		goto tr96;
	goto st54;
tr98:
#line 21 "Lexer.rl"
	{ identifier.end = p; }
	goto st55;
tr100:
#line 28 "Lexer.rl"
	{ instruction_text.begin = p; }
	goto st55;
st55:
	if ( ++p == pe )
		goto _test_eof55;
case 55:
#line 1098 "Lexer.c"
	switch( (*p) ) {
		case 32: goto tr100;
		case 63: goto tr101;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr100;
	goto tr99;
tr99:
#line 28 "Lexer.rl"
	{ instruction_text.begin = p; }
	goto st56;
st56:
	if ( ++p == pe )
		goto _test_eof56;
case 56:
#line 1114 "Lexer.c"
	if ( (*p) == 63 )
		goto st57;
	goto st56;
tr101:
#line 28 "Lexer.rl"
	{ instruction_text.begin = p; }
	goto st57;
st57:
	if ( ++p == pe )
		goto _test_eof57;
case 57:
#line 1126 "Lexer.c"
	switch( (*p) ) {
		case 62: goto tr104;
		case 63: goto st57;
	}
	goto st56;
	}
	_test_eof58: cs = 58; goto _test_eof; 
	_test_eof59: cs = 59; goto _test_eof; 
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 
	_test_eof12: cs = 12; goto _test_eof; 
	_test_eof13: cs = 13; goto _test_eof; 
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

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 59: goto tr108;
	case 41: 
#line 39 "Lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse doctype", buffer, p-s);
	}
	break;
	case 32: 
	case 33: 
	case 34: 
#line 47 "Lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse comment", buffer, p-s);
	}
	break;
	case 53: 
	case 54: 
	case 55: 
	case 56: 
	case 57: 
#line 57 "Lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse instruction", buffer, p-s);
	}
	break;
	case 7: 
	case 8: 
	case 9: 
	case 10: 
	case 11: 
	case 12: 
	case 13: 
	case 14: 
	case 15: 
	case 22: 
	case 23: 
	case 51: 
	case 52: 
#line 95 "Lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse tag", buffer, p-s);
	}
	break;
	case 1: 
	case 2: 
	case 3: 
	case 4: 
	case 5: 
	case 6: 
#line 107 "Lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse entity", buffer, p-s);
	}
	break;
	case 48: 
	case 49: 
	case 50: 
#line 115 "Lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse cdata", buffer, p-s);
	}
	break;
	case 16: 
	case 17: 
	case 18: 
	case 19: 
	case 20: 
	case 21: 
	case 24: 
	case 25: 
	case 26: 
	case 27: 
	case 28: 
	case 29: 
#line 107 "Lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse entity", buffer, p-s);
	}
#line 95 "Lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse tag", buffer, p-s);
	}
	break;
#line 1280 "Lexer.c"
	}
	}

	_out: {}
	}

#line 153 "Lexer.rl"

	
	if (p != eof) {
		Trenni_Parser_parse_error("could not parse all input", buffer, p-s);
	}
}
