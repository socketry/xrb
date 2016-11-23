
require_relative 'parse_error'
require_relative 'parser_delegate'

begin
	require_relative 'native/trenni'
	
	Trenni::Parsers = Trenni::Native
rescue LoadError
	require_relative 'fallback/markup'
	require_relative 'fallback/template'
	
	Trenni::Parsers = Trenni::Fallback
end
