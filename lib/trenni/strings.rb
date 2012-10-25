
module Trenni
	module Strings
		HTML_ESCAPE = {"&" => "&amp;", "<" => "&lt;", ">" => "&gt;", "\"" => "&quot;"}
		HTML_ESCAPE_PATTERN = Regexp.new("[" + Regexp.quote(HTML_ESCAPE.keys.join) + "]")

		def self.to_html(string)
			string.gsub(HTML_ESCAPE_PATTERN){|c| HTML_ESCAPE[c]}
		end

		def self.to_quoted_string(string)
			'"' + string.gsub('"', '\\"').gsub(/\r/, "\\r").gsub(/\n/, "\\n") + '"'
		end
		
		# `value` must already be escaped.
		def self.to_attribute(key, value)
			%Q{#{key}="#{value}"}
		end
		
		def self.to_simple_attribute(key, strict)
			strict ? %Q{#{key}="#{key}"} : key.to_s
		end
		
		def self.to_title(string)
			string.gsub(/(^|[ \-_])(.)/){" " + $2.upcase}.strip
		end

		def self.to_snake(string)
			string.gsub("::", "").gsub(/([A-Z]+)/){"_" + $1.downcase}.sub(/^_+/, "")
		end
	end
end