# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2012-2024, by Samuel Williams.

module XRB
	module Strings
		HTML_ESCAPE = {"&" => "&amp;", "<" => "&lt;", ">" => "&gt;", "\"" => "&quot;"}
		HTML_ESCAPE_PATTERN = Regexp.new("[" + Regexp.quote(HTML_ESCAPE.keys.join) + "]")

		def self.to_html(string)
			string.gsub(HTML_ESCAPE_PATTERN){|c| HTML_ESCAPE[c]}
		end

		def self.to_quoted_string(string)
			string = string.gsub('"', '\\"')
			string.gsub!(/\r/, "\\r")
			string.gsub!(/\n/, "\\n")
			
			return "\"#{string}\""
		end
		
		# `value` must already be escaped.
		def self.to_attribute(key, value)
			%Q{#{key}="#{value}"}
		end
		
		def self.to_simple_attribute(key, strict)
			strict ? %Q{#{key}="#{key}"} : key.to_s
		end
		
		def self.to_title(string)
			string = string.gsub(/(^|[ \-_])(.)/){" " + $2.upcase}
			string.strip!
			
			return string
		end
		
		def self.to_snake(string)
			string = string.gsub("::", "")
			string.gsub!(/([A-Z]+)/){"_" + $1.downcase}
			string.sub!(/^_+/, "")
			
			return string
		end
	end
end
