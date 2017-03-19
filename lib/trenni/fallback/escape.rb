
require 'cgi'

module Trenni
	module Markup
		def self.escape_string(string)
			CGI.escape_html(string)
		end
	end
end