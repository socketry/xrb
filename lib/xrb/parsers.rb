# frozen_string_literal: true

require_relative 'native'
require_relative 'parse_delegate'

if defined? XRB::Native
	XRB::Parsers = XRB::Native
else
	require_relative 'fallback/markup'
	require_relative 'fallback/template'
	require_relative 'fallback/query'
	
	XRB::Parsers = XRB::Fallback
end
