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

module Trenni
	# A wrapper which indicates that `value` can be appended to the output buffer without any changes.
	module Markup
		# Generates a string suitable for concatenating with the output buffer.
		def self.escape(value)
			if value.is_a? Markup
				value
			elsif value
				MarkupString.new(value.to_s)
			else
				# String#<< won't accept nil, so we return an empty string, thus ensuring a fixed point function:
				EMPTY
			end
		end
		
		def escape(value)
			Markup.escape(value)
		end
	end
	
	class RawString < String
		include Markup
	end
	
	class MarkupString < String
		include Markup
		
		# This is only casually related to HTML, it's just enough so that it would not be mis-interpreted by `Trenni::Parser`.
		ESCAPE = {"&" => "&amp;", "<" => "&lt;", ">" => "&gt;", "\"" => "&quot;"}
		ESCAPE_PATTERN = Regexp.new("[" + Regexp.quote(ESCAPE.keys.join) + "]")
		
		def initialize(string)
			super
			
			gsub!(ESCAPE_PATTERN){|c| ESCAPE[c]}
		end
	end
	
	def self.MarkupString(value)
		Markup.escape(value)
	end
	
	Markup::EMPTY = RawString.new.freeze
end
