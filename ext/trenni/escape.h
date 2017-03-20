
#pragma once

#include "trenni.h"

void Init_trenni_escape();

VALUE Trenni_Markup_escape(VALUE self, VALUE value);

VALUE Trenni_Markup_append_string(VALUE self, VALUE buffer, VALUE string);
VALUE Trenni_Markup_escape_string(VALUE self, VALUE string);
