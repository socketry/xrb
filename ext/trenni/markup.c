
#line 1 "markup.rl"

#include "markup.h"

#include <ruby/encoding.h>


#line 10 "markup.c"
static const int Trenni_markup_parser_start = 48;
static const int Trenni_markup_parser_first_final = 48;
static const int Trenni_markup_parser_error = 0;

static const int Trenni_markup_parser_en_parse_entity = 42;
static const int Trenni_markup_parser_en_main = 48;


#line 184 "markup.rl"


VALUE Trenni_Native_parse_markup(VALUE self, VALUE buffer, VALUE delegate, VALUE entities) {
	VALUE string = rb_funcall(buffer, id_read, 0);
	
	rb_encoding *encoding = rb_enc_get(string);
	
	VALUE pcdata = Qnil;
	
	VALUE empty_string = rb_obj_freeze(rb_enc_str_new("", 0, encoding));
	
	const char *s, *p, *pe, *eof;
	unsigned long cs, top = 0, stack[2] = {0};
	unsigned long codepoint = 0;
	
	Token identifier = {0}, cdata = {0}, characters = {0}, entity = {0}, doctype = {0}, comment = {0}, instruction = {0};
	unsigned self_closing = 0, has_value = 0;
	
	s = p = RSTRING_PTR(string);
	eof = pe = p + RSTRING_LEN(string);
	
	
#line 42 "markup.c"
	{
	cs = Trenni_markup_parser_start;
	top = 0;
	}

#line 48 "markup.c"
	{
	if ( p == pe )
		goto _test_eof;
	goto _resume;

_again:
	switch ( cs ) {
		case 48: goto st48;
		case 49: goto st49;
		case 50: goto st50;
		case 1: goto st1;
		case 2: goto st2;
		case 0: goto st0;
		case 3: goto st3;
		case 4: goto st4;
		case 5: goto st5;
		case 51: goto st51;
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
		case 17: goto st17;
		case 18: goto st18;
		case 19: goto st19;
		case 52: goto st52;
		case 20: goto st20;
		case 21: goto st21;
		case 22: goto st22;
		case 23: goto st23;
		case 24: goto st24;
		case 25: goto st25;
		case 26: goto st26;
		case 53: goto st53;
		case 27: goto st27;
		case 28: goto st28;
		case 29: goto st29;
		case 30: goto st30;
		case 31: goto st31;
		case 32: goto st32;
		case 33: goto st33;
		case 34: goto st34;
		case 35: goto st35;
		case 54: goto st54;
		case 36: goto st36;
		case 37: goto st37;
		case 55: goto st55;
		case 38: goto st38;
		case 39: goto st39;
		case 40: goto st40;
		case 41: goto st41;
		case 56: goto st56;
		case 42: goto st42;
		case 43: goto st43;
		case 44: goto st44;
		case 57: goto st57;
		case 45: goto st45;
		case 46: goto st46;
		case 47: goto st47;
	default: break;
	}

	if ( ++p == pe )
		goto _test_eof;
_resume:
	switch ( cs )
	{
st48:
	if ( ++p == pe )
		goto _test_eof48;
case 48:
	switch( (*p) ) {
		case 38: goto tr88;
		case 60: goto tr89;
	}
	goto tr87;
tr87:
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 26 "markup.rl"
	{
		characters.begin = p;
	}
	goto st49;
tr93:
#line 26 "markup.rl"
	{
		characters.begin = p;
	}
	goto st49;
tr96:
#line 152 "markup.rl"
	{
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 26 "markup.rl"
	{
		characters.begin = p;
	}
	goto st49;
tr99:
#line 86 "markup.rl"
	{
		comment.end = p;
		
		rb_funcall(delegate, id_comment, 1, Trenni_token(comment, encoding));
	}
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 26 "markup.rl"
	{
		characters.begin = p;
	}
	goto st49;
tr102:
#line 72 "markup.rl"
	{
		doctype.end = p;
		
		rb_funcall(delegate, id_doctype, 1, Trenni_token(doctype, encoding));
	}
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 26 "markup.rl"
	{
		characters.begin = p;
	}
	goto st49;
tr105:
#line 171 "markup.rl"
	{
		cdata.end = p;
		
		rb_funcall(delegate, id_cdata, 1, Trenni_token(cdata, encoding));
	}
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 26 "markup.rl"
	{
		characters.begin = p;
	}
	goto st49;
tr108:
#line 159 "markup.rl"
	{
		rb_funcall(delegate, id_close_tag, 2, Trenni_token(identifier, encoding), ULONG2NUM(identifier.begin-s));
	}
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 26 "markup.rl"
	{
		characters.begin = p;
	}
	goto st49;
tr111:
#line 106 "markup.rl"
	{
		instruction.end = p;
		
		rb_funcall(delegate, id_instruction, 1, Trenni_token(instruction, encoding));
	}
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 26 "markup.rl"
	{
		characters.begin = p;
	}
	goto st49;
st49:
	if ( ++p == pe )
		goto _test_eof49;
case 49:
#line 243 "markup.c"
	switch( (*p) ) {
		case 38: goto tr91;
		case 60: goto tr92;
	}
	goto st49;
tr88:
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 10 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{stack[top++] = 50; goto st42;}}
	goto st50;
tr91:
#line 30 "markup.rl"
	{
		characters.end = p;
		
		Trenni_append_token(&pcdata, encoding, characters);
	}
#line 10 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{stack[top++] = 50; goto st42;}}
	goto st50;
tr94:
#line 10 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{stack[top++] = 50; goto st42;}}
	goto st50;
tr97:
#line 152 "markup.rl"
	{
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 10 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{stack[top++] = 50; goto st42;}}
	goto st50;
tr100:
#line 86 "markup.rl"
	{
		comment.end = p;
		
		rb_funcall(delegate, id_comment, 1, Trenni_token(comment, encoding));
	}
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 10 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{stack[top++] = 50; goto st42;}}
	goto st50;
tr103:
#line 72 "markup.rl"
	{
		doctype.end = p;
		
		rb_funcall(delegate, id_doctype, 1, Trenni_token(doctype, encoding));
	}
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 10 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{stack[top++] = 50; goto st42;}}
	goto st50;
tr106:
#line 171 "markup.rl"
	{
		cdata.end = p;
		
		rb_funcall(delegate, id_cdata, 1, Trenni_token(cdata, encoding));
	}
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 10 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{stack[top++] = 50; goto st42;}}
	goto st50;
