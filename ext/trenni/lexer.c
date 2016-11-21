
#line 1 "lexer.rl"

#include <lexer.h>

#include <ruby/encoding.h>

typedef struct {
	const char * begin;
	const char * end;
} Token;

static VALUE Trenni_token(Token token) {
	return rb_str_new(token.begin, token.end - token.begin);
}

static void Trenni_Parser_append_token(VALUE * buffer, rb_encoding * encoding, Token token) {
	if (*buffer == Qnil) {
		// Allocate a buffer exactly the right size:
		*buffer = rb_enc_str_new(token.begin, token.end - token.begin, encoding);
	} else {
		// Append the characters to the existing buffer:
		rb_str_buf_cat(*buffer, token.begin, token.end - token.begin);
	}
}

static void Trenni_Parser_append_codepoint(VALUE * buffer, rb_encoding * encoding, unsigned long codepoint) {
	printf("Trenni_Parser_append_codepoint %ul %ul\n", buffer, codepoint);
	
	if (*buffer == Qnil) {
		*buffer = rb_enc_str_new("", 0, encoding);
	}
	
	rb_str_concat(*buffer, ULONG2NUM(codepoint));
}

#define entity_codepoint(number) Trenni_Parser_append_codepoint(&pcdata, encoding, number)


#line 41 "lexer.c"
static const int trenni_lexer_start = 56;
static const int trenni_lexer_first_final = 56;
static const int trenni_lexer_error = 0;

static const int trenni_lexer_en_parse_entity = 40;
static const int trenni_lexer_en_main = 56;


#line 214 "lexer.rl"


static void Trenni_Parser_parse_error(const char * message, VALUE buffer, size_t offset) {
	VALUE exception = rb_funcall(rb_Trenni_ParseError, rb_intern("new"), 3, rb_str_new_cstr(message), buffer, UINT2NUM(offset));
	
	rb_exc_raise(exception);
}

void Trenni_Parser_parse_buffer(VALUE buffer, VALUE delegate) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	rb_encoding *encoding = rb_enc_get(string);
	
	VALUE pcdata = Qnil;
	
	VALUE empty_string = rb_enc_str_new("", 0, encoding);
	rb_obj_freeze_inline(empty_string);
	
	const char * s = RSTRING_PTR(string);
	const char * p = s;
	const char * pe = p + RSTRING_LEN(string);
	const char * eof = pe;

	unsigned long cs;
	unsigned long top = 0;
	unsigned long stack[2] = {0};
	
	Token identifier, cdata, characters, entity, doctype, comment, instruction_text;
	unsigned self_closing = 0, has_value = 0;
	
	
#line 82 "lexer.c"
	{
	cs = trenni_lexer_start;
	top = 0;
	}

