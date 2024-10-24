# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

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
	
	action emit_multiline_instruction {
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
	
	action text_begin {
		text_begin = p
		
		delimiter_begin = nil
		delimiter_end = nil
	}
	
	action text_end {
		text_end = p
	}
	
	action text_delimiter_begin {
		delimiter_begin = p
	}
	
	action text_delimiter_end {
		delimiter_end = p
	}
	
	action emit_text {
		if delimiter_begin
			text_end = delimiter_begin
			
			p = delimiter_begin - 1;
		end
		
		delegate.text(data.byteslice(text_begin...text_end))
	}
	
	action emit_multiline_text {
		delegate.text(data.byteslice(ts...te))
	}
	
	# This magic ensures that we process bytes.
	getkey bytes[p];
	
	include template "xrb/template.rl";
}%%

require_relative '../error'

module XRB
	module Fallback
		%% write data;
		
		def self.parse_template(buffer, delegate)
			data = buffer.read
			bytes = data.bytes
			
			p = 0
			pe = eof = data.bytesize
			stack = []
			
			ts = te = nil
			act = nil
			
			expression_begin = expression_end = nil
			instruction_begin = instruction_end = nil
			text_begin = text_end = nil
			delimiter_begin = delimiter_end = nil
			
			%% write init;
			%% write exec;
			
			if p != eof
				raise ParseError.new("could not consume all input", buffer, p)
			end
			
			return nil
		end
	end
end
