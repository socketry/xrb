
#line 1 "lexer.rl"

#include <lexer.h>

#include <ruby/encoding.h>

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

static void Trenni_Parser_append_token(VALUE * buffer, rb_encoding * encoding, Token token) {
	if (*buffer == Qnil) {
		// Allocate a buffer exactly the right size:
		*buffer = rb_enc_str_new(token.begin, token.end - token.begin, encoding);
	} else {
		// Append the characters to the existing buffer:
		rb_str_buf_cat(*buffer, token.begin, token.end - token.begin);
	}
}

static void Trenni_Parser_append_string(VALUE * buffer, rb_encoding * encoding, const char * string) {
	if (*buffer == Qnil) {
		*buffer = rb_enc_str_new_cstr(string, encoding);
	} else {
		rb_str_buf_cat2(*buffer, string);
	}
}

static void Trenni_Parser_append_codepoint(VALUE * buffer, rb_encoding * encoding, unsigned long codepoint) {
	if (*buffer == Qnil) {
		*buffer = rb_enc_str_new("", 0, encoding);
	}
	
	rb_str_concat(*buffer, ULONG2NUM(codepoint));
}

#define entity_codepoint(number) Trenni_Parser_append_codepoint(&pcdata, encoding, number)


#line 51 "lexer.c"
static const char _trenni_lexer_actions[] = {
	0, 1, 0, 1, 1, 1, 2, 1, 
	3, 1, 4, 1, 5, 1, 6, 1, 
	7, 1, 8, 1, 9, 1, 11, 1, 
	12, 1, 14, 1, 15, 1, 17, 1, 
	18, 1, 19, 1, 22, 1, 27, 1, 
	29, 1, 30, 1, 32, 1, 33, 1, 
	36, 1, 37, 2, 1, 20, 2, 1, 
	26, 2, 2, 4, 2, 3, 35, 2, 
	5, 3, 2, 5, 4, 2, 6, 30, 
	2, 23, 0, 2, 24, 26, 2, 25, 
	26, 2, 34, 2, 2, 36, 3, 2, 
	36, 4, 2, 37, 3, 2, 37, 4, 
	3, 1, 20, 22, 3, 1, 26, 22, 
	3, 5, 3, 35, 3, 11, 34, 2, 
	3, 14, 34, 2, 3, 18, 34, 2, 
	3, 24, 26, 22, 3, 25, 26, 22, 
	3, 27, 34, 2, 3, 29, 34, 2, 
	3, 32, 34, 2, 3, 34, 2, 4, 
	3, 36, 3, 35, 3, 37, 3, 35, 
	4, 11, 34, 2, 4, 4, 14, 34, 
	2, 4, 4, 18, 34, 2, 4, 4, 
	27, 34, 2, 4, 4, 29, 34, 2, 
	4, 4, 32, 34, 2, 4, 6, 21, 
	28, 16, 13, 10, 31, 7, 11, 21, 
	28, 16, 13, 10, 31, 7, 14, 21, 
	28, 16, 13, 10, 31, 7, 18, 21, 
	28, 16, 13, 10, 31, 7, 27, 21, 
	28, 16, 13, 10, 31, 7, 29, 21, 
	28, 16, 13, 10, 31, 7, 32, 21, 
	28, 16, 13, 10, 31, 8, 3, 35, 
	21, 28, 16, 13, 10, 31, 9, 5, 
	3, 35, 21, 28, 16, 13, 10, 31, 
	9, 36, 3, 35, 21, 28, 16, 13, 
	10, 31, 9, 37, 3, 35, 21, 28, 
	16, 13, 10, 31
};

static const unsigned char _trenni_lexer_key_offsets[] = {
	0, 0, 3, 6, 9, 21, 37, 53, 
	70, 71, 72, 75, 78, 83, 86, 89, 
	92, 95, 101, 108, 109, 110, 111, 114, 
	115, 116, 117, 118, 121, 126, 129, 130, 
	131, 132, 134, 135, 136, 137, 138, 139, 
	140, 141, 142, 143, 144, 145, 146, 147, 
	148, 149, 151, 161, 172, 182, 197, 201, 
	202, 204, 210, 217, 218, 219, 220, 221, 
	222, 223, 224, 226, 228, 230, 232, 234, 
	236, 238, 240, 242, 244
};

