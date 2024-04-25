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

%%{
	machine query;
	
	action string_begin {
		string_begin = p
	}
	
	action string_end {
		string_end = p
		
		delegate.string(data.byteslice(string_begin...string_end), encoded)
		
		encoded = false
	}
	
	action integer_begin {
		integer_begin = p
	}
	
	action integer_end {
		integer_end = p
		
		delegate.integer(data.byteslice(integer_begin...integer_end))
	}
	
	action append {
		delegate.append
	}
	
	action value_begin {
		value_begin = p
	}
	
	action value_end {
		value_end = p
		
		delegate.assign(data.byteslice(value_begin...value_end), encoded)
		
		encoded = false
	}
	
	action pair {
		delegate.pair
	}
	
	action encoded {
		encoded = 1;
	}
	
	# This magic ensures that we process bytes.
	getkey bytes[p];
	
	include query "xrb/query.rl";
}%%

require_relative '../error'

module XRB
	module Fallback
		%% write data;
		
		def self.parse_query(buffer, delegate)
			data = buffer.read
			bytes = data.bytes
			
			p = 0
			pe = eof = data.bytesize
			stack = []
			
			string_begin = string_end = nil
			integer_begin = integer_end = nil
			value_begin = value_end = nil
			encoded = false
			
			%% write init;
			%% write exec;
			
			if p != eof
				raise ParseError.new("could not consume all input", buffer, p)
			end
			
			return nil
		end
	end
end