tr109:
#line 159 "markup.rl"
	{
		rb_funcall(delegate, id_close_tag, 2, Trenni_token(identifier, encoding), ULONG2NUM(identifier.begin-s));
	}
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 10 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{stack[top++] = 50; goto st42;}}
	goto st50;
tr112:
#line 106 "markup.rl"
	{
		instruction.end = p;
		
		rb_funcall(delegate, id_instruction, 1, Trenni_token(instruction, encoding));
	}
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 10 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{stack[top++] = 50; goto st42;}}
	goto st50;
st50:
	if ( ++p == pe )
		goto _test_eof50;
case 50:
#line 355 "markup.c"
	switch( (*p) ) {
		case 38: goto tr94;
		case 60: goto tr95;
	}
	goto tr93;
tr89:
#line 123 "markup.rl"
	{
	}
#line 156 "markup.rl"
	{
	}
#line 96 "markup.rl"
	{
		instruction.begin = p;
	}
#line 82 "markup.rl"
	{
		comment.begin = p;
	}
#line 68 "markup.rl"
	{
		doctype.begin = p;
	}
#line 167 "markup.rl"
	{
		cdata.begin = p;
	}
	goto st1;
tr92:
#line 30 "markup.rl"
	{
		characters.end = p;
		
		Trenni_append_token(&pcdata, encoding, characters);
	}
#line 22 "markup.rl"
	{
		rb_funcall(delegate, id_text, 1, pcdata);
	}
#line 123 "markup.rl"
	{
	}
#line 156 "markup.rl"
	{
	}
#line 96 "markup.rl"
	{
		instruction.begin = p;
	}
#line 82 "markup.rl"
	{
		comment.begin = p;
	}
#line 68 "markup.rl"
	{
		doctype.begin = p;
	}
#line 167 "markup.rl"
	{
		cdata.begin = p;
	}
	goto st1;
tr95:
#line 22 "markup.rl"
	{
		rb_funcall(delegate, id_text, 1, pcdata);
	}
#line 123 "markup.rl"
	{
	}
#line 156 "markup.rl"
	{
	}
#line 96 "markup.rl"
	{
		instruction.begin = p;
	}
#line 82 "markup.rl"
	{
		comment.begin = p;
	}
#line 68 "markup.rl"
	{
		doctype.begin = p;
	}
