# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

module XRB
	# Represents a string buffer with a given path.
	class Buffer
		# Create a new buffer from a string.
		# @parameter string [String] the string to use as the buffer.
		# @parameter path [String] the path to use for the buffer.
		def initialize(string, path: "<string>")
			@string = string
			@path = path
		end
		
		# @attribute [String] the path name of the buffer.
		attr :path
		
		def freeze
			return self if frozen?
			
			@string.freeze
			@path.freeze
			
			super
		end
		
		# @returns [Encoding] the encoding of the buffer.
		def encoding
			@string.encoding
		end
		
		# @returns [String] the content of the buffer.
		def read
			@string
		end
		
		# Create a buffer from the specified file.
		# @parameter path [String] the path to load the file from.
		# @returns [Buffer] a buffer with the contents of the specified path.
		def self.load_file(path)
			FileBuffer.new(path).freeze
		end
		
		# Create a buffer from the specified string.
		# @parameter string [String] the string to load into the buffer.
		# @returns [Buffer] a buffer with the contents of the specified string.
		def self.load(string)
			Buffer.new(string).freeze
		end
		
		# @returns [Buffer] itself.
		def to_buffer
			self
		end
	end
	
	# Represents a file buffer with a given path.
	class FileBuffer
		# Create a new file buffer from a file path.
		# @parameter path [String] the path to the file.
		def initialize(path)
			@path = path
			@cache = nil
		end
		
		# Freeze the buffer, caching the contents of the file.
		def freeze
			return self if frozen?
			
			read
			
			super
		end
		
		# @attribute [String] the path name of the buffer.
		attr :path
		
		# @returns [Encoding] the encoding of the buffer.
		def encoding
			read.encoding
		end
		
		# Read the contents of the file into the buffer.
		# @returns [String] the content of the buffer.
		def read
			@cache ||= File.read(@path).freeze
		end
		
		# @returns [Buffer] a buffer with the contents of the file.
		def to_buffer
			Buffer.new(self.read, @path)
		end
	end
	
	# Represents an IO buffer with a given path.
	class IOBuffer
		# Create a new IO buffer from an IO object.
		# @parameter io [IO] the IO object to use as the buffer.
		# @parameter path [String] the path to use for the buffer.
		def initialize(io, path: io.inspect)
			@io = io
			@path = path
			@cache = nil
		end
		
		# Freeze the buffer, caching the contents of the IO object.
		def freeze
			return self if frozen?
			
			read
			
			super
		end
		
		# @attribute [String] the path name of the buffer.
		attr :path
		
		# @returns [Encoding] the encoding of the buffer.
		def encoding
			read.encoding
		end
		
		# Read the contents of the IO object into the buffer.
		def read
			unless @cache
				@cache = @io.read.freeze
				@io.close
			end
			
			return @cache
		end
		
		# @returns [Buffer] a buffer with the contents of the IO object.
		def to_buffer
			Buffer.new(self.read, path: @path)
		end
	end
	
	# Convert the given value to a buffer.
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