static const char _trenni_lexer_trans_keys[] = {
	35, 97, 113, 120, 48, 57, 59, 48, 
	57, 33, 47, 63, 96, 0, 44, 59, 
	64, 91, 94, 123, 127, 32, 47, 62, 
	96, 0, 8, 9, 13, 14, 44, 59, 
	64, 91, 94, 123, 127, 32, 47, 62, 
	96, 0, 8, 9, 13, 14, 44, 59, 
	64, 91, 94, 123, 127, 32, 47, 61, 
	62, 96, 0, 8, 9, 13, 14, 44, 
	59, 64, 91, 94, 123, 127, 62, 34, 
	34, 38, 60, 34, 38, 60, 32, 47, 
	62, 9, 13, 35, 97, 113, 120, 48, 
	57, 59, 48, 57, 34, 38, 60, 48, 
	57, 65, 70, 97, 102, 59, 48, 57, 
	65, 70, 97, 102, 109, 112, 59, 34, 
	38, 60, 117, 111, 116, 59, 34, 38, 
	60, 32, 47, 62, 9, 13, 45, 68, 
	91, 45, 45, 45, 45, 62, 79, 67, 
	84, 89, 80, 69, 62, 67, 68, 65, 
	84, 65, 91, 93, 93, 62, 93, 47, 
	96, 0, 44, 59, 64, 91, 94, 123, 
	127, 47, 62, 96, 0, 44, 59, 64, 
	91, 94, 123, 127, 47, 96, 0, 44, 
	59, 64, 91, 94, 123, 127, 32, 47, 
	96, 0, 8, 9, 13, 14, 44, 59, 
	64, 91, 94, 123, 127, 32, 63, 9, 
	13, 63, 62, 63, 48, 57, 65, 70, 
	97, 102, 59, 48, 57, 65, 70, 97, 
	102, 109, 112, 59, 117, 111, 116, 59, 
	38, 60, 38, 60, 38, 60, 38, 60, 
	38, 60, 38, 60, 38, 60, 38, 60, 
	38, 60, 38, 60, 38, 60, 0
};

static const char _trenni_lexer_single_lengths[] = {
	0, 3, 1, 1, 4, 4, 4, 5, 
	1, 1, 3, 3, 3, 3, 1, 1, 
	3, 0, 1, 1, 1, 1, 3, 1, 
	1, 1, 1, 3, 3, 3, 1, 1, 
	1, 2, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 2, 2, 3, 2, 3, 2, 1, 
	2, 0, 1, 1, 1, 1, 1, 1, 
	1, 1, 2, 2, 2, 2, 2, 2, 
	2, 2, 2, 2, 2
};

static const char _trenni_lexer_range_lengths[] = {
	0, 0, 1, 1, 4, 6, 6, 6, 
	0, 0, 0, 0, 1, 0, 1, 1, 
	0, 3, 3, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 1, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 4, 4, 4, 6, 1, 0, 
	0, 3, 3, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0
};

static const short _trenni_lexer_index_offsets[] = {
	0, 0, 4, 7, 10, 19, 30, 41, 
	53, 55, 57, 61, 65, 70, 74, 77, 
	80, 84, 88, 93, 95, 97, 99, 103, 
	105, 107, 109, 111, 115, 120, 124, 126, 
	128, 130, 133, 135, 137, 139, 141, 143, 
	145, 147, 149, 151, 153, 155, 157, 159, 
	161, 163, 166, 173, 181, 188, 198, 202, 
	204, 207, 211, 216, 218, 220, 222, 224, 
	226, 228, 230, 233, 236, 239, 242, 245, 
	248, 251, 254, 257, 260
};