#line 167 "markup.rl"
	{
		cdata.begin = p;
	}
	goto st1;
tr98:
#line 152 "markup.rl"
	{
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}
#line 123 "markup.rl"
	{
	}
#line 156 "markup.rl"
	{
	}
#line 96 "markup.rl"
	{
		instruction.begin = p;
	}
#line 82 "markup.rl"
	{
		comment.begin = p;
	}
#line 68 "markup.rl"
	{
		doctype.begin = p;
	}
#line 167 "markup.rl"
	{
		cdata.begin = p;
	}
	goto st1;
tr101:
#line 86 "markup.rl"
	{
		comment.end = p;
		
		rb_funcall(delegate, id_comment, 1, Trenni_token(comment, encoding));
	}
#line 123 "markup.rl"
	{
	}
#line 156 "markup.rl"
	{
	}
#line 96 "markup.rl"
	{
		instruction.begin = p;
	}
#line 82 "markup.rl"
	{
		comment.begin = p;
	}
#line 68 "markup.rl"
	{
		doctype.begin = p;
	}
#line 167 "markup.rl"
	{
		cdata.begin = p;
	}
	goto st1;
tr104:
#line 72 "markup.rl"
	{
		doctype.end = p;
		
		rb_funcall(delegate, id_doctype, 1, Trenni_token(doctype, encoding));
	}
#line 123 "markup.rl"
	{
	}
#line 156 "markup.rl"
	{
	}
#line 96 "markup.rl"
	{
		instruction.begin = p;
	}
#line 82 "markup.rl"
	{
		comment.begin = p;
	}
#line 68 "markup.rl"
	{
		doctype.begin = p;
	}
#line 167 "markup.rl"
	{
		cdata.begin = p;
	}
	goto st1;
tr107:
#line 171 "markup.rl"
	{
		cdata.end = p;
		
		rb_funcall(delegate, id_cdata, 1, Trenni_token(cdata, encoding));
	}
#line 123 "markup.rl"
	{
	}
#line 156 "markup.rl"
	{
	}
#line 96 "markup.rl"
	{
		instruction.begin = p;
	}
#line 82 "markup.rl"
	{
		comment.begin = p;
	}
#line 68 "markup.rl"
	{
		doctype.begin = p;
	}
#line 167 "markup.rl"
	{
		cdata.begin = p;
	}
	goto st1;
tr110:
#line 159 "markup.rl"
	{
		rb_funcall(delegate, id_close_tag, 2, Trenni_token(identifier, encoding), ULONG2NUM(identifier.begin-s));
	}
#line 123 "markup.rl"
	{
	}
#line 156 "markup.rl"
	{
	}
#line 96 "markup.rl"
	{
		instruction.begin = p;
	}
#line 82 "markup.rl"
	{
		comment.begin = p;
	}
#line 68 "markup.rl"
	{
		doctype.begin = p;
	}
#line 167 "markup.rl"
	{
		cdata.begin = p;
	}
	goto st1;
tr113:
#line 106 "markup.rl"
	{
		instruction.end = p;
		
		rb_funcall(delegate, id_instruction, 1, Trenni_token(instruction, encoding));
	}
#line 123 "markup.rl"
	{
	}
#line 156 "markup.rl"
	{
	}
#line 96 "markup.rl"
	{
		instruction.begin = p;
	}
#line 82 "markup.rl"
	{
		comment.begin = p;
	}
#line 68 "markup.rl"
	{
		doctype.begin = p;
	}
#line 167 "markup.rl"
	{
		cdata.begin = p;
	}
	goto st1;
st1:
	if ( ++p == pe )
		goto _test_eof1;
case 1:
#line 627 "markup.c"
	switch( (*p) ) {
		case 33: goto st15;
		case 47: goto st36;
		case 63: goto st38;
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
#line 10 "markup.rl"
	{
		identifier.begin = p;
	}
	goto st2;
st2:
	if ( ++p == pe )
		goto _test_eof2;
case 2:
#line 656 "markup.c"
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
#line 163 "markup.rl"
	{
		Trenni_raise_error("could not parse tag", buffer, p-s);
	}
	goto st0;
tr69:
#line 112 "markup.rl"
	{
		Trenni_raise_error("could not parse instruction", buffer, p-s);
	}
	goto st0;
tr75:
#line 36 "markup.rl"
	{
		Trenni_raise_error("could not parse entity", buffer, p-s);
	}
	goto st0;
#line 699 "markup.c"
st0:
cs = 0;
	goto _out;
tr6:
#line 14 "markup.rl"
	{
		identifier.end = p;
	}
#line 116 "markup.rl"
	{
		// Reset self-closing state - we don't know yet.
		self_closing = 0;
		
		rb_funcall(delegate, id_open_tag_begin, 2, Trenni_token(identifier, encoding), ULONG2NUM(identifier.begin-s));
	}
	goto st3;
tr14:
#line 14 "markup.rl"
	{
		identifier.end = p;
	}
#line 142 "markup.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), Qtrue);
		}
	}
	goto st3;
