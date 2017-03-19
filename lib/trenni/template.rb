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

require_relative 'parsers'

module Trenni
	# The output variable that will be used in templates:
	OUT = :_out
	
	class Builder
		def >> block
			if block
				Template.buffer(block.binding) << self
				return nil
			else
				return self
			end
		end
	end
	
	class Template
		# Returns the output produced by calling the given block.
		def self.capture(*args, &block)
			scope = block.binding
			output_buffer = scope.local_variable_get(OUT)
			
			capture_buffer = String.new.force_encoding(output_buffer.encoding)
			scope.local_variable_set(OUT, capture_buffer)
			
			begin
				block.call(*args)
			ensure
				scope.local_variable_set(OUT, output_buffer)
			end
			
			return capture_buffer
		end
		
		# Returns the buffer used for capturing output.
		def self.buffer(binding)
			binding.local_variable_get(OUT)
		end
		
		class Assembler
			def initialize(filter: String, encoding: Encoding::UTF_8)
				@code = String.new.force_encoding(encoding)
				@filter = filter
			end

			attr :code

			# Output raw text to the template.
			def text(text)
				text = text.gsub("'", "\\\\'")
				@code << "#{OUT}<<'#{text}';"
				
				# This is an interesting approach, but it doens't preserve newlines or tabs as raw characters, so template line numbers don't match up.
				# @parts << "#{OUT}<<#{text.dump};"
			end

			# Output a ruby expression (or part of).
			def instruction(text, postfix = nil)
				@code << text << (postfix || ';')
			end
			
			# Output a string interpolation.
			def expression(text)
				# Double brackets are required here to handle expressions like #{foo rescue "bar"}.
				@code << "#{OUT}<<#{@filter}((#{text}));"
			end
		end
		
		def self.load_file(path, **options)
			self.new(FileBuffer.new(path), **options).freeze
		end

		def initialize(buffer, filter: String)
			@buffer = buffer
			@filter = filter
		end
		
		def freeze
			return self if frozen?
			
			to_proc
			
			super
		end
		
		def to_string(scope = Object.new, output = nil)
			output ||= output_buffer
			
			scope.instance_exec(output, &to_proc)
		end
		
		def to_buffer(scope)
			Buffer.new(to_string(scope), path: @buffer.path)
		end
		
		def to_proc(scope = nil)
			@compiled_proc ||= eval("proc{|#{OUT}|;#{code};#{OUT}}", scope, @buffer.path).freeze
		end
		
		protected
		
		def output_buffer
			String.new.force_encoding(code.encoding)
		end
		
		def code
			@code ||= compile!
		end
		
		def compile!
			assembler = Assembler.new(filter: @filter)
			
			Parsers.parse_template(@buffer, assembler)
			
			assembler.code
		end
	end
	
	class MarkupTemplate < Template
		def initialize(buffer, filter: MarkupString)
			super
		end
		
		# The output of the markup template is encoded markup (e.g. with entities, tags, etc)
		def output_buffer
			MarkupString.new.force_encoding(code.encoding)
		end
	end
end
