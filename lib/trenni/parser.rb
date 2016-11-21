
require_relative 'parse_error'
require_relative 'parser_delegate'

begin
	require_relative 'native/trenni'
rescue
	require_relative 'fallback/parser'
	
	Trenni::Parser = Trenni::Fallback::Parser
end
