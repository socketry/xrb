# Copyright (c) 2011 Samuel G. D. Williams. <http://www.oriontransfer.co.nz>
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

require 'trenni/strings'

module Trenni
	
	INSTRUCT_ATTRIBUTES = [
		['version', '1.0'],
		['encoding', 'UTF-8']
	].freeze
	
	class Builder
		INDENT = "\t"
		
		def initialize(options = {})
			@strict = options[:strict]
			
			@output = options[:output] || StringIO.new
			@indentation = options[:indentation] || INDENT
			@indent = options[:indent]
			
			@escape = options[:escape]
			
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
			
			@output.puts "<?xml#{tag_attributes(attributes)}?>"
		end
		
		def doctype(attributes = 'html')
			if Array === attributes
				text = ''
				attributes.each do |value|
					if value.match(/[\s"]/)
						value = '"' + value.gsub('"', '&quot;') + '"'
					end
					
					text += ' ' + value
				end
			else
				text = ' ' + attributes
			end
			
			@output.puts "<!DOCTYPE#{text}>"
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
				yield
				@indent = indent
			end
		end
		
		def text(data)
			# The parent has one more child:
			@level[-1] += 1
			
			data = to_html(data)
			
			if @indent
				data.split(/\n/).each_with_index do |line, i|
					@output.puts if i > 0
					@output.write indentation + line
				end
			else
				@output.write data
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
					@output.puts if @level.last > 0
					@output.write indentation
				end
				
				@output.write "<#{name}#{tag_attributes(attributes)}>"
				@output.puts if indent_inner
				
				# The parent has one more child:
				@level[-1] += 1
				
				@level << 0
				
				yield
				
				children = @level.pop
				
				if indent_inner
					@output.puts if children > 0
					@output.write indentation
				end
				
				@output.write "</#{name}>"
			else
				@output.write indentation + "<#{name}#{tag_attributes(attributes)}/>"
			end
		end
	end
	
end
