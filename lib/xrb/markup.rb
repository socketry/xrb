# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

require 'cgi'

module XRB
	# A wrapper which indicates that `value` can be appended to the output buffer without any changes.
	module Markup
		# Converts special characters `<`, `>`, `&`, and `"` into their equivalent entities.
		# @return [String] May return the original string if no changes were made.
		def self.escape_string(string)
			CGI.escape_html(string)
		end
		
		# Appends a string to the output buffer, escaping if if necessary.
		def self.append(buffer, value)
			value = value.to_s
			
			if value.is_a? Markup
				buffer << value
			elsif value
				buffer << self.escape_string(value)
			end
		end
	end
	
	# Initialized from text which is escaped to use HTML entities.
	class MarkupString < String
		include Markup
		
		# @param string [String] the string value itself.
		# @param escape [Boolean] whether or not to escape the string.
		def initialize(string = nil, escape = true)
			if string
				if escape
					string = Markup.escape_string(string)
				end
				
				super(string)
			else
				super()
			end
		end
		
		# Generate a valid MarkupString withot any escaping.
		def self.raw(string)
			self.new(string, false)
		end
		
		# This "string" is already escaped, thus it is safe to append to the output buffer.
		# This predicate is used by Rails' `ActionView::OutputBuffer` to determine if the string should be escaped or not.
		def html_safe?
			true
		end
	end
	
	module Script
		def self.json(value)
			MarkupString.new(JSON.dump(value), false)
		end
	end
end