#line 88 "lexer.c"
	{
	if ( p == pe )
		goto _test_eof;
	goto _resume;

_again:
	switch ( cs ) {
		case 56: goto st56;
		case 57: goto st57;
		case 58: goto st58;
		case 1: goto st1;
		case 2: goto st2;
		case 0: goto st0;
		case 3: goto st3;
		case 4: goto st4;
		case 5: goto st5;
		case 59: goto st59;
		case 6: goto st6;
		case 7: goto st7;
		case 8: goto st8;
		case 9: goto st9;
		case 10: goto st10;
		case 11: goto st11;
		case 12: goto st12;
		case 13: goto st13;
		case 14: goto st14;
		case 15: goto st15;
		case 16: goto st16;
		case 60: goto st60;
		case 17: goto st17;
		case 18: goto st18;
		case 19: goto st19;
		case 20: goto st20;
		case 21: goto st21;
		case 22: goto st22;
		case 23: goto st23;
		case 61: goto st61;
		case 24: goto st24;
		case 25: goto st25;
		case 26: goto st26;
		case 27: goto st27;
		case 28: goto st28;
		case 29: goto st29;
		case 30: goto st30;
		case 31: goto st31;
		case 32: goto st32;
		case 62: goto st62;
		case 33: goto st33;
		case 34: goto st34;
		case 63: goto st63;
		case 35: goto st35;
		case 36: goto st36;
		case 37: goto st37;
		case 38: goto st38;
		case 39: goto st39;
		case 64: goto st64;
		case 40: goto st40;
		case 41: goto st41;
		case 42: goto st42;
		case 65: goto st65;
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
	default: break;
	}

	if ( ++p == pe )
		goto _test_eof;
_resume:
	switch ( cs )
	{
st56:
	if ( ++p == pe )
		goto _test_eof56;
case 56:
	switch( (*p) ) {
		case 38: goto tr96;
		case 60: goto tr97;
	}
	goto tr95;
tr98:
#line 56 "lexer.rl"
	{
		characters.end = p;
		
		Trenni_Parser_append_token(&pcdata, encoding, characters);
	}
#line 52 "lexer.rl"
	{
		characters.begin = p;
	}
	goto st57;
tr101:
#line 52 "lexer.rl"
	{
		characters.begin = p;
	}
	goto st57;
tr95:
#line 202 "lexer.rl"
	{
	
	}
#line 44 "lexer.rl"
	{
		pcdata = Qnil;
	}
#line 52 "lexer.rl"
	{
		characters.begin = p;
	}
	goto st57;
tr104:
#line 173 "lexer.rl"
	{
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}
#line 202 "lexer.rl"
	{
	
	}
#line 44 "lexer.rl"
	{
		pcdata = Qnil;
	}
#line 52 "lexer.rl"
	{
		characters.begin = p;
	}
	goto st57;
tr107:
#line 110 "lexer.rl"
	{
		comment.end = p;
		
		rb_funcall(delegate, id_comment, 1, Trenni_token(comment));
	}
#line 202 "lexer.rl"
	{
	
	}
#line 44 "lexer.rl"
	{
		pcdata = Qnil;
	}
#line 52 "lexer.rl"
	{
		characters.begin = p;
	}
	goto st57;
tr110:
#line 96 "lexer.rl"
	{
		doctype.end = p;
		
		rb_funcall(delegate, id_doctype, 1, Trenni_token(doctype));
	}
#line 202 "lexer.rl"
	{
	
	}
#line 44 "lexer.rl"
	{
		pcdata = Qnil;
	}
#line 52 "lexer.rl"
	{
		characters.begin = p;
	}
	goto st57;
tr113:
#line 192 "lexer.rl"
	{
		cdata.end = p;
		
		rb_funcall(delegate, id_cdata, 1, Trenni_token(cdata));
	}
#line 202 "lexer.rl"
	{
	
	}
#line 44 "lexer.rl"
	{
		pcdata = Qnil;
	}
#line 52 "lexer.rl"
	{
		characters.begin = p;
	}
	goto st57;
tr116:
#line 180 "lexer.rl"
	{
		rb_funcall(delegate, id_close_tag, 1, Trenni_token(identifier));
	}
#line 202 "lexer.rl"
	{
	
	}
#line 44 "lexer.rl"
	{
		pcdata = Qnil;
	}
#line 52 "lexer.rl"
	{
		characters.begin = p;
	}
	goto st57;
tr119:
#line 127 "lexer.rl"
	{
		instruction_text.end = p-2;
		
		rb_funcall(delegate, id_instruction, 2, Trenni_token(identifier), Trenni_token(instruction_text));
	}
#line 202 "lexer.rl"
	{
	
	}
#line 44 "lexer.rl"
	{
		pcdata = Qnil;
	}
#line 52 "lexer.rl"
	{
		characters.begin = p;
	}
	goto st57;
st57:
	if ( ++p == pe )
		goto _test_eof57;
case 57:
#line 331 "lexer.c"
	switch( (*p) ) {
		case 38: goto tr99;
		case 60: goto tr100;
	}
	goto tr98;
tr99:
#line 56 "lexer.rl"
	{
		characters.end = p;
		
		Trenni_Parser_append_token(&pcdata, encoding, characters);
	}
#line 13 "entities.rl"
	{{stack[top++] = 58; goto st40;}}
	goto st58;
tr102:
#line 13 "entities.rl"
	{{stack[top++] = 58; goto st40;}}
	goto st58;
tr96:
#line 202 "lexer.rl"
	{
	
	}
#line 44 "lexer.rl"
	{
		pcdata = Qnil;
	}
#line 13 "entities.rl"
	{{stack[top++] = 58; goto st40;}}
	goto st58;
tr105:
#line 173 "lexer.rl"
	{
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}
#line 202 "lexer.rl"
	{
	
	}
#line 44 "lexer.rl"
	{
		pcdata = Qnil;
	}
#line 13 "entities.rl"
	{{stack[top++] = 58; goto st40;}}
	goto st58;
tr108:
#line 110 "lexer.rl"
	{
		comment.end = p;
		
		rb_funcall(delegate, id_comment, 1, Trenni_token(comment));
	}
#line 202 "lexer.rl"
	{
	
	}
#line 44 "lexer.rl"
	{
		pcdata = Qnil;
	}
#line 13 "entities.rl"
	{{stack[top++] = 58; goto st40;}}
	goto st58;
tr111:
#line 96 "lexer.rl"
	{
		doctype.end = p;
		
		rb_funcall(delegate, id_doctype, 1, Trenni_token(doctype));
	}
#line 202 "lexer.rl"
	{
	
	}
#line 44 "lexer.rl"
	{
		pcdata = Qnil;
	}
#line 13 "entities.rl"
	{{stack[top++] = 58; goto st40;}}
	goto st58;
tr114:
#line 192 "lexer.rl"
	{
		cdata.end = p;
		
		rb_funcall(delegate, id_cdata, 1, Trenni_token(cdata));
	}
#line 202 "lexer.rl"
	{
	
	}
#line 44 "lexer.rl"
	{
		pcdata = Qnil;
	}
#line 13 "entities.rl"
	{{stack[top++] = 58; goto st40;}}
	goto st58;
tr117:
#line 180 "lexer.rl"
	{
		rb_funcall(delegate, id_close_tag, 1, Trenni_token(identifier));
	}
#line 202 "lexer.rl"
	{
	
	}
#line 44 "lexer.rl"
	{
		pcdata = Qnil;
	}
#line 13 "entities.rl"
	{{stack[top++] = 58; goto st40;}}
	goto st58;
tr120:
#line 127 "lexer.rl"
	{
		instruction_text.end = p-2;
		
		rb_funcall(delegate, id_instruction, 2, Trenni_token(identifier), Trenni_token(instruction_text));
	}
#line 202 "lexer.rl"
	{
	
	}
#line 44 "lexer.rl"
	{
		pcdata = Qnil;
	}
#line 13 "entities.rl"
	{{stack[top++] = 58; goto st40;}}
	goto st58;
st58:
	if ( ++p == pe )
		goto _test_eof58;
case 58:
#line 471 "lexer.c"
	switch( (*p) ) {
		case 38: goto tr102;
		case 60: goto tr103;
	}
	goto tr101;
tr97:
#line 144 "lexer.rl"
	{
	}
#line 177 "lexer.rl"
	{
	}
#line 120 "lexer.rl"
	{
	}
#line 106 "lexer.rl"
	{
		comment.begin = p;
	}
#line 92 "lexer.rl"
	{
		doctype.begin = p;
	}
#line 188 "lexer.rl"
	{
		cdata.begin = p;
	}
	goto st1;
tr100:
#line 56 "lexer.rl"
	{
		characters.end = p;
		
		Trenni_Parser_append_token(&pcdata, encoding, characters);
	}
#line 48 "lexer.rl"
	{
		// Buffer is ready.
	}
#line 206 "lexer.rl"
	{
		// Entities are handled separately:
		rb_funcall(delegate, id_text, 1, pcdata);
	}
#line 144 "lexer.rl"
	{
	}
#line 177 "lexer.rl"
	{
	}
#line 120 "lexer.rl"
	{
	}
#line 106 "lexer.rl"
	{
		comment.begin = p;
	}
#line 92 "lexer.rl"
	{
		doctype.begin = p;
	}
#line 188 "lexer.rl"
	{
		cdata.begin = p;
	}
	goto st1;
tr103:
#line 48 "lexer.rl"
	{
		// Buffer is ready.
	}
#line 206 "lexer.rl"
	{
		// Entities are handled separately:
		rb_funcall(delegate, id_text, 1, pcdata);
	}
#line 144 "lexer.rl"
	{
	}
#line 177 "lexer.rl"
	{
	}
#line 120 "lexer.rl"
	{
	}
#line 106 "lexer.rl"
	{
		comment.begin = p;
	}
#line 92 "lexer.rl"
	{
		doctype.begin = p;
	}
#line 188 "lexer.rl"
	{
		cdata.begin = p;
	}
	goto st1;
tr106:
#line 173 "lexer.rl"
	{
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}
#line 144 "lexer.rl"
	{
	}
#line 177 "lexer.rl"
	{
	}
#line 120 "lexer.rl"
	{
	}
#line 106 "lexer.rl"
	{
		comment.begin = p;
	}
#line 92 "lexer.rl"
	{
		doctype.begin = p;
	}
#line 188 "lexer.rl"
	{
		cdata.begin = p;
	}
	goto st1;
tr109:
#line 110 "lexer.rl"
	{
		comment.end = p;
		
		rb_funcall(delegate, id_comment, 1, Trenni_token(comment));
	}
#line 144 "lexer.rl"
	{
	}
#line 177 "lexer.rl"
	{
	}
#line 120 "lexer.rl"
	{
	}
#line 106 "lexer.rl"
	{
		comment.begin = p;
	}
#line 92 "lexer.rl"
	{
		doctype.begin = p;
	}
#line 188 "lexer.rl"
	{
		cdata.begin = p;
	}
	goto st1;
tr112:
#line 96 "lexer.rl"
	{
		doctype.end = p;
		
		rb_funcall(delegate, id_doctype, 1, Trenni_token(doctype));
	}
#line 144 "lexer.rl"
	{
	}
#line 177 "lexer.rl"
	{
	}
#line 120 "lexer.rl"
	{
	}
#line 106 "lexer.rl"
	{
		comment.begin = p;
	}
#line 92 "lexer.rl"
	{
		doctype.begin = p;
	}
#line 188 "lexer.rl"
	{
		cdata.begin = p;
	}
	goto st1;
tr115:
#line 192 "lexer.rl"
	{
		cdata.end = p;
		
		rb_funcall(delegate, id_cdata, 1, Trenni_token(cdata));
	}
#line 144 "lexer.rl"
	{
	}
#line 177 "lexer.rl"
	{
	}
#line 120 "lexer.rl"
	{
	}
#line 106 "lexer.rl"
	{
		comment.begin = p;
	}
#line 92 "lexer.rl"
	{
		doctype.begin = p;
	}
#line 188 "lexer.rl"
	{
		cdata.begin = p;
	}
	goto st1;
tr118:
#line 180 "lexer.rl"
	{
		rb_funcall(delegate, id_close_tag, 1, Trenni_token(identifier));
	}
#line 144 "lexer.rl"
	{
	}
#line 177 "lexer.rl"
	{
	}
#line 120 "lexer.rl"
	{
	}
#line 106 "lexer.rl"
	{
		comment.begin = p;
	}
#line 92 "lexer.rl"
	{
		doctype.begin = p;
	}
#line 188 "lexer.rl"
	{
		cdata.begin = p;
	}
	goto st1;
tr121:
#line 127 "lexer.rl"
	{
		instruction_text.end = p-2;
		
		rb_funcall(delegate, id_instruction, 2, Trenni_token(identifier), Trenni_token(instruction_text));
	}
#line 144 "lexer.rl"
	{
	}
#line 177 "lexer.rl"
	{
	}
#line 120 "lexer.rl"
	{
	}
#line 106 "lexer.rl"
	{
		comment.begin = p;
	}
#line 92 "lexer.rl"
	{
		doctype.begin = p;
	}
#line 188 "lexer.rl"
	{
		cdata.begin = p;
	}
	goto st1;
st1:
	if ( ++p == pe )
		goto _test_eof1;
case 1:
#line 744 "lexer.c"
	switch( (*p) ) {
		case 33: goto st12;
		case 47: goto st33;
		case 63: goto st35;
		case 96: goto tr1;
	}
	if ( (*p) < 59 ) {
		if ( 0 <= (*p) && (*p) <= 44 )
			goto tr1;
	} else if ( (*p) > 64 ) {
		if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr1;
		} else if ( (*p) >= 91 )
			goto tr1;
	} else
		goto tr1;
	goto tr0;
tr0:
#line 41 "lexer.rl"
	{ identifier.begin = p; }
	goto st2;
st2:
	if ( ++p == pe )
		goto _test_eof2;
case 2:
#line 771 "lexer.c"
	switch( (*p) ) {
		case 32: goto tr6;
		case 47: goto tr7;
		case 62: goto tr8;
		case 96: goto tr1;
	}
	if ( (*p) < 14 ) {
		if ( (*p) > 8 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto tr6;
		} else if ( (*p) >= 0 )
			goto tr1;
	} else if ( (*p) > 44 ) {
		if ( (*p) < 91 ) {
			if ( 59 <= (*p) && (*p) <= 64 )
				goto tr1;
		} else if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr1;
		} else
			goto tr1;
	} else
		goto tr1;
	goto st2;
