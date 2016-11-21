# Copyright, 2016, by Samuel G. D. Williams. <http://www.codeotaku.com>
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

module Trenni
	class Buffer
		def initialize(string, path: '<string>')
			@string = string
			@path = path
		end
		
		attr :path
		
		def read
			@string
		end
		
		def self.load_file(path)
			FileBuffer.new(path)
		end
		
		def self.load(string)
			Buffer.new(string)
		end
		
		def to_buffer
			self
		end
	end
	
	class FileBuffer
		def initialize(path)
			@path = path
		end
		
		attr :path
		
		def read
			@cache ||= File.read(@path)
		end
		
		def to_buffer
			Buffer.new(self.read, @path)
		end
	end
	
	class IOBuffer
		def initialize(io, path: io.inspect)
			@io = io
			@path = path
		end
		
		attr :path
		
		def read
			@cache ||= @io.read
		end
		
		def to_buffer
			Buffer.new(self.read, path: @path)
		end
	end
	
	def self.Buffer(value)
		case value
		when String
			Buffer.new(value)
		when Buffer, FileBuffer, IOBuffer
			value
		else
			value.to_buffer
		end
	end
end
