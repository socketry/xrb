# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

require_relative 'buffer'

module XRB
	class Error < StandardError
	end
	
	class ParseError < Error
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
