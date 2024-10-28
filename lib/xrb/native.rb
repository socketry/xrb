# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

require_relative "error"

# Methods on the following classes may be replaced by native implementations:
require_relative "tag"

begin
	require "XRB_Extension"
rescue LoadError => error
	warn "Could not load native parsers: #{error}"
end unless ENV["XRB_PREFER_FALLBACK"]