tr1:
#line 184 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse tag", buffer, p-s);
	}
	goto st0;
tr62:
#line 133 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse instruction", buffer, p-s);
	}
	goto st0;
tr71:
#line 62 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse entity", buffer, p-s);
	}
	goto st0;
#line 814 "lexer.c"
st0:
cs = 0;
	goto _out;
tr6:
#line 42 "lexer.rl"
	{ identifier.end = p; }
#line 137 "lexer.rl"
	{
		// Reset self-closing state - we don't know yet.
		self_closing = 0;
		
		rb_funcall(delegate, id_open_tag_begin, 1, Trenni_token(identifier));
	}
	goto st3;
tr14:
#line 42 "lexer.rl"
	{ identifier.end = p; }
#line 163 "lexer.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
		}
	}
	goto st3;
tr25:
#line 155 "lexer.rl"
	{
		has_value = 1;
	}
#line 163 "lexer.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
		}
	}
	goto st3;
tr31:
#line 159 "lexer.rl"
	{
		has_value = 2;
	}
#line 163 "lexer.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
		}
	}
	goto st3;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
#line 879 "lexer.c"
	switch( (*p) ) {
		case 32: goto st3;
		case 47: goto tr11;
		case 62: goto st59;
		case 96: goto tr1;
	}
	if ( (*p) < 14 ) {
		if ( (*p) > 8 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto st3;
		} else if ( (*p) >= 0 )
			goto tr1;
	} else if ( (*p) > 44 ) {
		if ( (*p) < 91 ) {
			if ( 59 <= (*p) && (*p) <= 64 )
				goto tr1;
		} else if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr1;
		} else
			goto tr1;
	} else
		goto tr1;
	goto tr9;