tr26:
#line 134 "markup.rl"
	{
		has_value = 1;
	}
#line 142 "markup.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), Qtrue);
		}
	}
	goto st3;
tr32:
#line 138 "markup.rl"
	{
		has_value = 2;
	}
#line 142 "markup.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), Qtrue);
		}
	}
	goto st3;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
#line 768 "markup.c"
	switch( (*p) ) {
		case 32: goto st3;
		case 47: goto tr11;
		case 62: goto st51;
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
#line 130 "markup.rl"
	{
		has_value = 0;
	}
#line 10 "markup.rl"
	{
		identifier.begin = p;
	}
	goto st4;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
#line 807 "markup.c"
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
#line 14 "markup.rl"
	{
		identifier.end = p;
	}
#line 116 "markup.rl"
	{
		// Reset self-closing state - we don't know yet.
		self_closing = 0;
		
		rb_funcall(delegate, id_open_tag_begin, 2, Trenni_token(identifier, encoding), ULONG2NUM(identifier.begin-s));
	}
#line 126 "markup.rl"
	{
		self_closing = 1;
	}
	goto st5;
tr11:
#line 126 "markup.rl"
	{
		self_closing = 1;
	}
	goto st5;
tr15:
#line 14 "markup.rl"
	{
		identifier.end = p;
	}
#line 142 "markup.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), Qtrue);
		}
	}
#line 126 "markup.rl"
	{
		self_closing = 1;
	}
	goto st5;
tr27:
#line 134 "markup.rl"
	{
		has_value = 1;
	}
#line 142 "markup.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), Qtrue);
		}
	}
#line 126 "markup.rl"
	{
		self_closing = 1;
	}
	goto st5;
tr33:
#line 138 "markup.rl"
	{
		has_value = 2;
	}
#line 142 "markup.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), Qtrue);
		}
	}
#line 126 "markup.rl"
	{
		self_closing = 1;
	}
	goto st5;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
#line 920 "markup.c"
	if ( (*p) == 62 )
		goto st51;
	goto tr1;
tr8:
#line 14 "markup.rl"
	{
		identifier.end = p;
	}
#line 116 "markup.rl"
	{
		// Reset self-closing state - we don't know yet.
		self_closing = 0;
		
		rb_funcall(delegate, id_open_tag_begin, 2, Trenni_token(identifier, encoding), ULONG2NUM(identifier.begin-s));
	}
	goto st51;
tr17:
#line 14 "markup.rl"
	{
		identifier.end = p;
	}
#line 142 "markup.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), Qtrue);
		}
	}
	goto st51;
tr28:
#line 134 "markup.rl"
	{
		has_value = 1;
	}
#line 142 "markup.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), Qtrue);
		}
	}
	goto st51;
tr34:
#line 138 "markup.rl"
	{
		has_value = 2;
	}
#line 142 "markup.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier, encoding), Qtrue);
		}
	}
	goto st51;
st51:
	if ( ++p == pe )
		goto _test_eof51;
case 51:
#line 989 "markup.c"
	switch( (*p) ) {
		case 38: goto tr97;
		case 60: goto tr98;
	}
	goto tr96;
tr16:
#line 14 "markup.rl"
	{
		identifier.end = p;
	}
	goto st6;
st6:
	if ( ++p == pe )
		goto _test_eof6;
case 6:
#line 1005 "markup.c"
	switch( (*p) ) {
		case 34: goto st7;
		case 39: goto st12;
	}
	goto tr1;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
	switch( (*p) ) {
		case 34: goto st11;
		case 38: goto tr22;
		case 60: goto tr1;
	}
	goto tr20;
tr20:
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 26 "markup.rl"
	{
		characters.begin = p;
	}
	goto st8;
tr29:
#line 26 "markup.rl"
	{
		characters.begin = p;
	}
	goto st8;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
