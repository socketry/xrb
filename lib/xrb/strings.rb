# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2012-2024, by Samuel Williams.

module XRB
	# String transformation helpers used when generating markup and identifiers.
	module Strings
		HTML_ESCAPE = {"&" => "&amp;", "<" => "&lt;", ">" => "&gt;", "\"" => "&quot;"}
		HTML_ESCAPE_PATTERN = Regexp.new("[" + Regexp.quote(HTML_ESCAPE.keys.join) + "]")
		
		# Escape HTML-sensitive characters in a string.
		# @parameter string [String] The string to escape.
		# @returns [String] The HTML-escaped string.
		def self.to_html(string)
			string.gsub(HTML_ESCAPE_PATTERN){|c| HTML_ESCAPE[c]}
		end
		
		# Quote a string and escape quotes and line breaks within it.
		# @parameter string [String] The string to quote.
		# @returns [String] The quoted string.
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
		
		# Format a boolean-style attribute.
		# @parameter key [String | Symbol] The attribute name.
		# @parameter strict [Boolean] Whether to include an explicit attribute value.
		# @returns [String] The formatted attribute.
		def self.to_simple_attribute(key, strict)
			strict ? %Q{#{key}="#{key}"} : key.to_s
		end
		
		# Convert a separated identifier to a human-readable title.
		# @parameter string [String] The identifier to transform.
		# @returns [String] The title-cased string.
		def self.to_title(string)
			string = string.gsub(/(^|[ \-_])(.)/){" " + $2.upcase}
			string.strip!
			
			return string
		end
		
		# Convert a constant-like name to a snake-case identifier.
		# @parameter string [String] The name to transform.
		# @returns [String] The snake-case identifier.
		def self.to_snake(string)
			string = string.gsub("::", "")
			string.gsub!(/([A-Z]+)/){"_" + $1.downcase}
			string.sub!(/^_+/, "")
			
			return string
		end
	end
end
