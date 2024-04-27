# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2012-2024, by Samuel Williams.

require_relative 'native'

if defined? XRB::Native
	XRB::Parsers = XRB::Native
else
	require_relative 'fallback/markup'
	require_relative 'fallback/template'
	require_relative 'fallback/query'
	
	XRB::Parsers = XRB::Fallback
end
