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
		def initialize(options = {})
			@output = options[:output] || StringIO.new
			
			@options = options
			
			@level = [0]
			@children = [0]
		end
		
		def indent?
			@options[:indent] != nil
		end
		
		def indent
			if indent?
				@options[:indent] * (@level.size - 1)
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
		
		def tag(name, attributes = {}, &block)
			if block_given?
				@output.puts if indent? and @level.last > 0
				@output.write indent + "<#{name}#{tag_attributes(attributes)}>"
				@output.puts if indent?
				
				@level[@level.size-1] += 1
				
				@level << 0
				yield self
				@level.pop
				
				@output.puts if indent?
				@output.write indent + "</#{name}>"
			else
				@output.write indent + "<#{name}#{tag_attributes(attributes)}/>"
			end
		end
		
		def text(data)
			if indent?
				data.split(/\n/).each_with_index do |line, i|
					@output.puts if i > 0
					@output.write indent + line
				end
			else
				@output.write data
			end
		end
		
		def options(options)
			saved_options = @options
			@options = options
			
			yield
			
			@options = saved_options
		end
		
		def tag_attributes(attributes)
			self.class.tag_attributes(attributes, @options[:strict])
		end
		
		# Convert a set of attributes into a string suitable for use within a <tag>.
		def self.tag_attributes(attributes, strict = false)
			buffer = []
			
			attributes.each do |key, value|
				if value == true
					buffer << Strings::to_simple_attribute(key, strict)
				elsif value
					buffer << Strings::to_attribute(key, value.to_s)
				end
			end
			
			if buffer.size > 0
				return ' ' + buffer.join(' ')
			else
				return ''
			end
		end
	end
	
end
