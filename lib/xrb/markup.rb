# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

require 'cgi'

module XRB
	# A wrapper which indicates that `value` can be appended to the output buffer without any changes.
	module Markup
		def self.raw(string)
			MarkupString.raw(string)
		end
		
		def self.append(output, value)
			value.append_markup(output)
		end
		
		def append_markup(output)
			output << ::CGI.escape_html(self.to_s)
		end
		
		def build_markup(builder)
			append_markup(builder.output)
		end
	end
	
	::Object.prepend(Markup)
	
	# Initialized from text which is escaped to use HTML entities.
	class MarkupString < String
		# @param string [String] the string value itself.
		# @param escape [Boolean] whether or not to escape the string.
		def initialize(string = nil, escape = true)
			if string
				if escape
					string = ::CGI.escape_html(string)
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
		
		def append_markup(output)
			output << self
		end
	end
	
	module Script
		def self.json(value)
			MarkupString.new(JSON.dump(value), false)
		end
	end
end
