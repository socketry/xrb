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

require_relative '../scanner'
require_relative '../entities'

module Trenni
	module Fallback
		# This parser processes general markup into a sequence of events which are passed to a delegate.
		class Parser < StringScanner
			def initialize(buffer, delegate, entities: Entities::HTML)
				super(buffer)
				
				@delegate = delegate
				
				@entities = entities
			end

			def parse!
				until eos?
					start_pos = self.pos
					
					if self.scan(/[^<]+/m)
						@delegate.text(convert_entities(self.matched))
					elsif self.scan(/<([\w\-\.:]+)/m)
						@delegate.open_tag_begin(self[1])
						self.scan_attributes
						self.scan_tag_end
					elsif self.scan(/<\/([\w\-\.:]+)>/m)
						@delegate.close_tag(self[1])
					elsif self.scan(/<\?([\w\-\.:]+)\s+(.*?)\?>/m)
						@delegate.instruction(self[1], self[2])
					elsif self.scan(/<!--(.*?)-->/m)
						@delegate.comment(self.matched)
					elsif self.scan(/<!DOCTYPE(.*?)>/m)
						@delegate.doctype(self.matched)
					elsif self.scan(/<!\[CDATA\[.*?\]\]>/m)
						@delegate.cdata(self.matched)
					end
					
					raise_if_stuck(start_pos)
				end
			end

			protected

			def convert_entities(string_with_entities)
				@entities.gsub(string_with_entities)
			end

			def scan_attributes
				# Parse an attribute in the form of key="value" or key.
				while self.scan(/\s*([^\s=\/>]+)/um)
					name = self[1].freeze
					if self.scan(/=((['"])(.*?)\2)/um)
						value = convert_entities(self[3])
						@delegate.attribute(name, value)
					else
						@delegate.attribute(name, true)
					end
				end
			end
			
			def scan_tag_end
				self.scan(/\s*/)
				
				if self.scan(/\/>/)
					@delegate.open_tag_end(true)
				elsif self.scan(/>/)
					@delegate.open_tag_end(false)
				else
					parse_error!("Invalid characters in tag!")
				end
			end
		end
	end
end