tr9:
#line 151 "lexer.rl"
	{
		has_value = 0;
	}
#line 41 "lexer.rl"
	{ identifier.begin = p; }
	goto st4;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
#line 916 "lexer.c"
	switch( (*p) ) {
		case 32: goto tr14;
		case 47: goto tr15;
		case 61: goto tr16;
		case 62: goto tr17;
		case 96: goto tr1;
	}
	if ( (*p) < 14 ) {
		if ( (*p) > 8 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto tr14;
		} else if ( (*p) >= 0 )
			goto tr1;
	} else if ( (*p) > 44 ) {
		if ( (*p) < 91 ) {
			if ( 59 <= (*p) && (*p) <= 64 )
				goto tr1;
		} else if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr1;
		} else
			goto tr1;
	} else
		goto tr1;
	goto st4;
tr7:
#line 42 "lexer.rl"
	{ identifier.end = p; }
#line 137 "lexer.rl"
	{
		// Reset self-closing state - we don't know yet.
		self_closing = 0;
		
		rb_funcall(delegate, id_open_tag_begin, 1, Trenni_token(identifier));
	}
#line 147 "lexer.rl"
	{
		self_closing = 1;
	}
	goto st5;
tr11:
#line 147 "lexer.rl"
	{
		self_closing = 1;
	}
	goto st5;
tr15:
#line 42 "lexer.rl"
	{ identifier.end = p; }
#line 163 "lexer.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
		}
	}
#line 147 "lexer.rl"
	{
		self_closing = 1;
	}
	goto st5;
tr26:
#line 155 "lexer.rl"
	{
		has_value = 1;
	}
#line 163 "lexer.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
		}
	}
#line 147 "lexer.rl"
	{
		self_closing = 1;
	}
	goto st5;
tr32:
#line 159 "lexer.rl"
	{
		has_value = 2;
	}
#line 163 "lexer.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
		}
	}
#line 147 "lexer.rl"
	{
		self_closing = 1;
	}
	goto st5;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
