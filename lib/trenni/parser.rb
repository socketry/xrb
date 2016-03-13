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

require_relative 'scanner'

module Trenni
	# This parser processes general markup into a sequence of events which are passed to a delegate.
	class Parser < StringScanner
		OPENED_TAG = :opened
		CLOSED_TAG = :closed
		
		def initialize(buffer, delegate)
			super(buffer)
			
			@delegate = delegate
			
			# The delegate must respond to:
			# .begin_parse(self)
			# .text(escaped_data)
			# .cdata(unescaped_data)
			# .attribute(name, value_or_true)
			# .begin_tag(name, :opened or :closed)
			# .end_tag(begin_tag_type, :opened or :closed)
			# .doctype(doctype_attributes)
			# .comment(comment_text)
			# .instruction(instruction_text)
		end

		def parse!
			@delegate.begin_parse(self)

			until eos?
				start_pos = self.pos

				scan_text
				scan_tag

				raise_if_stuck(start_pos)
			end
		end

		protected

		def scan_text
			# Match any character data except the open tag character.
			if self.scan(/[^<]+/m)
				@delegate.text(self.matched)
			end
		end
		
		def scan_tag
			if self.scan(/</)
				if self.scan(/\//)
					scan_tag_normal(CLOSED_TAG)
				elsif self.scan(/!\[CDATA\[/)
					scan_tag_cdata
				elsif self.scan(/!--/)
					scan_tag_comment
				elsif self.scan(/!DOCTYPE/)
					scan_doctype
				elsif self.scan(/\?/)
					scan_tag_instruction
				else
					scan_tag_normal
				end
			end
		end

		def scan_attributes
			# Parse an attribute in the form of key="value" or key.
			while self.scan(/\s*([^\s=\/>]+)/um)
				name = self[1].freeze
				if self.scan(/=((['"])(.*?)\2)/um)
					value = self[3].freeze
					@delegate.attribute(name, value)
				else
					@delegate.attribute(name, true)
				end
			end
		end
		
		def scan_tag_normal(begin_tag_type = OPENED_TAG)
			if self.scan(/[^\s\/>]+/)
				@delegate.begin_tag(self.matched.freeze, begin_tag_type)
				
				self.scan(/\s*/)
				self.scan_attributes
				self.scan(/\s*/)
				
				if self.scan(/\/>/)
					if begin_tag_type == CLOSED_TAG
						parse_error!("Tag cannot be closed at both ends!")
					else
						@delegate.finish_tag(begin_tag_type, CLOSED_TAG)
					end
				elsif self.scan(/>/)
					@delegate.finish_tag(begin_tag_type, OPENED_TAG)
				else
					parse_error!("Invalid characters in tag!")
				end
			else
				parse_error!("Invalid tag!")
			end
		end
		
		def scan_doctype
			if self.scan_until(/(.*?)>/)
				@delegate.doctype(self[1].strip.freeze)
			else
				parse_error!("DOCTYPE is not closed!")
			end
		end
		
		def scan_tag_cdata
			if self.scan_until(/(.*?)\]\]>/m)
				@delegate.cdata(self[1].freeze)
			else
				parse_error!("CDATA segment is not closed!")
			end
		end
		
		def scan_tag_comment
			if self.scan_until(/(.*?)-->/m)
				@delegate.comment(self[1].freeze)
			else
				parse_error!("Comment is not closed!")
			end
		end
		
		def scan_tag_instruction
			if self.scan_until(/(.*)\?>/)
				@delegate.instruction(self[1].freeze)
			end
		end
	end
end