#line 1041 "markup.c"
	switch( (*p) ) {
		case 34: goto tr24;
		case 38: goto tr25;
		case 60: goto tr1;
	}
	goto st8;
tr24:
#line 30 "markup.rl"
	{
		characters.end = p;
		
		Trenni_append_token(&pcdata, encoding, characters);
	}
#line 22 "markup.rl"
	{
		rb_funcall(delegate, id_text, 1, pcdata);
	}
	goto st9;
tr30:
#line 22 "markup.rl"
	{
		rb_funcall(delegate, id_text, 1, pcdata);
	}
	goto st9;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
#line 1070 "markup.c"
	switch( (*p) ) {
		case 32: goto tr26;
		case 47: goto tr27;
		case 62: goto tr28;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr26;
	goto tr1;
tr22:
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 10 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{stack[top++] = 10; goto st42;}}
	goto st10;
tr25:
#line 30 "markup.rl"
	{
		characters.end = p;
		
		Trenni_append_token(&pcdata, encoding, characters);
	}
#line 10 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{stack[top++] = 10; goto st42;}}
	goto st10;
tr31:
#line 10 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{stack[top++] = 10; goto st42;}}
	goto st10;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
#line 1105 "markup.c"
	switch( (*p) ) {
		case 34: goto tr30;
		case 38: goto tr31;
		case 60: goto tr1;
	}
	goto tr29;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
	switch( (*p) ) {
		case 32: goto tr32;
		case 47: goto tr33;
		case 62: goto tr34;
	}
	if ( 9 <= (*p) && (*p) <= 13 )
		goto tr32;
	goto tr1;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
	switch( (*p) ) {
		case 38: goto tr36;
		case 39: goto st11;
		case 60: goto tr1;
	}
	goto tr35;
tr35:
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 26 "markup.rl"
	{
		characters.begin = p;
	}
	goto st13;
tr39:
#line 26 "markup.rl"
	{
		characters.begin = p;
	}
	goto st13;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
#line 1154 "markup.c"
	switch( (*p) ) {
		case 38: goto tr38;
		case 39: goto tr24;
		case 60: goto tr1;
	}
	goto st13;
tr36:
#line 18 "markup.rl"
	{
		pcdata = Qnil;
	}
#line 10 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{stack[top++] = 14; goto st42;}}
	goto st14;
tr38:
#line 30 "markup.rl"
	{
		characters.end = p;
		
		Trenni_append_token(&pcdata, encoding, characters);
	}
#line 10 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{stack[top++] = 14; goto st42;}}
	goto st14;
tr40:
#line 10 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{stack[top++] = 14; goto st42;}}
	goto st14;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
#line 1187 "markup.c"
	switch( (*p) ) {
		case 38: goto tr40;
		case 39: goto tr30;
		case 60: goto tr1;
	}
	goto tr39;
st15:
	if ( ++p == pe )
		goto _test_eof15;
case 15:
	switch( (*p) ) {
		case 45: goto st16;
		case 68: goto st20;
		case 91: goto st27;
	}
	goto st0;
st16:
	if ( ++p == pe )
		goto _test_eof16;
case 16:
	if ( (*p) == 45 )
		goto st17;
	goto st0;
st17:
	if ( ++p == pe )
		goto _test_eof17;
case 17:
	if ( (*p) == 45 )
		goto st18;
	goto st17;
st18:
	if ( ++p == pe )
		goto _test_eof18;
case 18:
	if ( (*p) == 45 )
		goto st19;
	goto st17;
st19:
	if ( ++p == pe )
		goto _test_eof19;
case 19:
	switch( (*p) ) {
		case 45: goto st19;
		case 62: goto st52;
	}
	goto st17;
st52:
	if ( ++p == pe )
		goto _test_eof52;
case 52:
	switch( (*p) ) {
		case 38: goto tr100;
		case 60: goto tr101;
	}
	goto tr99;
st20:
	if ( ++p == pe )
		goto _test_eof20;
case 20:
	if ( (*p) == 79 )
		goto st21;
	goto st0;
st21:
	if ( ++p == pe )
		goto _test_eof21;
case 21:
	if ( (*p) == 67 )
		goto st22;
	goto st0;
st22:
	if ( ++p == pe )
		goto _test_eof22;
case 22:
	if ( (*p) == 84 )
		goto st23;
	goto st0;
st23:
	if ( ++p == pe )
		goto _test_eof23;