static const unsigned char _trenni_lexer_indicies[] = {
	1, 2, 3, 0, 5, 4, 0, 7, 
	6, 0, 10, 11, 12, 9, 9, 9, 
	9, 9, 8, 14, 15, 16, 9, 9, 
	14, 9, 9, 9, 9, 13, 18, 19, 
	20, 9, 9, 18, 9, 9, 9, 9, 
	17, 22, 23, 24, 25, 9, 9, 22, 
	9, 9, 9, 9, 21, 20, 9, 26, 
	9, 28, 29, 9, 27, 31, 32, 9, 
	30, 33, 34, 35, 33, 9, 37, 38, 
	39, 36, 41, 40, 36, 43, 42, 36, 
	45, 46, 9, 44, 47, 47, 47, 36, 
	49, 48, 48, 48, 36, 50, 36, 51, 
	36, 52, 36, 54, 55, 9, 53, 56, 
	36, 57, 36, 58, 36, 59, 36, 61, 
	62, 9, 60, 63, 64, 65, 63, 9, 
	66, 68, 69, 67, 70, 67, 71, 70, 
	72, 70, 72, 73, 70, 74, 67, 75, 
	67, 76, 67, 77, 67, 78, 67, 79, 
	67, 80, 79, 81, 67, 82, 67, 83, 
	67, 84, 67, 85, 67, 86, 67, 87, 
	86, 88, 86, 89, 88, 86, 9, 9, 
	9, 9, 9, 9, 90, 9, 92, 9, 
	9, 9, 9, 9, 91, 94, 94, 94, 
	94, 94, 94, 93, 96, 94, 94, 94, 
	96, 94, 94, 94, 94, 95, 98, 99, 
	98, 97, 101, 100, 102, 101, 100, 103, 
	103, 103, 0, 105, 104, 104, 104, 0, 
	106, 0, 107, 0, 108, 0, 109, 0, 
	110, 0, 111, 0, 112, 0, 114, 115, 
	113, 117, 118, 116, 120, 121, 119, 123, 
	124, 122, 126, 127, 125, 129, 130, 128, 
	132, 133, 131, 135, 136, 134, 138, 139, 
	137, 141, 142, 140, 144, 145, 143, 0
};

static const char _trenni_lexer_trans_targs[] = {
	0, 2, 59, 62, 3, 57, 3, 68, 
	5, 0, 29, 50, 52, 5, 6, 8, 
	69, 7, 6, 8, 69, 7, 6, 8, 
	9, 69, 10, 11, 28, 13, 11, 12, 
	13, 6, 8, 69, 0, 14, 19, 23, 
	15, 17, 15, 16, 11, 12, 13, 18, 
	18, 16, 20, 21, 22, 11, 12, 13, 
	24, 25, 26, 27, 11, 12, 13, 6, 
	8, 69, 30, 0, 34, 41, 31, 32, 
	33, 70, 35, 36, 37, 38, 39, 40, 
	71, 42, 43, 44, 45, 46, 47, 48, 
	49, 72, 51, 51, 73, 53, 0, 53, 
	54, 55, 54, 56, 55, 56, 74, 58, 
	58, 68, 60, 61, 75, 63, 64, 65, 
	76, 67, 1, 4, 67, 1, 4, 67, 
	1, 4, 67, 1, 4, 67, 1, 4, 
	67, 1, 4, 67, 1, 4, 67, 1, 
	4, 67, 1, 4, 67, 1, 4, 67, 
	1, 4
};

static const short _trenni_lexer_trans_actions[] = {
	13, 0, 0, 0, 15, 0, 0, 19, 
	1, 41, 0, 0, 0, 0, 51, 96, 
	51, 72, 0, 35, 0, 0, 54, 100, 
	3, 54, 0, 57, 0, 5, 66, 63, 
	11, 75, 120, 75, 69, 0, 0, 0, 
	15, 0, 0, 19, 9, 7, 0, 15, 
	0, 17, 0, 0, 0, 87, 84, 47, 
	0, 0, 0, 0, 93, 90, 49, 78, 
	124, 78, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 1, 0, 3, 1, 33, 0, 
	3, 29, 29, 29, 0, 0, 0, 15, 
	0, 17, 0, 0, 0, 0, 0, 0, 
	0, 140, 81, 182, 66, 11, 246, 9, 
	0, 237, 167, 128, 213, 157, 112, 197, 
	152, 108, 189, 177, 136, 229, 172, 132, 
	221, 162, 116, 205, 87, 47, 256, 93, 
	49, 266
};

static const short _trenni_lexer_eof_actions[] = {
	0, 13, 13, 13, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 69, 69, 69, 
	41, 69, 69, 69, 69, 69, 41, 69, 
	69, 69, 69, 41, 41, 0, 0, 27, 
	27, 27, 0, 0, 0, 0, 0, 0, 
	23, 0, 0, 0, 0, 0, 0, 45, 
	45, 45, 41, 41, 33, 33, 33, 33, 
	33, 13, 13, 13, 13, 13, 13, 13, 
	13, 13, 0, 104, 60, 37, 25, 21, 
	43, 39, 31, 144, 148
};

