
#pragma once

#include "trenni.h"

void Init_trenni_tag();

VALUE Trenni_Tag_split(VALUE self, VALUE name);

VALUE Trenni_Tag_append_attributes(VALUE self, VALUE buffer, VALUE attributes, VALUE prefix);
VALUE Trenni_Tag_append_tag(VALUE self, VALUE buffer, VALUE name, VALUE attributes, VALUE content);
VALUE Trenni_Tag_format_tag(VALUE self, VALUE name, VALUE attributes, VALUE content);

VALUE Trenni_Tag_write_opening_tag(VALUE self, VALUE buffer);
VALUE Trenni_Tag_write_closing_tag(VALUE self, VALUE buffer);
