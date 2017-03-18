
require 'cgi'

module Trenni
	module Fallback
		def self.escape_html(string)
			CGI.escape_html(string)
		end
	end
end
