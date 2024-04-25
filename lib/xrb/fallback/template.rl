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

%%{
	machine template;
	
	action instruction_begin {
		instruction_begin = p
	}
	
	action instruction_end {
		instruction_end = p
	}
	
	action emit_instruction {
		delegate.instruction(data.byteslice(instruction_begin...instruction_end))
	}
	
	action emit_instruction_line {
		delegate.instruction(data.byteslice(instruction_begin...instruction_end), "\n")
	}
	
	action instruction_error {
		raise ParseError.new("failed to parse instruction", buffer, p)
	}
	
	action expression_begin {
		expression_begin = p
	}
	
	action expression_end {
		expression_end = p
	}
	
	action emit_expression {
		delegate.expression(data.byteslice(expression_begin...expression_end))
	}
	
	action expression_error {
		raise ParseError.new("failed to parse expression", buffer, p)
	}
	
	action emit_text {
		delegate.text(data.byteslice(ts...te))
	}
	
	# This magic ensures that we process bytes.
	getkey bytes[p];
	
	include template "trenni/template.rl";
}%%

require_relative '../error'

module Trenni
	module Fallback
		%% write data;
		
		def self.parse_template(buffer, delegate)
			data = buffer.read
			bytes = data.bytes
			
			p = 0
			pe = eof = data.bytesize
			stack = []
			
			expression_begin = expression_end = nil
			instruction_begin = instruction_end = nil
			
			%% write init;
			%% write exec;
			
			if p != eof
				raise ParseError.new("could not consume all input", buffer, p)
			end
			
			return nil
		end
	end
end
