# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

return if RUBY_DESCRIPTION =~ /jruby/

require "mkmf"

$CFLAGS << " -O3 -Wall -Wno-unknown-pragmas -std=c99"

have_func("rb_sym2str")
have_func("rb_str_cat_cstr")

$srcs = Dir.glob("xrb/*.c")
$VPATH << "$(srcdir)/xrb"

create_header

create_makefile("XRB_Extension")