case 23:
	if ( (*p) == 89 )
		goto st24;
	goto st0;
st24:
	if ( ++p == pe )
		goto _test_eof24;
case 24:
	if ( (*p) == 80 )
		goto st25;
	goto st0;
st25:
	if ( ++p == pe )
		goto _test_eof25;
case 25:
	if ( (*p) == 69 )
		goto st26;
	goto st0;
st26:
	if ( ++p == pe )
		goto _test_eof26;
case 26:
	if ( (*p) == 62 )
		goto st53;
	goto st26;
st53:
	if ( ++p == pe )
		goto _test_eof53;
case 53:
	switch( (*p) ) {
		case 38: goto tr103;
		case 60: goto tr104;
	}
	goto tr102;
st27:
	if ( ++p == pe )
		goto _test_eof27;
case 27:
	if ( (*p) == 67 )
		goto st28;
	goto st0;
st28:
	if ( ++p == pe )
		goto _test_eof28;
case 28:
	if ( (*p) == 68 )
		goto st29;
	goto st0;
st29:
	if ( ++p == pe )
		goto _test_eof29;
case 29:
	if ( (*p) == 65 )
		goto st30;
	goto st0;
st30:
	if ( ++p == pe )
		goto _test_eof30;
case 30:
	if ( (*p) == 84 )
		goto st31;
	goto st0;
st31:
	if ( ++p == pe )
		goto _test_eof31;
case 31:
	if ( (*p) == 65 )
		goto st32;
	goto st0;
st32:
	if ( ++p == pe )
		goto _test_eof32;
case 32:
	if ( (*p) == 91 )
		goto st33;
	goto st0;
st33:
	if ( ++p == pe )
		goto _test_eof33;
case 33:
	if ( (*p) == 93 )
		goto st34;
	goto st33;
st34:
	if ( ++p == pe )
		goto _test_eof34;
case 34:
	if ( (*p) == 93 )
		goto st35;
	goto st33;
st35:
	if ( ++p == pe )
		goto _test_eof35;
case 35:
	switch( (*p) ) {
		case 62: goto st54;
		case 93: goto st35;
	}
	goto st33;
st54:
	if ( ++p == pe )
		goto _test_eof54;
case 54:
	switch( (*p) ) {
		case 38: goto tr106;
		case 60: goto tr107;
	}
	goto tr105;
st36:
	if ( ++p == pe )
		goto _test_eof36;
case 36:
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
	goto tr65;
tr65:
#line 10 "markup.rl"
	{
		identifier.begin = p;
	}
	goto st37;
st37:
	if ( ++p == pe )
		goto _test_eof37;
case 37:
#line 1405 "markup.c"
	switch( (*p) ) {
		case 47: goto tr1;
		case 62: goto tr67;
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
	goto st37;
tr67:
#line 14 "markup.rl"
	{
		identifier.end = p;
	}
	goto st55;
st55:
	if ( ++p == pe )
		goto _test_eof55;
case 55:
#line 1433 "markup.c"
	switch( (*p) ) {
		case 38: goto tr109;
		case 60: goto tr110;
	}
	goto tr108;
st38:
	if ( ++p == pe )
		goto _test_eof38;
case 38:
	switch( (*p) ) {
		case 47: goto tr69;
		case 96: goto tr69;
	}
	if ( (*p) < 59 ) {
		if ( 0 <= (*p) && (*p) <= 44 )
			goto tr69;
	} else if ( (*p) > 64 ) {
		if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr69;
		} else if ( (*p) >= 91 )
			goto tr69;
	} else
		goto tr69;
	goto tr68;
tr68:
#line 10 "markup.rl"
	{
		identifier.begin = p;
	}
	goto st39;
st39:
	if ( ++p == pe )
		goto _test_eof39;
case 39:
#line 1469 "markup.c"
	switch( (*p) ) {
		case 32: goto tr71;
		case 47: goto tr69;
		case 96: goto tr69;
	}
	if ( (*p) < 14 ) {
		if ( (*p) > 8 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto tr71;
		} else if ( (*p) >= 0 )
			goto tr69;
	} else if ( (*p) > 44 ) {
		if ( (*p) < 91 ) {
			if ( 59 <= (*p) && (*p) <= 64 )
				goto tr69;
		} else if ( (*p) > 94 ) {
			if ( 123 <= (*p) )
				goto tr69;
		} else
			goto tr69;
	} else
		goto tr69;
	goto st39;
