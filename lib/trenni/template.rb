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
	# The output variable that will be used in templates:
	OUT = :_out
	
	class Template
		# Returns the output produced by calling the given block.
		def self.capture(*args, &block)
			scope = block.binding
			output_buffer = scope.local_variable_get(OUT)
			
			capture_buffer = String.new
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
			def initialize(filter: String)
				@parts = []
				@filter = filter
			end

			attr :parts

			# Output raw text to the template.
			def text(text)
				text = text.gsub("'", "\\\\'")
				@parts << "#{OUT}<<'#{text}';"
				
				# This is an interesting approach, but it doens't preserve newlines or tabs as raw characters, so template line numbers don't match up.
				# @parts << "#{OUT}<<#{text.dump};"
			end

			# Output a ruby expression (or part of).
			def expression(text)
				@parts << "#{text};"
			end
			
			# Output a string interpolation.
			def interpolation(text)
				@parts << "#{OUT}<<#{@filter}(#{text});"
			end

			CODE_PREFIX = "#{OUT}=String.new;".freeze
			CODE_POSTFIX = "#{OUT}".freeze

			def code
				return [CODE_PREFIX, *@parts, CODE_POSTFIX].join
			end
		end
		
		class Scanner < StringScanner
			def initialize(buffer, delegate)
				super(buffer)
				
				@delegate = delegate
			end
			
			def parse!
				until eos?
					start_pos = self.pos

					scan_text
					scan_expression or scan_interpolation
					
					raise_if_stuck(start_pos)
				end
			end

			# This is formulated specifically so that it matches up until the start of a code block.
			TEXT = /([^<#]|<(?!\?r)|#(?!\{)){1,}/m

			def scan_text
				if scan(TEXT)
					@delegate.text(self.matched)
				end
			end

			def scan_expression
				start_pos = self.pos
				
				if scan(/<\?r/)
					if scan_until(/(.*?)\?>/m)
						@delegate.expression(self[1])
					else
						parse_error!("Could not find end of expression!", [start_pos, self.pos])
					end
					
					return true
				end
				
				return false
			end

			def scan_interpolation
				start_pos = self.pos
				
				if scan(/\#\{/)
					level = 1
					code = String.new

					until eos?
						current_pos = self.pos
						
						# Scan anything other than something which causes nesting:
						if scan(/[^"'\{\}]+/m)
							code << matched
						end
						
						# Scan a quoted string:
						if scan(/'(\\'|[^'])*'/m) or scan(/"(\\"|[^"])*"/m)
							code << matched
						end
						
						# Scan something which nests:
						if scan(/\{/)
							code << matched
							level += 1
						end

						if scan(/\}/)
							level -= 1
							if level == 0
								@delegate.interpolation(code)
								return true
							else
								code << matched
							end
						end
						
						break if stuck?(current_pos)
					end
					
					parse_error!("Could not find end of interpolation!", [start_pos, self.pos])
				end
				
				return false
			end
		end

		def self.load_file(path, **options)
			self.new(FileBuffer.new(path), **options)
		end

		def initialize(buffer, filter: String)
			@buffer = buffer
			@filter = filter
		end

		def to_string(scope = Object.new)
			scope.instance_eval(&to_proc)
		end
		
		def to_buffer(scope)
			Buffer.new(to_string(scope), path: @buffer.path)
		end

		# Legacy functions:
		alias evaluate to_string
		alias result to_string
		
		def to_proc
			@compiled_proc ||= eval("proc{;#{code};}", binding, @buffer.path)
		end
		
		protected
		
		def code
			@code ||= compile!
		end
		
		def compile!
			assembler = Assembler.new(filter: @filter)
			
			Scanner.new(@buffer, assembler).parse!
			
			assembler.code
		end
	end
	
	class MarkupTemplate < Template
		def initialize(buffer, filter: MarkupString)
			super
		end
	end
end
