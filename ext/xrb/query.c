
#line 1 "query.rl"

#include "query.h"


#line 8 "query.c"
static const int XRB_query_parser_start = 12;
static const int XRB_query_parser_first_final = 12;
static const int XRB_query_parser_error = 0;

static const int XRB_query_parser_en_main = 12;


#line 56 "query.rl"


VALUE XRB_Native_parse_query(VALUE self, VALUE buffer, VALUE delegate) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	rb_encoding *encoding = rb_enc_get(string);
	
	const char *s, *p, *pe, *eof;
	unsigned long cs;
	
	XRB_Token string_token = {0}, integer_token = {0}, value_token = {0};
	unsigned encoded = 0;
	
	s = p = RSTRING_PTR(string);
	eof = pe = p + RSTRING_LEN(string);
	
	
#line 34 "query.c"
	{
	cs = XRB_query_parser_start;
	}

#line 39 "query.c"
	{
	if ( p == pe )
		goto _test_eof;
	switch ( cs )
	{
case 12:
	switch( (*p) ) {
		case 37: goto tr4;
		case 38: goto st0;
		case 43: goto tr5;
		case 61: goto st0;
		case 91: goto st0;
		case 93: goto st0;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr6;
	goto tr3;
tr3:
#line 7 "query.rl"
	{
		string_token.begin = p;
	}
	goto st13;
tr5:
#line 7 "query.rl"
	{
		string_token.begin = p;
	}
#line 49 "query.rl"
	{
		encoded = 1;
	}
	goto st13;
tr8:
#line 49 "query.rl"
	{
		encoded = 1;
	}
	goto st13;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
#line 83 "query.c"
	switch( (*p) ) {
		case 37: goto tr7;
		case 38: goto tr24;
		case 43: goto tr8;
		case 61: goto tr25;
		case 91: goto tr26;
		case 93: goto st0;
	}
	goto st13;
tr4:
#line 7 "query.rl"
	{
		string_token.begin = p;
	}
#line 49 "query.rl"
	{
		encoded = 1;
	}
	goto st1;
tr7:
#line 49 "query.rl"
	{
		encoded = 1;
	}
	goto st1;
st1:
	if ( ++p == pe )
		goto _test_eof1;
case 1:
#line 113 "query.c"
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st2;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st2;
	} else
		goto st2;
	goto st0;
st0:
cs = 0;
	goto _out;
st2:
	if ( ++p == pe )
		goto _test_eof2;
case 2:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st13;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st13;
	} else
		goto st13;
	goto st0;
tr24:
#line 11 "query.rl"
	{
		string_token.end = p;
		
		rb_funcall(delegate, id_string, 2, XRB_Token_string(string_token, encoding), encoded ? Qtrue : Qfalse);
		
		encoded = 0;
	}
#line 45 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	goto st3;
tr29:
#line 33 "query.rl"
	{
		value_token.begin = p;
	}
#line 37 "query.rl"
	{
		value_token.end = p;
		
		rb_funcall(delegate, id_assign, 2, XRB_Token_string(value_token, encoding), encoded ? Qtrue : Qfalse);
		
		encoded = 0;
	}
#line 45 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	goto st3;
tr32:
#line 37 "query.rl"
	{
		value_token.end = p;
		
		rb_funcall(delegate, id_assign, 2, XRB_Token_string(value_token, encoding), encoded ? Qtrue : Qfalse);
		
		encoded = 0;
	}
#line 45 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	goto st3;
tr34:
#line 45 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	goto st3;
tr37:
#line 29 "query.rl"
	{
		rb_funcall(delegate, id_append, 0);
	}
#line 45 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	goto st3;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
#line 205 "query.c"
	switch( (*p) ) {
		case 37: goto tr4;
		case 38: goto st0;
		case 43: goto tr5;
		case 61: goto st0;
		case 91: goto st0;
		case 93: goto st0;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr6;
	goto tr3;
tr6:
#line 7 "query.rl"
	{
		string_token.begin = p;
	}
#line 19 "query.rl"
	{
		integer_token.begin = p;
	}
	goto st4;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
#line 231 "query.c"
	switch( (*p) ) {
		case 37: goto tr7;
		case 38: goto st0;
		case 43: goto tr8;
		case 61: goto st0;
		case 91: goto st0;
		case 93: goto st0;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st4;
	goto st13;
tr25:
#line 11 "query.rl"
	{
		string_token.end = p;
		
		rb_funcall(delegate, id_string, 2, XRB_Token_string(string_token, encoding), encoded ? Qtrue : Qfalse);
		
		encoded = 0;
	}
	goto st14;
tr38:
#line 29 "query.rl"
	{
		rb_funcall(delegate, id_append, 0);
	}
	goto st14;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
#line 263 "query.c"
	switch( (*p) ) {
		case 37: goto tr28;
		case 38: goto tr29;
		case 43: goto tr30;
		case 61: goto st0;
		case 91: goto st0;
		case 93: goto st0;
	}
	goto tr27;
tr33:
#line 49 "query.rl"
	{
		encoded = 1;
	}
	goto st15;
tr27:
#line 33 "query.rl"
	{
		value_token.begin = p;
	}
	goto st15;
tr30:
#line 33 "query.rl"
	{
		value_token.begin = p;
	}
#line 49 "query.rl"
	{
		encoded = 1;
	}
	goto st15;
st15:
	if ( ++p == pe )
		goto _test_eof15;
case 15:
#line 299 "query.c"
	switch( (*p) ) {
		case 37: goto tr31;
		case 38: goto tr32;
		case 43: goto tr33;
		case 61: goto st0;
		case 91: goto st0;
		case 93: goto st0;
	}
	goto st15;
tr31:
#line 49 "query.rl"
	{
		encoded = 1;
	}
	goto st5;
tr28:
#line 33 "query.rl"
	{
		value_token.begin = p;
	}
#line 49 "query.rl"
	{
		encoded = 1;
	}
	goto st5;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
#line 329 "query.c"
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st6;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st6;
	} else
		goto st6;
	goto st0;
st6:
	if ( ++p == pe )
		goto _test_eof6;
case 6:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st15;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st15;
	} else
		goto st15;
	goto st0;
tr26:
#line 11 "query.rl"
	{
		string_token.end = p;
		
		rb_funcall(delegate, id_string, 2, XRB_Token_string(string_token, encoding), encoded ? Qtrue : Qfalse);
		
		encoded = 0;
	}
	goto st7;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
#line 366 "query.c"
	switch( (*p) ) {
		case 37: goto tr13;
		case 38: goto st0;
		case 43: goto tr14;
		case 61: goto st0;
		case 91: goto st0;
		case 93: goto st17;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr15;
	goto tr12;
tr12:
#line 7 "query.rl"
	{
		string_token.begin = p;
	}
	goto st8;
tr14:
#line 7 "query.rl"
	{
		string_token.begin = p;
	}
#line 49 "query.rl"
	{
		encoded = 1;
	}
	goto st8;
tr19:
#line 49 "query.rl"
	{
		encoded = 1;
	}
	goto st8;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
#line 404 "query.c"
	switch( (*p) ) {
		case 37: goto tr18;
		case 38: goto st0;
		case 43: goto tr19;
		case 61: goto st0;
		case 91: goto st0;
		case 93: goto tr20;
	}
	goto st8;
tr13:
#line 7 "query.rl"
	{
		string_token.begin = p;
	}
#line 49 "query.rl"
	{
		encoded = 1;
	}
	goto st9;
tr18:
#line 49 "query.rl"
	{
		encoded = 1;
	}
	goto st9;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
#line 434 "query.c"
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st10;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st10;
	} else
		goto st10;
	goto st0;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st8;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st8;
	} else
		goto st8;
	goto st0;
