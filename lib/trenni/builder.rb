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

require_relative 'markup'

module Trenni
	# Build markup quickly and efficiently.
	class Builder
		include Markup
		
		INDENT = "\t".freeze
		
		# A helper to generate fragments of markup.
		def self.fragment(builder = nil, &block)
			if builder
				yield builder
			else
				builder = self.new
				
				yield builder
			end
			
			return builder
		end
		
		def self.tag(name, content, **attributes)
			self.fragment do |builder|
				builder.inline(name, attributes) do
					builder.text content
				end
			end
		end
		
		def initialize(output = nil, indent: true, encoding: Encoding::UTF_8)
			# This field gets togged in #inline so we keep track of it separately from @indentation.
			@indent = indent
			
			# We don't need to use MarkupString here as Builder itself is considered markup and should be inserted directly into the output stream.
			@output = output || MarkupString.new.force_encoding(encoding)
			
			@level = [0]
			@children = [0]
		end
		
		attr :output
		
		# Required for output to buffer.
		def to_str
			@output
		end
		
		alias to_s to_str
		
		def == other
			@output == String(other)
		end
		
		def indentation
			if @indent
				INDENT * (@level.size - 1)
			else
				''
			end
		end
		
		def doctype(attributes = 'html')
			@output << "<!DOCTYPE #{attributes}>\n"
		end
		
		# Begin a block tag.
		def tag(name, attributes = {}, &block)
			full_tag(name, attributes, @indent, @indent, &block)
		end
		
		# Begin an inline tag.
		def inline(name, attributes = {}, &block)
			indent = @indent
			
			full_tag(name, attributes, @indent, false) do
				@indent = false
				yield if block_given?
				@indent = indent
			end
		end
		
		def text(data)
			append escape(data)
		end
		
		# Append pre-existing markup:
		def append(data)
			return unless data
			
			# The parent has one more child:
			@level[-1] += 1
			
			if @indent
				data.each_line.with_index do |line, i|
					@output << indentation << line
				end
			else
				@output << data
			end
		end
		
		protected
		
		# A normal block level/container tag.
		def full_tag(name, attributes, indent_outer, indent_inner, &block)
			if block_given?
				if indent_outer
					@output << "\n" if @level.last > 0
					@output << indentation
				end
				
				tag = Trenni::Tag.opened(name.to_s, attributes)
				tag.write_opening_tag(@output)
				@output << "\n" if indent_inner
				
				# The parent has one more child:
				@level[-1] += 1
				
				@level << 0
				
				yield
				
				children = @level.pop
				
				if indent_inner
					@output << "\n" if children > 0
					@output << indentation
				end
				
				tag.write_closing_tag(@output)
			else
				# The parent has one more child:
				@level[-1] += 1
				
				@output << indentation
				Trenni::Tag.append_tag(@output, name.to_s, attributes, nil)
			end
		end
	end
end
