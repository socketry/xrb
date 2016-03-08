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

require_relative 'strings'

module Trenni
	INSTRUCT_ATTRIBUTES = [
		['version', '1.0'],
		['encoding', 'UTF-8']
	].freeze
	
	class Builder
		DEFAULT_INDENTATION = "\t".freeze
		
		# A helper to generate fragments of markup.
		def self.fragment(builder = nil, &block)
			if builder
				yield builder
				
				return nil
			else
				builder = Builder.new
				
				yield builder
				
				return builder.output
			end
		end
		
		def initialize(strict: false, indent: true, indentation: DEFAULT_INDENTATION, escape: false, output: String.new)
			@strict = strict
			
			@indent = indent
			
			@indentation = indentation
			# This field gets togged in #inline so we keep track of it separately from @indentation.
			
			@escape = escape
			
			@output = output
			
			@level = [0]
			@children = [0]
		end
		
		attr :output
		
		def indentation
			if @indent
				@indentation * (@level.size - 1)
			else
				''
			end
		end
		
		def instruct(attributes = nil)
			attributes ||= INSTRUCT_ATTRIBUTES
			
			@output << "<?xml#{tag_attributes(attributes)}?>\n"
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
			append to_html(data)
		end
		
		# Append pre-existing markup:
		def append(data)
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
		
		# Convert a set of attributes into a string suitable for use within a <tag>.
		def tag_attributes(attributes)
			buffer = []
			
			attributes.each do |key, value|
				if value == true
					buffer << Strings::to_simple_attribute(key, @strict)
				elsif value
					buffer << Strings::to_attribute(key, to_html(value))
				end
			end
			
			if buffer.size > 0
				return ' ' + buffer.join(' ')
			else
				return ''
			end
		end
		
		protected
		
		def to_html(data)
			@escape ? Strings::to_html(data) : data
		end
		
		# A normal block level/container tag.
		def full_tag(name, attributes, indent_outer, indent_inner, &block)
			if block_given?
				if indent_outer
					@output << "\n" if @level.last > 0
					@output << indentation
				end
				
				@output << "<#{name}#{tag_attributes(attributes)}>"
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
				
				@output << "</#{name}>"
			else
				# The parent has one more child:
				@level[-1] += 1
				
				@output << indentation + "<#{name}#{tag_attributes(attributes)}/>"
			end
		end
	end
	
end
