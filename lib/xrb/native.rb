# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

require_relative 'error'

# Methods on the following classes may be replaced by native implementations:
require_relative 'tag'

begin
	# Load native code:
	require 'xrb/xrb'
rescue LoadError
	warn "Could not load native implementation: #{$!}" if $VERBOSE
end unless ENV['TRENNI_PREFER_FALLBACK']
