# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2020-2024, by Samuel Williams.

require_relative "buffer"
require_relative "parsers"

require "uri"

module XRB
	module Query
		def self.parse(buffer)
			Hash.new.tap do |query|
				Parsers.parse_query(buffer, Delegate.new(query))
			end
		end
		
		class Delegate
			def initialize(top = {})
				@top = top
				
				@current = @top
				@index = nil
			end
			
			def string(key, encoded)
				if encoded
					key = ::URI.decode_www_form_component(key)
				end
				
				index(key.to_sym)
			end
			
			def integer(key)
				index(key.to_i)
			end
			
			def index(key)
				if @index
					@current = @current.fetch(@index) do
						@current[@index] = {}
					end
				end
				
				@index = key
			end
			
			def append
				if @index
					@current = @current.fetch(@index) do
						@current[@index] = []
					end
				end
				
				@index = @current.size
			end
			
			def assign(value, encoded)
				if encoded
					value = ::URI.decode_www_form_component(value)
				end
				
				@current[@index] = value
				
				@current = @top
				@index = nil
			end
			
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
