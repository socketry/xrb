# frozen_string_literal: true

# Copyright, 2020, by Samuel G. D. Williams. <http://www.codeotaku.com>
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

require_relative 'buffer'

require 'uri'

module Trenni
	class Query < Hash
		def parse(buffer)
			Parsers.parse_query(buffer, Delegate.new(self))
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