#line 1025 "lexer.c"
	if ( (*p) == 62 )
		goto st59;
	goto tr1;
tr8:
#line 42 "lexer.rl"
	{ identifier.end = p; }
#line 137 "lexer.rl"
	{
		// Reset self-closing state - we don't know yet.
		self_closing = 0;
		
		rb_funcall(delegate, id_open_tag_begin, 1, Trenni_token(identifier));
	}
	goto st59;
tr17:
#line 42 "lexer.rl"
	{ identifier.end = p; }
#line 163 "lexer.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
		}
	}
	goto st59;
tr27:
#line 155 "lexer.rl"
	{
		has_value = 1;
	}
#line 163 "lexer.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
		}
	}
	goto st59;
tr33:
#line 159 "lexer.rl"
	{
		has_value = 2;
	}
#line 163 "lexer.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
		}
	}
	goto st59;
st59:
	if ( ++p == pe )
		goto _test_eof59;
case 59:
#line 1090 "lexer.c"
	switch( (*p) ) {
		case 38: goto tr105;
		case 60: goto tr106;
	}
	goto tr104;
tr16:
#line 42 "lexer.rl"
	{ identifier.end = p; }
	goto st6;
st6:
	if ( ++p == pe )
		goto _test_eof6;
case 6:
#line 1104 "lexer.c"
	if ( (*p) == 34 )
		goto st7;
	goto tr1;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
	switch( (*p) ) {
		case 34: goto st11;
		case 38: goto tr21;
		case 60: goto tr1;
	}
	goto tr19;
tr19:
#line 44 "lexer.rl"
	{
		pcdata = Qnil;
	}
#line 52 "lexer.rl"
	{
		characters.begin = p;
	}
	goto st8;
tr22:
#line 56 "lexer.rl"
	{
		characters.end = p;
		
		Trenni_Parser_append_token(&pcdata, encoding, characters);
	}
#line 52 "lexer.rl"
	{
		characters.begin = p;
	}
	goto st8;
tr28:
#line 52 "lexer.rl"
	{
		characters.begin = p;
	}
	goto st8;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
#line 1150 "lexer.c"
	switch( (*p) ) {
		case 34: goto tr23;
		case 38: goto tr24;
		case 60: goto tr1;
	}
	goto tr22;
tr23:
#line 56 "lexer.rl"
	{
		characters.end = p;
		
		Trenni_Parser_append_token(&pcdata, encoding, characters);
	}
#line 48 "lexer.rl"
	{
		// Buffer is ready.
	}
	goto st9;
tr29:
#line 48 "lexer.rl"
	{
		// Buffer is ready.
	}
	goto st9;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
