# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

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
			
			%% write init;
			%% write exec;
			
			if p != eof
				raise ParseError.new("could not consume all input", buffer, p)
			end
			
			return nil
		end
	end
end
