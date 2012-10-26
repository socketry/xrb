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
	# The output variable that will be used in templates:
	OUT = '_out'
	
	class Template
		# Returns the output produced by calling the given block.
		def self.capture(*args, &block)
			out = eval(OUT, block.binding)
			top = out.size
			
			block.call *args
			
			return out.pop(out.size - top).join
		end
		
		# Returns the buffer used for capturing output.
		def self.buffer(binding)
			eval(OUT, binding)
		end
		
		class Buffer
			def initialize
				@parts = []
			end

			attr :parts

			def text(text)
				text = text.gsub('\\', '\\\\\\').gsub('@', '\\@')

				@parts << "#{OUT} << %q@#{text}@ ; "
			end

			def expression(text)
				@parts << "#{text} ; "
			end

			def output(text)
				@parts << "#{OUT} << (#{text}) ; "
			end

			def code
				parts = ["#{OUT} = [] ; "] + @parts + ["#{OUT}.join"]

				code = parts.join
			end
		end

		class Scanner < StringScanner
			TEXT = /([^<#]|<(?!\?r)|#(?!\{)){1,1024}/m
			
			def initialize(callback, string)
				@callback = callback
				super(string)
			end

			def parse
				until eos?
					pos = self.pos

					scan_text
					scan_expression

					if pos == self.pos
						raise StandardError.new "Could not scan current input #{self.pos} #{eos?}!"
					end
				end
			end

			def scan_text
				if scan(TEXT)
					@callback.text(matched)
				end
			end

			def scan_expression
				if scan(/\#\{/)
					level = 1
					code = ""

					until eos? || level == 0
						if scan(/[^"'\{\}]+/m)
							code << matched
						end

						if scan(/"(\\"|[^"])*"/m)
							code << matched
						end

						if scan(/'(\\'|[^'])*'/m)
							code << matched
						end

						if scan(/\{/)
							code << matched
							level += 1
						end

						if scan(/\}/)
							code << matched if level > 1
							level -= 1
						end
					end

					if level == 0
						@callback.output(code)
					else
						raise StandardError.new "Could not find end of expression #{self}!"
					end
				elsif scan(/<\?r/)
					if scan_until(/(.*?)\?>/m)
						@callback.expression(self[1])
					else
						raise StandardError.new "Could not find end of expression #{self}!"
					end
				end
			end
		end

		def self.load(path)
			return self.new(File.read(path), path)
		end

		def initialize(template, filename = '<Trenni>')
			@template = template
			@filename = filename
			compile!
		end

		def evaluate(binding)
			eval(@code, binding, @filename)
		end
		
		alias result evaluate
		
		protected
		
		def compile!(filename = @filename)
			buffer = Buffer.new
			scanner = Scanner.new(buffer, @template)
			
			scanner.parse
			
			@code = buffer.code
		end
	end
end