#line 1179 "lexer.c"
	switch( (*p) ) {
		case 32: goto tr25;
		case 47: goto tr26;
		case 62: goto tr27;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr25;
	goto tr1;
tr21:
#line 44 "lexer.rl"
	{
		pcdata = Qnil;
	}
#line 13 "entities.rl"
	{{stack[top++] = 10; goto st40;}}
	goto st10;
tr24:
#line 56 "lexer.rl"
	{
		characters.end = p;
		
		Trenni_Parser_append_token(&pcdata, encoding, characters);
	}
#line 13 "entities.rl"
	{{stack[top++] = 10; goto st40;}}
	goto st10;
tr30:
#line 13 "entities.rl"
	{{stack[top++] = 10; goto st40;}}
	goto st10;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
#line 1214 "lexer.c"
	switch( (*p) ) {
		case 34: goto tr29;
		case 38: goto tr30;
		case 60: goto tr1;
	}
	goto tr28;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
	switch( (*p) ) {
		case 32: goto tr31;
		case 47: goto tr32;
		case 62: goto tr33;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr31;
	goto tr1;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
	switch( (*p) ) {
		case 45: goto st13;
		case 68: goto st17;
		case 91: goto st24;
	}
	goto st0;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
	if ( (*p) == 45 )
		goto st14;
	goto st0;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
	if ( (*p) == 45 )
		goto st15;
	goto st14;
st15:
	if ( ++p == pe )
		goto _test_eof15;
case 15:
	if ( (*p) == 45 )
		goto st16;
	goto st14;
st16:
	if ( ++p == pe )
		goto _test_eof16;
case 16:
	switch( (*p) ) {
		case 45: goto st16;
		case 62: goto st60;
	}
	goto st14;
st60:
	if ( ++p == pe )
		goto _test_eof60;
case 60:
	switch( (*p) ) {
		case 38: goto tr108;
		case 60: goto tr109;
	}
	goto tr107;
st17:
	if ( ++p == pe )
		goto _test_eof17;
case 17:
	if ( (*p) == 79 )
		goto st18;
	goto st0;
st18:
	if ( ++p == pe )
		goto _test_eof18;
case 18:
	if ( (*p) == 67 )
		goto st19;
	goto st0;
st19:
	if ( ++p == pe )
		goto _test_eof19;
case 19:
	if ( (*p) == 84 )
		goto st20;
	goto st0;
st20:
	if ( ++p == pe )
		goto _test_eof20;
case 20:
	if ( (*p) == 89 )
		goto st21;
	goto st0;
st21:
	if ( ++p == pe )
		goto _test_eof21;
case 21:
	if ( (*p) == 80 )
		goto st22;
	goto st0;
st22:
	if ( ++p == pe )
		goto _test_eof22;
case 22:
	if ( (*p) == 69 )
		goto st23;
	goto st0;
st23:
	if ( ++p == pe )
		goto _test_eof23;
case 23:
	if ( (*p) == 62 )
		goto st61;
	goto st23;
st61:
	if ( ++p == pe )
		goto _test_eof61;
case 61:
	switch( (*p) ) {
		case 38: goto tr111;
		case 60: goto tr112;
	}
	goto tr110;
st24:
	if ( ++p == pe )
		goto _test_eof24;
case 24:
	if ( (*p) == 67 )
		goto st25;
	goto st0;
st25:
	if ( ++p == pe )
		goto _test_eof25;
case 25:
	if ( (*p) == 68 )
		goto st26;
	goto st0;
st26:
	if ( ++p == pe )
		goto _test_eof26;
case 26:
	if ( (*p) == 65 )
		goto st27;
	goto st0;
st27:
	if ( ++p == pe )
		goto _test_eof27;
case 27:
	if ( (*p) == 84 )
		goto st28;
	goto st0;
st28:
	if ( ++p == pe )
		goto _test_eof28;
case 28:
	if ( (*p) == 65 )
		goto st29;
	goto st0;
st29:
	if ( ++p == pe )
		goto _test_eof29;
case 29:
	if ( (*p) == 91 )
		goto st30;
	goto st0;
st30:
	if ( ++p == pe )
		goto _test_eof30;
case 30:
	if ( (*p) == 93 )
		goto st31;
	goto st30;
st31:
	if ( ++p == pe )
		goto _test_eof31;
case 31:
	if ( (*p) == 93 )
		goto st32;
	goto st30;
st32:
	if ( ++p == pe )
		goto _test_eof32;
case 32:
	switch( (*p) ) {
		case 62: goto st62;
		case 93: goto st32;
	}
	goto st30;
st62:
	if ( ++p == pe )
		goto _test_eof62;
case 62:
	switch( (*p) ) {
		case 38: goto tr114;
		case 60: goto tr115;
	}
	goto tr113;
st33:
	if ( ++p == pe )
		goto _test_eof33;
case 33:
	switch( (*p) ) {
		case 47: goto tr1;
		case 96: goto tr1;
	}
	if ( (*p) < 59 ) {
		if ( 0 <= (*p) && (*p) <= 44 )
			goto tr1;
	} else if ( (*p) > 64 ) {
		if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr1;
		} else if ( (*p) >= 91 )
			goto tr1;
	} else
		goto tr1;
	goto tr58;
tr58:
#line 41 "lexer.rl"
	{ identifier.begin = p; }
	goto st34;
st34:
	if ( ++p == pe )
		goto _test_eof34;
case 34:
#line 1442 "lexer.c"
	switch( (*p) ) {
		case 47: goto tr1;
		case 62: goto tr60;
		case 96: goto tr1;
	}
	if ( (*p) < 59 ) {
		if ( 0 <= (*p) && (*p) <= 44 )
			goto tr1;
	} else if ( (*p) > 64 ) {
		if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr1;
		} else if ( (*p) >= 91 )
			goto tr1;
	} else
		goto tr1;
	goto st34;
tr60:
#line 42 "lexer.rl"
	{ identifier.end = p; }
	goto st63;
st63:
	if ( ++p == pe )
		goto _test_eof63;
case 63:
#line 1468 "lexer.c"
	switch( (*p) ) {
		case 38: goto tr117;
		case 60: goto tr118;
	}
	goto tr116;
st35:
	if ( ++p == pe )
		goto _test_eof35;
case 35:
	switch( (*p) ) {
		case 47: goto tr62;
		case 96: goto tr62;
	}
	if ( (*p) < 59 ) {
		if ( 0 <= (*p) && (*p) <= 44 )
			goto tr62;
	} else if ( (*p) > 64 ) {
		if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr62;
		} else if ( (*p) >= 91 )
			goto tr62;
	} else
		goto tr62;
	goto tr61;
tr61:
#line 41 "lexer.rl"
	{ identifier.begin = p; }
	goto st36;
st36:
	if ( ++p == pe )
		goto _test_eof36;
case 36:
#line 1502 "lexer.c"
	switch( (*p) ) {
		case 32: goto tr64;
		case 47: goto tr62;
		case 96: goto tr62;
	}
	if ( (*p) < 14 ) {
		if ( (*p) > 8 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto tr64;
		} else if ( (*p) >= 0 )
			goto tr62;
	} else if ( (*p) > 44 ) {
		if ( (*p) < 91 ) {
			if ( 59 <= (*p) && (*p) <= 64 )
				goto tr62;
		} else if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr62;
		} else
			goto tr62;
	} else
		goto tr62;
	goto st36;
tr64:
#line 42 "lexer.rl"
	{ identifier.end = p; }
	goto st37;
tr66:
#line 123 "lexer.rl"
	{
		instruction_text.begin = p;
	}
	goto st37;
st37:
	if ( ++p == pe )
		goto _test_eof37;
