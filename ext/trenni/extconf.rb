# Loads mkmf which is used to make makefiles for Ruby extensions
require 'mkmf'

$CFLAGS << " -O3 -std=c99"

# Needed by Ruby 2.1
have_func("rb_sym2str")
have_func("rb_str_cat_cstr")

gem_name = File.basename(__dir__)
extension_name = 'trenni'

# The destination
dir_config(extension_name)

# Generate the makefile to compile the native binary into `lib`:
create_makefile(File.join(gem_name, extension_name))
