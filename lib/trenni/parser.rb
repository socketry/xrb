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

require 'strscan'

module Trenni
	# This parser processes general markup into a sequence of events which are passed to a delegate.
	class Parser
		OPENED_TAG = :opened
		CLOSED_TAG = :closed
		
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
				":#{self.line_number}"
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
		
		class ParseError < StandardError
			def initialize(message, scanner)
				@message = message
				@location = Location.new(scanner.string, scanner.pos)
			end
			
			attr :location

			def to_s
				"#{@message} at #{@location}"
			end
		end
		
		def initialize(delegate)
			@delegate = delegate
			# The delegate must respond to:
			# .begin_parse(scanner)
			# .text(escaped_data)
			# .cdata(unescaped_data)
			# .attribute(name, value_or_true)
			# .begin_tag(name, :opened or :closed)
			# .end_tag(begin_tag_type, :opened or :closed)
			# .doctype(doctype_attributes)
			# .comment(comment_text)
			# .instruction(instruction_text)
		end

		def parse(string)
			scanner = StringScanner.new(string)
			@delegate.begin_parse(scanner)

			until scanner.eos?
				start_pos = scanner.pos

				scan_text(scanner)
				scan_tag(scanner)

				if start_pos == scanner.pos
					raise ParseError.new("Scanner didn't move", scanner)
				end
			end
		end

		protected

		def scan_text(scanner)
			# Match any character data except the open tag character.
			if scanner.scan(/[^<]+/m)
				@delegate.text(scanner.matched)
			end
		end
		
		def scan_tag(scanner)
			if scanner.scan(/</)
				if scanner.scan(/\//)
					scan_tag_normal(scanner, CLOSED_TAG)
				elsif scanner.scan(/!\[CDATA\[/)
					scan_tag_cdata(scanner)
				elsif scanner.scan(/!--/)
					scan_tag_comment(scanner)
				elsif scanner.scan(/!DOCTYPE/)
					scan_doctype(scanner)
				elsif scanner.scan(/\?/)
					scan_tag_instruction(scanner)
				else
					scan_tag_normal(scanner)
				end
			end
		end

		def scan_attributes(scanner)
			# Parse an attribute in the form of key="value" or key.
			while scanner.scan(/\s*([^\s=\/>]+)/um)
				name = scanner[1].freeze
				if scanner.scan(/=((['"])(.*?)\2)/um)
					value = scanner[3].freeze
					@delegate.attribute(name, value)
				else
					@delegate.attribute(name, true)
				end
			end
		end
		
		def scan_tag_normal(scanner, begin_tag_type = OPENED_TAG)
			if scanner.scan(/[^\s\/>]+/)
				@delegate.begin_tag(scanner.matched.freeze, begin_tag_type)
				
				scanner.scan(/\s*/)
				self.scan_attributes(scanner)
				scanner.scan(/\s*/)
				
				if scanner.scan(/\/>/)
					if begin_tag_type == CLOSED_TAG
						raise ParseError.new("Tag cannot be closed at both ends!", scanner)
					else
						@delegate.finish_tag(begin_tag_type, CLOSED_TAG)
					end
				elsif scanner.scan(/>/)
					@delegate.finish_tag(begin_tag_type, OPENED_TAG)
				else
					raise ParseError.new("Invalid characters in tag!", scanner)
				end
			else
				raise ParseError.new("Invalid tag!", scanner)
			end
		end
		
		def scan_doctype(scanner)
			if scanner.scan_until(/(.*?)>/)
				@delegate.doctype(scanner[1].strip.freeze)
			else
				raise ParseError.new("DOCTYPE is not closed!", scanner)
			end
		end
		
		def scan_tag_cdata(scanner)
			if scanner.scan_until(/(.*?)\]\]>/m)
				@delegate.cdata(scanner[1].freeze)
			else
				raise ParseError.new("CDATA segment is not closed!", scanner)
			end
		end
		
		def scan_tag_comment(scanner)
			if scanner.scan_until(/(.*?)-->/m)
				@delegate.comment(scanner[1].freeze)
			else
				raise ParseError.new("Comment is not closed!", scanner)
			end
		end
		
		def scan_tag_instruction(scanner)
			if scanner.scan_until(/(.*)\?>/)
				@delegate.instruction(scanner[1].freeze)
			end
		end
	end
end
