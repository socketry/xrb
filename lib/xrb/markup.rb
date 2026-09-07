# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

require "cgi"

module XRB
	# Provides the default markup rendering protocol, escaping object string representations.
	module Markup
		# Wrap a string as markup without escaping it.
		# @parameter string [String] The already-safe markup string.
		# @returns [MarkupString] The unescaped markup string.
		def self.raw(string)
			MarkupString.raw(string)
		end
		
		# Append a value to an output buffer using its markup representation.
		# @parameter output [Interface(:<<)] The output buffer.
		# @parameter value [Interface(:append_markup)] The value to append.
		# @returns [Object] The result of appending the value.
		def self.append(output, value)
			value.append_markup(output)
		end
		
		# Append the escaped string representation of the receiver to an output buffer.
		# @parameter output [Interface(:<<)] The output buffer.
		# @returns [Object] The output buffer.
		def append_markup(output)
			output << ::CGI.escape_html(self.to_s)
		end
		
		# Append the escaped string representation of the receiver using a builder.
		# @parameter builder [Builder] The builder receiving the escaped markup.
		# @returns [Object] The builder's output buffer.
		def build_markup(builder)
			append_markup(builder.output)
		end
	end
	
	::Object.prepend(Markup)
	
	# Initialized from text which is escaped to use HTML entities.
	class MarkupString < String
		# @parameter string [String | Nil] The string value itself.
		# @parameter escape [Boolean] Whether to escape the string.
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
		
		# Append this already-safe markup string to an output buffer.
		# @parameter output [Interface(:<<)] The output buffer.
		# @returns [Object] The output buffer.
		def append_markup(output)
			output << self
		end
	end
	
	# Helpers for constructing script-compatible markup values.
	module Script
		# Serialize a value as raw JSON markup without HTML escaping it.
		# @parameter value [Object] The value to serialize.
		# @returns [MarkupString] The serialized JSON markup.
		def self.json(value)
			MarkupString.new(JSON.dump(value), false)
		end
	end
end
