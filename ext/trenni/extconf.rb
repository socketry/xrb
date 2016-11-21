# Loads mkmf which is used to make makefiles for Ruby extensions
require 'mkmf'

$CFLAGS += " -O3 "

# Give it a name
extension_name = 'trenni'

# The destination
dir_config(extension_name)

# Do the work
create_makefile(extension_name)