case 37:
#line 1540 "lexer.c"
	switch( (*p) ) {
		case 32: goto tr66;
		case 63: goto tr67;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr66;
	goto tr65;
tr65:
#line 123 "lexer.rl"
	{
		instruction_text.begin = p;
	}
	goto st38;
st38:
	if ( ++p == pe )
		goto _test_eof38;
case 38:
#line 1558 "lexer.c"
	if ( (*p) == 63 )
		goto st39;
	goto st38;
tr67:
#line 123 "lexer.rl"
	{
		instruction_text.begin = p;
	}
	goto st39;
st39:
	if ( ++p == pe )
		goto _test_eof39;
case 39:
#line 1572 "lexer.c"
	switch( (*p) ) {
		case 62: goto st64;
		case 63: goto st39;
	}
	goto st38;
st64:
	if ( ++p == pe )
		goto _test_eof64;
case 64:
	switch( (*p) ) {
		case 38: goto tr120;
		case 60: goto tr121;
	}
	goto tr119;
st40:
	if ( ++p == pe )
		goto _test_eof40;
case 40:
	switch( (*p) ) {
		case 35: goto st41;
		case 97: goto st45;
		case 103: goto st48;
		case 108: goto st50;
		case 113: goto st52;
	}
	goto tr71;
st41:
	if ( ++p == pe )
		goto _test_eof41;
case 41:
	if ( (*p) == 120 )
		goto st43;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr77;
	goto tr71;
tr77:
#line 66 "lexer.rl"
	{
		entity.begin = p;
	}
	goto st42;
st42:
	if ( ++p == pe )
		goto _test_eof42;
case 42:
#line 1618 "lexer.c"
	if ( (*p) == 59 )
		goto tr80;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st42;
	goto tr71;
tr80:
#line 83 "lexer.rl"
	{
		entity.end = p;
		
		char * end = (char *)entity.end;
		unsigned long codepoint = strtoul(entity.begin, &end, 10);
		
		Trenni_Parser_append_codepoint(&pcdata, encoding, codepoint);
	}
#line 11 "entities.rl"
	{{cs = stack[--top];goto _again;}}
	goto st65;
tr83:
#line 74 "lexer.rl"
	{
		entity.end = p;
		
		char * end = (char *)entity.end;
		unsigned long codepoint = strtoul(entity.begin, &end, 16);
		
		Trenni_Parser_append_codepoint(&pcdata, encoding, codepoint);
	}
#line 11 "entities.rl"
	{{cs = stack[--top];goto _again;}}
	goto st65;
tr86:
#line 5 "entities.rl"
	{entity_codepoint(38);}
#line 11 "entities.rl"
	{{cs = stack[--top];goto _again;}}
	goto st65;
tr88:
#line 8 "entities.rl"
	{entity_codepoint(62);}
#line 11 "entities.rl"
	{{cs = stack[--top];goto _again;}}
	goto st65;
tr90:
#line 7 "entities.rl"
	{entity_codepoint(60);}
#line 11 "entities.rl"
	{{cs = stack[--top];goto _again;}}
	goto st65;
tr94:
#line 6 "entities.rl"
	{entity_codepoint(34);}
#line 11 "entities.rl"
	{{cs = stack[--top];goto _again;}}
	goto st65;
st65:
	if ( ++p == pe )
		goto _test_eof65;
case 65:
#line 1678 "lexer.c"
	goto st0;
st43:
	if ( ++p == pe )
		goto _test_eof43;
case 43:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr81;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto tr81;
	} else
		goto tr81;
	goto tr71;
tr81:
#line 66 "lexer.rl"
	{
		entity.begin = p;
	}
	goto st44;
st44:
	if ( ++p == pe )
		goto _test_eof44;
case 44:
#line 1703 "lexer.c"
	if ( (*p) == 59 )
		goto tr83;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st44;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st44;
	} else
		goto st44;
	goto tr71;
st45:
	if ( ++p == pe )
		goto _test_eof45;
case 45:
	if ( (*p) == 109 )
		goto st46;
	goto tr71;
st46:
	if ( ++p == pe )
		goto _test_eof46;
case 46:
	if ( (*p) == 112 )
		goto st47;
	goto tr71;
st47:
	if ( ++p == pe )
		goto _test_eof47;
case 47:
	if ( (*p) == 59 )
		goto tr86;
	goto tr71;
st48:
	if ( ++p == pe )
		goto _test_eof48;
case 48:
	if ( (*p) == 116 )
		goto st49;
	goto tr71;
st49:
	if ( ++p == pe )
		goto _test_eof49;
case 49:
	if ( (*p) == 59 )
		goto tr88;
	goto tr71;
st50:
	if ( ++p == pe )
		goto _test_eof50;
case 50:
	if ( (*p) == 116 )
		goto st51;
	goto tr71;
st51:
	if ( ++p == pe )
		goto _test_eof51;
case 51:
	if ( (*p) == 59 )
		goto tr90;
	goto tr71;
st52:
	if ( ++p == pe )
		goto _test_eof52;
case 52:
	if ( (*p) == 117 )
		goto st53;
	goto tr71;
st53:
	if ( ++p == pe )
		goto _test_eof53;
case 53:
	if ( (*p) == 111 )
		goto st54;
	goto tr71;
st54:
	if ( ++p == pe )
		goto _test_eof54;
case 54:
	if ( (*p) == 116 )
		goto st55;
	goto tr71;
st55:
	if ( ++p == pe )
		goto _test_eof55;
