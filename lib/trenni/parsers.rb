
require_relative 'native'
require_relative 'parse_delegate'

if defined? Trenni::Native and !ENV['TRENNI_PREFER_FALLBACK']
	Trenni::Parsers = Trenni::Native
else
	require_relative 'fallback/markup'
	require_relative 'fallback/template'
	require_relative 'fallback/escape'
	
	Trenni::Parsers = Trenni::Fallback
end
