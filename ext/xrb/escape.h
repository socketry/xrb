
#pragma once

#include "xrb.h"

void Init_XRB_escape(void);

// Given a string, replace it's class with XRB::MarkupString so that it would be output as is.
VALUE XRB_MarkupString_raw(VALUE self, VALUE string);

// Append any value to the output buffer efficiently, escaping entities as needed.
VALUE XRB_Markup_append_markup(VALUE self, VALUE buffer);

// Escape any entities in the given string. If no entities were found, might return the original string.
VALUE XRB_Markup_escape_string(VALUE self, VALUE string);