tr71:
#line 14 "markup.rl"
	{
		identifier.end = p;
	}
#line 100 "markup.rl"
	{
	}
	goto st40;
st40:
	if ( ++p == pe )
		goto _test_eof40;
case 40:
#line 1506 "markup.c"
	if ( (*p) == 63 )
		goto tr73;
	goto st40;
tr73:
#line 103 "markup.rl"
	{
	}
	goto st41;
st41:
	if ( ++p == pe )
		goto _test_eof41;
case 41:
#line 1519 "markup.c"
	switch( (*p) ) {
		case 62: goto st56;
		case 63: goto tr73;
	}
	goto st40;
st56:
	if ( ++p == pe )
		goto _test_eof56;
case 56:
	switch( (*p) ) {
		case 38: goto tr112;
		case 60: goto tr113;
	}
	goto tr111;
st42:
	if ( ++p == pe )
		goto _test_eof42;
case 42:
	if ( (*p) == 35 )
		goto st43;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr77;
	} else if ( (*p) > 90 ) {
		if ( 97 <= (*p) && (*p) <= 122 )
			goto tr77;
	} else
		goto tr77;
	goto tr75;
st43:
	if ( ++p == pe )
		goto _test_eof43;
case 43:
	if ( (*p) == 120 )
		goto st45;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr78;
	goto tr75;
tr78:
#line 40 "markup.rl"
	{
		entity.begin = p;
	}
	goto st44;
st44:
	if ( ++p == pe )
		goto _test_eof44;
case 44:
#line 1568 "markup.c"
	if ( (*p) == 59 )
		goto tr81;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st44;
	goto tr75;
tr81:
#line 60 "markup.rl"
	{
		entity.end = p;
		
		codepoint = strtoul(entity.begin, (char **)&entity.end, 10);
		
		Trenni_append_codepoint(&pcdata, encoding, codepoint);
	}
#line 8 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{cs = stack[--top];goto _again;}}
	goto st57;
tr84:
#line 52 "markup.rl"
	{
		entity.end = p;
		
		codepoint = strtoul(entity.begin, (char **)&entity.end, 16);
		
		Trenni_append_codepoint(&pcdata, encoding, codepoint);
	}
#line 8 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{cs = stack[--top];goto _again;}}
	goto st57;
tr86:
#line 44 "markup.rl"
	{
		entity.end = p;
		
		Trenni_append_string(&pcdata, encoding, 
			rb_funcall(entities, rb_intern("[]"), 1, Trenni_token(entity, encoding))
		);
	}
#line 8 "/home/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
	{{cs = stack[--top];goto _again;}}
	goto st57;
st57:
	if ( ++p == pe )
		goto _test_eof57;
case 57:
#line 1614 "markup.c"
	goto st0;
st45:
	if ( ++p == pe )
		goto _test_eof45;
case 45:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr82;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto tr82;
	} else
		goto tr82;
	goto tr75;
tr82:
#line 40 "markup.rl"
	{
		entity.begin = p;
	}
	goto st46;
st46:
	if ( ++p == pe )
		goto _test_eof46;
case 46:
#line 1639 "markup.c"
	if ( (*p) == 59 )
		goto tr84;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st46;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st46;
	} else
		goto st46;
	goto tr75;
tr77:
#line 40 "markup.rl"
	{
		entity.begin = p;
	}
	goto st47;
st47:
	if ( ++p == pe )
		goto _test_eof47;
