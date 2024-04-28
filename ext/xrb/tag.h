
#pragma once

#include "xrb.h"

void Init_XRB_Tag(void);

// Split a qualified name `namespace:name` into it's components. Return `[nil, name]` if no namespace is present.
// Usage: namespace, name = XRB::Tag.split(qualified_name)
VALUE XRB_Tag_split(VALUE self, VALUE name);

// Append attributes to the buffer, e.g. {data: {id: 10}} => ' data-id="10"'
VALUE XRB_Tag_append_attributes(VALUE self, VALUE buffer, VALUE attributes, VALUE prefix);
// Append a full tag with content to the buffer.
VALUE XRB_Tag_append_tag(VALUE self, VALUE buffer, VALUE name, VALUE attributes, VALUE content);
// Same as append but returns the result. Slightly less efficient.
VALUE XRB_Tag_format_tag(VALUE self, VALUE name, VALUE attributes, VALUE content);

// Improve performance of XRB::Tag#write_opening_tag and #write_closing_tag
VALUE XRB_Tag_write_opening_tag(VALUE self, VALUE buffer);
VALUE XRB_Tag_write_closing_tag(VALUE self, VALUE buffer);
