# frozen_string_literal: true

# Copyright, 2016, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

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
			if value.is_a? Markup
				buffer << value
			elsif value
				buffer << self.escape_string(value.to_s)
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
	end
	
	module Script
		def self.json(value)
			MarkupString.new(JSON.dump(value), false)
		end
	end
end
