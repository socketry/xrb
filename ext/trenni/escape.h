
#pragma once

#include "trenni.h"

void Init_trenni_escape();

VALUE Trenni_MarkupString_raw(VALUE self, VALUE string);

VALUE Trenni_Markup_append(VALUE self, VALUE buffer, VALUE value);
VALUE Trenni_Markup_escape_string(VALUE self, VALUE string);