static const int trenni_lexer_start = 66;
static const int trenni_lexer_first_final = 66;
static const int trenni_lexer_error = 0;

static const int trenni_lexer_en_main = 66;


#line 224 "lexer.rl"


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
	const char * ts = 0;
	const char * te = 0;
	
	unsigned long cs, act;
	unsigned long top;
	unsigned long stack[2] = {0};
	
	Token identifier, cdata, characters, entity, doctype, comment, instruction_text;
	unsigned self_closing = 0, has_value = 0;
	
	
#line 310 "lexer.c"
	{
	cs = trenni_lexer_start;
	}

#line 315 "lexer.c"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
	if ( cs == 0 )
		goto _out;
_resume:
	_keys = _trenni_lexer_trans_keys + _trenni_lexer_key_offsets[cs];
	_trans = _trenni_lexer_index_offsets[cs];

	_klen = _trenni_lexer_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (unsigned int)(_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _trenni_lexer_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += (unsigned int)((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
	_trans = _trenni_lexer_indicies[_trans];
	cs = _trenni_lexer_trans_targs[_trans];

	if ( _trenni_lexer_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _trenni_lexer_actions + _trenni_lexer_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 0:
#line 51 "lexer.rl"
	{ identifier.begin = p; }
	break;
	case 1:
#line 52 "lexer.rl"
	{ identifier.end = p; }
	break;
	case 2:
#line 54 "lexer.rl"
	{
		pcdata = Qnil;
	}
	break;
	case 3:
#line 58 "lexer.rl"
	{
		// Buffer is ready.
	}
	break;
	case 4:
#line 62 "lexer.rl"
	{
		characters.begin = p;
	}
	break;
	case 5:
#line 66 "lexer.rl"
	{
		characters.end = p;
		
		Trenni_Parser_append_token(&pcdata, encoding, characters);
	}
	break;
	case 6:
#line 72 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse entity", buffer, p-s);
	}
	break;
	case 7:
#line 76 "lexer.rl"
	{
		entity.begin = p;
	}
	break;
	case 8:
#line 84 "lexer.rl"
	{
		entity.end = p;
		
		char * end = entity.end;
		unsigned long codepoint = strtoul(entity.begin, &end, 16);
		
		Trenni_Parser_append_codepoint(&pcdata, encoding, codepoint);
	}
	break;
	case 9:
#line 93 "lexer.rl"
	{
		entity.end = p;
		
		char * end = entity.end;
		unsigned long codepoint = strtoul(entity.begin, &end, 10);
		
		Trenni_Parser_append_codepoint(&pcdata, encoding, codepoint);
	}
	break;
	case 10:
#line 102 "lexer.rl"
	{
		doctype.begin = p;
	}
	break;
	case 11:
#line 106 "lexer.rl"
	{
		doctype.end = p;
		
		rb_funcall(delegate, id_doctype, 1, Trenni_token(doctype));
	}
	break;
	case 13:
#line 116 "lexer.rl"
	{
		comment.begin = p;
	}
	break;
	case 14:
#line 120 "lexer.rl"
	{
		comment.end = p;
		
		rb_funcall(delegate, id_comment, 1, Trenni_token(comment));
	}
	break;
	case 16:
#line 130 "lexer.rl"
	{
	}
	break;
	case 17:
#line 133 "lexer.rl"
	{
		instruction_text.begin = p;
	}
	break;
	case 18:
#line 137 "lexer.rl"
	{
		instruction_text.end = p-2;
		
		rb_funcall(delegate, id_instruction, 2, Trenni_token(identifier), Trenni_token(instruction_text));
	}
	break;
	case 19:
#line 143 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse instruction", buffer, p-s);
	}
	break;
	case 20:
#line 147 "lexer.rl"
	{
		// Reset self-closing state - we don't know yet.
		self_closing = 0;
		
		rb_funcall(delegate, id_open_tag_begin, 1, Trenni_token(identifier));
	}
	break;
	case 21:
#line 154 "lexer.rl"
	{
	}
	break;
	case 22:
#line 157 "lexer.rl"
	{
		self_closing = 1;
	}
	break;
	case 23:
#line 161 "lexer.rl"
	{
		has_value = 0;
	}
	break;
	case 24:
#line 165 "lexer.rl"
	{
		has_value = 1;
	}
	break;
	case 25:
#line 169 "lexer.rl"
	{
		has_value = 2;
	}
	break;
	case 26:
#line 173 "lexer.rl"
	{
		if (has_value == 1) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), pcdata);
		} else if (has_value == 2) {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), empty_string);
		} else {
			rb_funcall(delegate, id_attribute, 2, Trenni_token(identifier), Qtrue);
		}
	}
	break;
	case 27:
