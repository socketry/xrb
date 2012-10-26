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
		
		def self.line_at_offset(input, input_offset)
			line_number = 1
			line_offset = offset = 0

			input.each_line do |line|
				line_offset = offset
				offset += line.size

				if offset >= input_offset
					return {
						# The line that contains the input_offset:
						:line_number => line_number,
						# The offset to the start of that line:
						:line_offset => line_offset,
						# The number of characters from the start of the line to the input_offset:
						:character_offset => input_offset - line_offset,
						# The line of text itself:
						:text => line.chomp
					}
				end

				line_number += 1
			end
			
			return nil
		end
		
		class ParseError < StandardError
			def initialize(message, scanner)
				@message = message

				@position = scanner.pos
				@line = Parser.line_at_offset(scanner.string, @position)
			end

			attr :offset

			def to_s
				if @offset
					"Parse Error: #{@message} @ [#{@line[0]}:#{@line[2]}]: #{@line[4]}"
				else
					"Parse Error [#{@position}]: #{@message}"
				end
			end
		end
		
		def initialize(delegate)
			@delegate = delegate
			# The delegate must respond to:
			# .begin_parse(scanner)
			# .text(escaped-data)
			# .cdata(unescaped-data)
			# .attribute(name, value-or-true)
			# .begin_tag(name, :opened or :closed)
			# .end_tag(begin_tag_type, :opened or :closed)
			# .comment(comment-text)
			# .instruction(instruction-text)
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
				elsif scanner.scan(/!/)
					scan_tag_comment(scanner)
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
				name = scanner[1]
				if scanner.scan(/=((['"])(.*?)\2)/um)
					@delegate.attribute(name, scanner[3])
				else
					@delegate.attribute(name, true)
				end
			end
		end
		
		def scan_tag_normal(scanner, begin_tag_type = OPENED_TAG)
			if scanner.scan(/[^\s\/>]+/)
				@delegate.begin_tag(scanner.matched, begin_tag_type)
				
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

		def scan_tag_cdata(scanner)
			if scanner.scan_until(/(.*?)\]\]>/m)
				@delegate.cdata(scanner[1])
			else
				raise ParseError.new("CDATA segment is not closed!", scanner)
			end
		end
		
		def scan_tag_comment(scanner)
			if scanner.scan(/--/)
				if scanner.scan_until(/(.*?)-->/m)
					@delegate.comment("--" + scanner[1] + "--")
				else
					raise ParseError.new("Comment is not closed!", scanner)
				end
			else
				if scanner.scan_until(/(.*?)>/)
					@delegate.comment(scanner[1])
				else
					raise ParseError.new("Comment is not closed!", scanner)
				end
			end
		end
		
		def scan_tag_instruction(scanner)
			if scanner.scan_until(/(.*)\?>/)
				@delegate.instruction(scanner[1])
			end
		end
	end
end
