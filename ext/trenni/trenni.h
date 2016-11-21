
#pragma once

#include "ruby.h"

extern VALUE rb_Trenni, rb_Trenni_Parser, rb_Trenni_ParseError;

extern ID id_cdata, id_open_tag_begin, id_open_tag_end, id_attribute, id_close_tag, id_text, id_doctype, id_comment, id_instruction, id_read;

typedef struct {
	VALUE buffer;
	VALUE delegate;
} Trenni_Parser;