case 55:
	if ( (*p) == 59 )
		goto tr94;
	goto tr71;
	}
	_test_eof56: cs = 56; goto _test_eof; 
	_test_eof57: cs = 57; goto _test_eof; 
	_test_eof58: cs = 58; goto _test_eof; 
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof59: cs = 59; goto _test_eof; 
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
	_test_eof60: cs = 60; goto _test_eof; 
	_test_eof17: cs = 17; goto _test_eof; 
	_test_eof18: cs = 18; goto _test_eof; 
	_test_eof19: cs = 19; goto _test_eof; 
	_test_eof20: cs = 20; goto _test_eof; 
	_test_eof21: cs = 21; goto _test_eof; 
	_test_eof22: cs = 22; goto _test_eof; 
	_test_eof23: cs = 23; goto _test_eof; 
	_test_eof61: cs = 61; goto _test_eof; 
	_test_eof24: cs = 24; goto _test_eof; 
	_test_eof25: cs = 25; goto _test_eof; 
	_test_eof26: cs = 26; goto _test_eof; 
	_test_eof27: cs = 27; goto _test_eof; 
	_test_eof28: cs = 28; goto _test_eof; 
	_test_eof29: cs = 29; goto _test_eof; 
	_test_eof30: cs = 30; goto _test_eof; 
	_test_eof31: cs = 31; goto _test_eof; 
	_test_eof32: cs = 32; goto _test_eof; 
	_test_eof62: cs = 62; goto _test_eof; 
	_test_eof33: cs = 33; goto _test_eof; 
	_test_eof34: cs = 34; goto _test_eof; 
	_test_eof63: cs = 63; goto _test_eof; 
	_test_eof35: cs = 35; goto _test_eof; 
	_test_eof36: cs = 36; goto _test_eof; 
	_test_eof37: cs = 37; goto _test_eof; 
	_test_eof38: cs = 38; goto _test_eof; 
	_test_eof39: cs = 39; goto _test_eof; 
	_test_eof64: cs = 64; goto _test_eof; 
	_test_eof40: cs = 40; goto _test_eof; 
	_test_eof41: cs = 41; goto _test_eof; 
	_test_eof42: cs = 42; goto _test_eof; 
	_test_eof65: cs = 65; goto _test_eof; 
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

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 40: 
	case 41: 
	case 42: 
	case 43: 
	case 44: 
	case 45: 
	case 46: 
	case 47: 
	case 48: 
	case 49: 
	case 50: 
	case 51: 
	case 52: 
	case 53: 
	case 54: 
	case 55: 
#line 62 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse entity", buffer, p-s);
	}
	break;
	case 61: 
#line 96 "lexer.rl"
	{
		doctype.end = p;
		
		rb_funcall(delegate, id_doctype, 1, Trenni_token(doctype));
	}
	break;
	case 23: 
#line 102 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse doctype", buffer, p-s);
	}
	break;
	case 60: 
#line 110 "lexer.rl"
	{
		comment.end = p;
		
		rb_funcall(delegate, id_comment, 1, Trenni_token(comment));
	}
	break;
	case 14: 
	case 15: 
	case 16: 
#line 116 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse comment", buffer, p-s);
	}
	break;
	case 64: 
#line 127 "lexer.rl"
	{
		instruction_text.end = p-2;
		
		rb_funcall(delegate, id_instruction, 2, Trenni_token(identifier), Trenni_token(instruction_text));
	}
	break;
	case 35: 
	case 36: 
	case 37: 
	case 38: 
	case 39: 
#line 133 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse instruction", buffer, p-s);
	}
	break;
	case 59: 
#line 173 "lexer.rl"
	{
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}
	break;
	case 63: 
#line 180 "lexer.rl"
	{
		rb_funcall(delegate, id_close_tag, 1, Trenni_token(identifier));
	}
	break;
	case 1: 
	case 2: 
	case 3: 
	case 4: 
	case 5: 
	case 6: 
	case 7: 
	case 8: 
	case 9: 
	case 10: 
	case 11: 
	case 33: 
	case 34: 
#line 184 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse tag", buffer, p-s);
	}
	break;
	case 62: 
#line 192 "lexer.rl"
	{
		cdata.end = p;
		
		rb_funcall(delegate, id_cdata, 1, Trenni_token(cdata));
	}
	break;
	case 30: 
	case 31: 
	case 32: 
#line 198 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse cdata", buffer, p-s);
	}
	break;
	case 58: 
#line 48 "lexer.rl"
	{
		// Buffer is ready.
	}
#line 206 "lexer.rl"
	{
		// Entities are handled separately:
		rb_funcall(delegate, id_text, 1, pcdata);
	}
	break;
	case 57: 
#line 56 "lexer.rl"
	{
		characters.end = p;
		
		Trenni_Parser_append_token(&pcdata, encoding, characters);
	}
#line 48 "lexer.rl"
	{
		// Buffer is ready.
	}
#line 206 "lexer.rl"
	{
		// Entities are handled separately:
		rb_funcall(delegate, id_text, 1, pcdata);
	}
	break;
#line 2006 "lexer.c"
	}
	}

	_out: {}
	}

#line 247 "lexer.rl"

	
	if (p != eof) {
		Trenni_Parser_parse_error("could not parse all input", buffer, p-s);
	}
}
