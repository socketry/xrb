# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

require_relative "buffer"

module XRB
	# The base class for XRB errors.
	class Error < StandardError
	end
	
	# Raised when an XRB parser encounters invalid input.
	class ParseError < Error
		# Initialize a parse error at a specific byte offset within a buffer.
		# @parameter message [String] The error message.
		# @parameter buffer [Buffer] The input buffer being parsed.
		# @parameter offset [Integer] The byte offset where parsing failed.
		def initialize(message, buffer, offset)
			super(message)
			
			@buffer = buffer
			@offset = offset
		end
		
		# Compute the location of the parse error within the input buffer.
		# @returns [Location] The line and byte location of the error.
		def location
			@location ||= Location.new(@buffer.read, @offset)
		end
		
		attr :buffer
		attr :path
		
		# Format the error with its path, location, message, and source line.
		# @returns [String] The formatted parse error.
		def to_s
			"#{buffer.path}#{location}: #{super}\n#{location.line_text}"
		end
	end
	
	# A byte offset resolved to a line within an input string.
	class Location
		# Initialize a location for a byte offset within an input string.
		# @parameter input [String] The complete input string.
		# @parameter offset [Integer] The byte offset within the input string.
		# @raises [ArgumentError] If the offset is past the end of the input.
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
		
		# Convert the location to its absolute byte offset.
		# @returns [Integer] The byte offset within the input string.
		def to_i
			@offset
		end
		
		# Format the location as a one-based line number and zero-based line offset.
		# @returns [String] The formatted location.
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