tr20:
#line 11 "query.rl"
	{
		string_token.end = p;
		
		rb_funcall(delegate, id_string, 2, XRB_Token_string(string_token, encoding), encoded ? Qtrue : Qfalse);
		
		encoded = 0;
	}
	goto st16;
tr23:
#line 23 "query.rl"
	{
		integer_token.end = p;
		
		rb_funcall(delegate, id_integer, 1, XRB_Token_string(integer_token, encoding));
	}
	goto st16;
st16:
	if ( ++p == pe )
		goto _test_eof16;
case 16:
#line 479 "query.c"
	switch( (*p) ) {
		case 38: goto tr34;
		case 61: goto st14;
		case 91: goto st7;
	}
	goto st0;
tr15:
#line 19 "query.rl"
	{
		integer_token.begin = p;
	}
#line 7 "query.rl"
	{
		string_token.begin = p;
	}
	goto st11;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
#line 500 "query.c"
	switch( (*p) ) {
		case 37: goto tr18;
		case 38: goto st0;
		case 43: goto tr19;
		case 61: goto st0;
		case 91: goto st0;
		case 93: goto tr23;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st11;
	goto st8;
st17:
	if ( ++p == pe )
		goto _test_eof17;
case 17:
	switch( (*p) ) {
		case 38: goto tr37;
		case 61: goto tr38;
	}
	goto st0;
	}
	_test_eof13: cs = 13; goto _test_eof; 
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof14: cs = 14; goto _test_eof; 
	_test_eof15: cs = 15; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof16: cs = 16; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 
	_test_eof17: cs = 17; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 16: 
#line 45 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	break;
	case 13: 
#line 11 "query.rl"
	{
		string_token.end = p;
		
		rb_funcall(delegate, id_string, 2, XRB_Token_string(string_token, encoding), encoded ? Qtrue : Qfalse);
		
		encoded = 0;
	}
#line 45 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	break;
	case 17: 
#line 29 "query.rl"
	{
		rb_funcall(delegate, id_append, 0);
	}
#line 45 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	break;
	case 15: 
#line 37 "query.rl"
	{
		value_token.end = p;
		
		rb_funcall(delegate, id_assign, 2, XRB_Token_string(value_token, encoding), encoded ? Qtrue : Qfalse);
		
		encoded = 0;
	}
#line 45 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	break;
	case 14: 
#line 33 "query.rl"
	{
		value_token.begin = p;
	}
#line 37 "query.rl"
	{
		value_token.end = p;
		
		rb_funcall(delegate, id_assign, 2, XRB_Token_string(value_token, encoding), encoded ? Qtrue : Qfalse);
		
		encoded = 0;
	}
#line 45 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	break;
#line 605 "query.c"
	}
	}

	_out: {}
	}

#line 75 "query.rl"

	
	if (p != eof) {
		XRB_raise_error("could not parse all input", buffer, p-s);
	}
	
	return Qnil;
}