case 47:
#line 1661 "markup.c"
	if ( (*p) == 59 )
		goto tr86;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st47;
	} else if ( (*p) > 90 ) {
		if ( 97 <= (*p) && (*p) <= 122 )
			goto st47;
	} else
		goto st47;
	goto tr75;
	}
	_test_eof48: cs = 48; goto _test_eof; 
	_test_eof49: cs = 49; goto _test_eof; 
	_test_eof50: cs = 50; goto _test_eof; 
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof51: cs = 51; goto _test_eof; 
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
	_test_eof52: cs = 52; goto _test_eof; 
	_test_eof20: cs = 20; goto _test_eof; 
	_test_eof21: cs = 21; goto _test_eof; 
	_test_eof22: cs = 22; goto _test_eof; 
	_test_eof23: cs = 23; goto _test_eof; 
	_test_eof24: cs = 24; goto _test_eof; 
	_test_eof25: cs = 25; goto _test_eof; 
	_test_eof26: cs = 26; goto _test_eof; 
	_test_eof53: cs = 53; goto _test_eof; 
	_test_eof27: cs = 27; goto _test_eof; 
	_test_eof28: cs = 28; goto _test_eof; 
	_test_eof29: cs = 29; goto _test_eof; 
	_test_eof30: cs = 30; goto _test_eof; 
	_test_eof31: cs = 31; goto _test_eof; 
	_test_eof32: cs = 32; goto _test_eof; 
	_test_eof33: cs = 33; goto _test_eof; 
	_test_eof34: cs = 34; goto _test_eof; 
	_test_eof35: cs = 35; goto _test_eof; 
	_test_eof54: cs = 54; goto _test_eof; 
	_test_eof36: cs = 36; goto _test_eof; 
	_test_eof37: cs = 37; goto _test_eof; 
	_test_eof55: cs = 55; goto _test_eof; 
	_test_eof38: cs = 38; goto _test_eof; 
	_test_eof39: cs = 39; goto _test_eof; 
	_test_eof40: cs = 40; goto _test_eof; 
	_test_eof41: cs = 41; goto _test_eof; 
	_test_eof56: cs = 56; goto _test_eof; 
	_test_eof42: cs = 42; goto _test_eof; 
	_test_eof43: cs = 43; goto _test_eof; 
	_test_eof44: cs = 44; goto _test_eof; 
	_test_eof57: cs = 57; goto _test_eof; 
	_test_eof45: cs = 45; goto _test_eof; 
	_test_eof46: cs = 46; goto _test_eof; 
	_test_eof47: cs = 47; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 50: 
#line 22 "markup.rl"
	{
		rb_funcall(delegate, id_text, 1, pcdata);
	}
	break;
	case 42: 
	case 43: 
	case 44: 
	case 45: 
	case 46: 
	case 47: 
#line 36 "markup.rl"
	{
		Trenni_raise_error("could not parse entity", buffer, p-s);
	}
	break;
	case 53: 
#line 72 "markup.rl"
	{
		doctype.end = p;
		
		rb_funcall(delegate, id_doctype, 1, Trenni_token(doctype, encoding));
	}
	break;
	case 26: 
#line 78 "markup.rl"
	{
		Trenni_raise_error("could not parse doctype", buffer, p-s);
	}
	break;
	case 52: 
#line 86 "markup.rl"
	{
		comment.end = p;
		
		rb_funcall(delegate, id_comment, 1, Trenni_token(comment, encoding));
	}
	break;
	case 17: 
	case 18: 
	case 19: 
#line 92 "markup.rl"
	{
		Trenni_raise_error("could not parse comment", buffer, p-s);
	}
	break;
	case 56: 
#line 106 "markup.rl"
	{
		instruction.end = p;
		
		rb_funcall(delegate, id_instruction, 1, Trenni_token(instruction, encoding));
	}
	break;
	case 38: 
	case 39: 
	case 40: 
	case 41: 
#line 112 "markup.rl"
	{
		Trenni_raise_error("could not parse instruction", buffer, p-s);
	}
	break;
	case 51: 
#line 152 "markup.rl"
	{
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}
	break;
	case 55: 
#line 159 "markup.rl"
	{
		rb_funcall(delegate, id_close_tag, 2, Trenni_token(identifier, encoding), ULONG2NUM(identifier.begin-s));
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
	case 12: 
	case 13: 
	case 14: 
	case 36: 
	case 37: 
#line 163 "markup.rl"
	{
		Trenni_raise_error("could not parse tag", buffer, p-s);
	}
	break;
	case 54: 
#line 171 "markup.rl"
	{
		cdata.end = p;
		
		rb_funcall(delegate, id_cdata, 1, Trenni_token(cdata, encoding));
	}
	break;
	case 33: 
	case 34: 
	case 35: 
#line 177 "markup.rl"
	{
		Trenni_raise_error("could not parse cdata", buffer, p-s);
	}
	break;
	case 49: 
#line 30 "markup.rl"
	{
		characters.end = p;
		
		Trenni_append_token(&pcdata, encoding, characters);
	}
#line 22 "markup.rl"
	{
		rb_funcall(delegate, id_text, 1, pcdata);
	}
	break;
#line 1861 "markup.c"
	}
	}

	_out: {}
	}

#line 208 "markup.rl"

	
	if (p != eof) {
		Trenni_raise_error("could not parse all input", buffer, p-s);
	}
	
	return Qnil;
}