#line 183 "lexer.rl"
	{
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}
	break;
	case 28:
#line 187 "lexer.rl"
	{
	}
	break;
	case 29:
#line 190 "lexer.rl"
	{
		rb_funcall(delegate, id_close_tag, 1, Trenni_token(identifier));
	}
	break;
	case 30:
#line 194 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse tag", buffer, p-s);
	}
	break;
	case 31:
#line 198 "lexer.rl"
	{
		cdata.begin = p;
	}
	break;
	case 32:
#line 202 "lexer.rl"
	{
		cdata.end = p;
		
		rb_funcall(delegate, id_cdata, 1, Trenni_token(cdata));
	}
	break;
	case 34:
#line 212 "lexer.rl"
	{
	
	}
	break;
	case 35:
#line 216 "lexer.rl"
	{
		// Entities are handled separately:
		rb_funcall(delegate, id_text, 1, pcdata);
	}
	break;
	case 36:
#line 5 "entities.rl"
	{entity_codepoint(38);}
	break;
	case 37:
#line 6 "entities.rl"
	{entity_codepoint(34);}
	break;
#line 618 "lexer.c"
		}
	}

_again:
	if ( cs == 0 )
		goto _out;
	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	if ( p == eof )
	{
	const char *__acts = _trenni_lexer_actions + _trenni_lexer_eof_actions[cs];
	unsigned int __nacts = (unsigned int) *__acts++;
	while ( __nacts-- > 0 ) {
		switch ( *__acts++ ) {
	case 3:
#line 58 "lexer.rl"
	{
		// Buffer is ready.
	}
	break;
	case 5:
#line 66 "lexer.rl"
	{
		characters.end = p;
		
		Trenni_Parser_append_token(&pcdata, encoding, characters);
	}
	break;
	case 6:
#line 72 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse entity", buffer, p-s);
	}
	break;
	case 11:
#line 106 "lexer.rl"
	{
		doctype.end = p;
		
		rb_funcall(delegate, id_doctype, 1, Trenni_token(doctype));
	}
	break;
	case 12:
#line 112 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse doctype", buffer, p-s);
	}
	break;
	case 14:
#line 120 "lexer.rl"
	{
		comment.end = p;
		
		rb_funcall(delegate, id_comment, 1, Trenni_token(comment));
	}
	break;
	case 15:
#line 126 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse comment", buffer, p-s);
	}
	break;
	case 18:
#line 137 "lexer.rl"
	{
		instruction_text.end = p-2;
		
		rb_funcall(delegate, id_instruction, 2, Trenni_token(identifier), Trenni_token(instruction_text));
	}
	break;
	case 19:
#line 143 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse instruction", buffer, p-s);
	}
	break;
	case 27:
#line 183 "lexer.rl"
	{
		rb_funcall(delegate, id_open_tag_end, 1, self_closing == 1 ? Qtrue : Qfalse);
	}
	break;
	case 29:
#line 190 "lexer.rl"
	{
		rb_funcall(delegate, id_close_tag, 1, Trenni_token(identifier));
	}
	break;
	case 30:
#line 194 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse tag", buffer, p-s);
	}
	break;
	case 32:
#line 202 "lexer.rl"
	{
		cdata.end = p;
		
		rb_funcall(delegate, id_cdata, 1, Trenni_token(cdata));
	}
	break;
	case 33:
#line 208 "lexer.rl"
	{
		Trenni_Parser_parse_error("could not parse cdata", buffer, p-s);
	}
	break;
	case 35:
#line 216 "lexer.rl"
	{
		// Entities are handled separately:
		rb_funcall(delegate, id_text, 1, pcdata);
	}
	break;
	case 36:
#line 5 "entities.rl"
	{entity_codepoint(38);}
	break;
	case 37:
#line 6 "entities.rl"
	{entity_codepoint(34);}
	break;
#line 743 "lexer.c"
		}
	}
	}

	_out: {}
	}

#line 259 "lexer.rl"

	
	if (p != eof) {
		Trenni_Parser_parse_error("could not parse all input", buffer, p-s);
	}
}
