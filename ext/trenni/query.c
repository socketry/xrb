
#line 1 "query.rl"

#include "query.h"


#line 8 "query.c"
static const int Trenni_query_parser_start = 6;
static const int Trenni_query_parser_first_final = 6;
static const int Trenni_query_parser_error = 0;

static const int Trenni_query_parser_en_main = 6;


#line 48 "query.rl"


VALUE Trenni_Native_parse_query(VALUE self, VALUE buffer, VALUE delegate) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	rb_encoding *encoding = rb_enc_get(string);
	
	const char *s, *p, *pe, *eof;
	unsigned long cs;
	
	Trenni_Token string_token = {0}, integer_token = {0}, value_token = {0};
	
	s = p = RSTRING_PTR(string);
	eof = pe = p + RSTRING_LEN(string);
	
	
#line 33 "query.c"
	{
	cs = Trenni_query_parser_start;
	}

#line 38 "query.c"
	{
	if ( p == pe )
		goto _test_eof;
	switch ( cs )
	{
case 6:
	switch( (*p) ) {
		case 38: goto st0;
		case 61: goto st0;
		case 91: goto st0;
		case 93: goto st0;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr2;
	goto tr0;
tr0:
#line 7 "query.rl"
	{
		string_token.begin = p;
	}
	goto st7;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
#line 64 "query.c"
	switch( (*p) ) {
		case 38: goto tr12;
		case 61: goto tr13;
		case 91: goto tr14;
		case 93: goto st0;
	}
	goto st7;
tr12:
#line 11 "query.rl"
	{
		string_token.end = p;
		
		rb_funcall(delegate, id_string, 1, Trenni_Token_string(string_token, encoding));
	}
#line 41 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	goto st1;
tr16:
#line 31 "query.rl"
	{
		value_token.begin = p;
	}
#line 35 "query.rl"
	{
		value_token.end = p;
		
		rb_funcall(delegate, id_assign, 1, Trenni_Token_string(value_token, encoding));
	}
#line 41 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	goto st1;
tr18:
#line 35 "query.rl"
	{
		value_token.end = p;
		
		rb_funcall(delegate, id_assign, 1, Trenni_Token_string(value_token, encoding));
	}
#line 41 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	goto st1;
tr19:
#line 41 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	goto st1;
tr22:
#line 27 "query.rl"
	{
		rb_funcall(delegate, id_append, 0);
	}
#line 41 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	goto st1;
st1:
	if ( ++p == pe )
		goto _test_eof1;
case 1:
#line 132 "query.c"
	switch( (*p) ) {
		case 38: goto st0;
		case 61: goto st0;
		case 91: goto st0;
		case 93: goto st0;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr2;
	goto tr0;
st0:
cs = 0;
	goto _out;
tr2:
#line 7 "query.rl"
	{
		string_token.begin = p;
	}
#line 17 "query.rl"
	{
		integer_token.begin = p;
	}
	goto st2;
st2:
	if ( ++p == pe )
		goto _test_eof2;
case 2:
#line 159 "query.c"
	switch( (*p) ) {
		case 38: goto st0;
		case 61: goto st0;
		case 91: goto st0;
		case 93: goto st0;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st2;
	goto st7;
tr13:
#line 11 "query.rl"
	{
		string_token.end = p;
		
		rb_funcall(delegate, id_string, 1, Trenni_Token_string(string_token, encoding));
	}
	goto st8;
tr23:
#line 27 "query.rl"
	{
		rb_funcall(delegate, id_append, 0);
	}
	goto st8;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
#line 187 "query.c"
	switch( (*p) ) {
		case 38: goto tr16;
		case 61: goto st0;
		case 91: goto st0;
		case 93: goto st0;
	}
	goto tr15;
tr15:
#line 31 "query.rl"
	{
		value_token.begin = p;
	}
	goto st9;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
#line 205 "query.c"
	switch( (*p) ) {
		case 38: goto tr18;
		case 61: goto st0;
		case 91: goto st0;
		case 93: goto st0;
	}
	goto st9;
tr14:
#line 11 "query.rl"
	{
		string_token.end = p;
		
		rb_funcall(delegate, id_string, 1, Trenni_Token_string(string_token, encoding));
	}
	goto st3;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
#line 225 "query.c"
	switch( (*p) ) {
		case 38: goto st0;
		case 61: goto st0;
		case 91: goto st0;
		case 93: goto st11;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr6;
	goto tr5;
tr5:
#line 7 "query.rl"
	{
		string_token.begin = p;
	}
	goto st4;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
#line 245 "query.c"
	switch( (*p) ) {
		case 38: goto st0;
		case 61: goto st0;
		case 91: goto st0;
		case 93: goto tr9;
	}
	goto st4;
tr9:
#line 11 "query.rl"
	{
		string_token.end = p;
		
		rb_funcall(delegate, id_string, 1, Trenni_Token_string(string_token, encoding));
	}
	goto st10;
tr11:
#line 21 "query.rl"
	{
		integer_token.end = p;
		
		rb_funcall(delegate, id_integer, 1, Trenni_Token_string(integer_token, encoding));
	}
	goto st10;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
#line 273 "query.c"
	switch( (*p) ) {
		case 38: goto tr19;
		case 61: goto st8;
		case 91: goto st3;
	}
	goto st0;
tr6:
#line 17 "query.rl"
	{
		integer_token.begin = p;
	}
#line 7 "query.rl"
	{
		string_token.begin = p;
	}
	goto st5;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
#line 294 "query.c"
	switch( (*p) ) {
		case 38: goto st0;
		case 61: goto st0;
		case 91: goto st0;
		case 93: goto tr11;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st5;
	goto st4;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
	switch( (*p) ) {
		case 38: goto tr22;
		case 61: goto tr23;
	}
	goto st0;
	}
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 10: 
#line 41 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	break;
	case 7: 
#line 11 "query.rl"
	{
		string_token.end = p;
		
		rb_funcall(delegate, id_string, 1, Trenni_Token_string(string_token, encoding));
	}
#line 41 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	break;
	case 11: 
#line 27 "query.rl"
	{
		rb_funcall(delegate, id_append, 0);
	}
#line 41 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	break;
	case 9: 
#line 35 "query.rl"
	{
		value_token.end = p;
		
		rb_funcall(delegate, id_assign, 1, Trenni_Token_string(value_token, encoding));
	}
#line 41 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	break;
	case 8: 
#line 31 "query.rl"
	{
		value_token.begin = p;
	}
#line 35 "query.rl"
	{
		value_token.end = p;
		
		rb_funcall(delegate, id_assign, 1, Trenni_Token_string(value_token, encoding));
	}
#line 41 "query.rl"
	{
		rb_funcall(delegate, id_pair, 0);
	}
	break;
#line 385 "query.c"
	}
	}

	_out: {}
	}

#line 66 "query.rl"

	
	if (p != eof) {
		Trenni_raise_error("could not parse all input", buffer, p-s);
	}
	
	return Qnil;
}
