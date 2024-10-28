# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

module XRB
	class Buffer
		def initialize(string, path: "<string>")
			@string = string
			@path = path
		end
		
		attr :path
		
		def encoding
			@string.encoding
		end
		
		def read
			@string
		end
		
		def self.load_file(path)
			FileBuffer.new(path).freeze
		end
		
		def self.load(string)
			Buffer.new(string).freeze
		end
		
		def to_buffer
			self
		end
	end
	
	class FileBuffer
		def initialize(path)
			@path = path
		end
		
		def freeze
			return self if frozen?
			
			read
			
			super
		end
		
		attr :path
		
		def encoding
			read.encoding
		end
		
		def read
			@cache ||= File.read(@path).freeze
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
		
		def freeze
			return self if frozen?
			
			read
			
			super
		end
		
		attr :path
		
		def encoding
			read.encoding
		end
		
		def read
			@cache ||= @io.read.freeze
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
