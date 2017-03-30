# Copyright, 2017, by Samuel G. D. Williams. <http://www.codeotaku.com>
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
	class URI
		def initialize(base, fragment, query)
			@base = base
			@fragment = fragment
			@query = query
		end
		
		attr :base
		attr :fragment
		attr :query
		
		def append(buffer)
			buffer << escape_path(@base)
			
			if @query&.any?
				buffer << query_separator << query_part
			end
			
			if @fragment
				buffer << '#' << escape(@fragment)
			end
			
			return buffer
		end
		
		def to_str
			append(String.new)
		end
		
		alias to_s to_str
		
		private
		
		# Escapes a path string, using percent encoding, but additionally ignoring "/" and substituting spaces with "+".
		def escape_path(path)
			encoding = path.encoding
			path.b.gsub(/([^ a-zA-Z0-9_.\-\/:]+)/) do |m|
				'%' + m.unpack('H2' * m.bytesize).join('%').upcase
			end.tr(' ', '+').force_encoding(encoding)
		end
		
		# Escapes a generic string, using percent encoding.
		def escape(string)
			encoding = string.encoding
			string.b.gsub(/([^a-zA-Z0-9_.\-]+)/) do |m|
				'%' + m.unpack('H2' * m.bytesize).join('%').upcase
			end.force_encoding(encoding)
		end
		
		def query_part
			@query.map{|k,v| "#{escape(k.to_s)}=#{escape(v.to_s)}"}.join('&')
		end
		
		def query_separator
			@base.include?('?') ? '&' : '?'
		end
	end
	
	def self.URI(path = '', query = nil)
		base, fragment = path.split('#', 2)
		
		URI.new(base, fragment, query)
	end
end
