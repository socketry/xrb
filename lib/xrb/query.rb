# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2020-2024, by Samuel Williams.

require_relative "buffer"
require_relative "parsers"

require "uri"

module XRB
	# Parses URL query strings into nested Ruby objects.
	module Query
		# Parse a query string buffer.
		# @parameter buffer [Buffer] The buffer containing the query string.
		# @returns [Hash] The parsed query parameters.
		def self.parse(buffer)
			Hash.new.tap do |query|
				Parsers.parse_query(buffer, Delegate.new(query))
			end
		end
		
		# Receives query parser events and assembles them into nested hashes and arrays.
		class Delegate
			# Initialize a query delegate with the top-level result hash.
			# @parameter top [Hash] The hash which receives parsed query parameters.
			def initialize(top = {})
				@top = top
				
				@current = @top
				@index = nil
			end
			
			# Select a symbolic key parsed from a query string.
			# @parameter key [String] The parsed key.
			# @parameter encoded [Boolean] Whether the key is URL encoded.
			# @returns [Symbol] The selected key.
			def string(key, encoded)
				if encoded
					key = ::URI.decode_www_form_component(key)
				end
				
				index(key.to_sym)
			end
			
			# Select an integer key parsed from an array or hash index.
			# @parameter key [String] The parsed integer key.
			# @returns [Integer] The selected key.
			def integer(key)
				index(key.to_i)
			end
			
			# Descend into the previously selected key and select the next nested key.
			# @parameter key [Symbol | Integer] The next key to select.
			# @returns [Symbol | Integer] The selected key.
			def index(key)
				if @index
					@current = @current.fetch(@index) do
						@current[@index] = {}
					end
				end
				
				@index = key
			end
			
			# Descend into an array and select its next index.
			# @returns [Integer] The selected array index.
			def append
				if @index
					@current = @current.fetch(@index) do
						@current[@index] = []
					end
				end
				
				@index = @current.size
			end
			
			# Assign a parsed value to the selected key.
			# @parameter value [String] The parsed value.
			# @parameter encoded [Boolean] Whether the value is URL encoded.
			# @returns [Nil] This method always returns `nil`.
			def assign(value, encoded)
				if encoded
					value = ::URI.decode_www_form_component(value)
				end
				
				@current[@index] = value
				
				@current = @top
				@index = nil
			end
			
			# Assign `true` to a query key which has no explicit value.
			# @returns [Nil] This method always returns `nil`.
			def pair
				if @index
					@current[@index] = true
				end
				
				@current = @top
				@index = nil
			end
		end
	end
end
