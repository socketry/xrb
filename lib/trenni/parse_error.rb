# frozen_string_literal: true

# Copyright, 2012, by Samuel G. D. Williams. <http://www.codeotaku.com>
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

require_relative 'buffer'

module Trenni
	class ParseError < StandardError
		def initialize(message, buffer, offset)
			super(message)
			
			@buffer = buffer
			@offset = offset
		end
		
		def location
			@location ||= Location.new(@buffer.read, @offset)
		end
		
		attr :buffer
		attr :path
		
		def to_s
			"#{buffer.path}#{location}: #{super}\n#{location.line_text}"
		end
	end
	
	class Location
		def initialize(input, offset)
			raise ArgumentError.new("Offset #{index} is past end of input #{input.bytesize}") if offset > input.bytesize
			
			@offset = offset
			@line_index = 0
			line_offset = next_line_offset = 0
			
			input.each_line do |line|
				line_offset = next_line_offset
				next_line_offset += line.bytesize
				
				# Is our input offset within this line?
				if next_line_offset >= offset
					@line_text = line.chomp
					@line_range = line_offset...next_line_offset
					break
				else
					@line_index += 1
				end
			end
		end
		
		def to_i
			@offset
		end
		
		def to_s
			"[#{self.line_number}:#{self.line_offset}]"
		end
		
		# The line that contains the @offset (base 0 indexing).
		attr :line_index
		
		# The line index, but base-1.
		def line_number
			@line_index + 1
		end
		
		# The byte offset to the start of that line.
		attr :line_range
		
		# The number of bytes from the start of the line to the given offset in the input.
		def line_offset
			@offset - @line_range.min
		end
		
		attr :line_text
	end
end
