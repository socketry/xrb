# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

%%{
	machine markup;
	
	action identifier_begin {
		identifier_begin = p
	}

	action identifier_end {
		identifier_end = p
	}
	
	action pcdata_begin {
		pcdata = ""
		has_entities = false
	}
	
	action pcdata_end {
	}
	
	action text_begin {
	}
	
	action text_end {
		pcdata = MarkupString.raw(pcdata) unless has_entities
		
		delegate.text(pcdata)
	}

	action characters_begin {
		characters_begin = p
	}

	action characters_end {
		characters_end = p
		
		pcdata << data.byteslice(characters_begin...characters_end)
	}

	action entity_error {
		raise ParseError.new("could not parse entity", buffer, p)
	}

	action entity_begin {
		entity_begin = p
	}

	action entity_name {
		entity_end = p
		
		name = data.byteslice(entity_begin...entity_end)
		
		has_entities = true
		pcdata << entities[name]
	}

	action entity_hex {
		entity_end = p
		
		has_entities = true
		pcdata << data.byteslice(entity_begin...entity_end).to_i(16)
	}

	action entity_number {
		entity_end = p
		
		has_entities = true
		pcdata << data.byteslice(entity_begin...entity_end).to_i(10)
	}
	
	action doctype_begin {
		doctype_begin = p
	}

	action doctype_end {
		doctype_end = p
		
		delegate.doctype(data.byteslice(doctype_begin...doctype_end))
	}

	action doctype_error {
		raise ParseError.new("could not parse doctype", buffer, p)
	}

	action comment_begin {
		comment_begin = p
	}

	action comment_end {
		comment_end = p
		
		delegate.comment(data.byteslice(comment_begin...comment_end))
	}

	action comment_error {
		raise ParseError.new("could not parse comment", buffer, p)
	}
	
	action instruction_begin {
		instruction_begin = p
	}

	action instruction_text_begin {
	}

	action instruction_text_end {
	}

	action instruction_end {
		delegate.instruction(data.byteslice(instruction_begin, p-instruction_begin))
	}
	
	action instruction_error {
		raise ParseError.new("could not parse instruction", buffer, p)
	}

	action tag_name {
		self_closing = false
		
		delegate.open_tag_begin(data.byteslice(identifier_begin...identifier_end), identifier_begin)
	}

	action tag_opening_begin {
	}

	action tag_self_closing {
		self_closing = true
	}
	
	action attribute_begin {
		has_value = false
		pcdata = ""
	}

	action attribute_value {
		has_value = true
	}

	action attribute_empty {
		has_value = true
	}

	action attribute {
		if has_value
			pcdata = MarkupString.raw(pcdata) unless has_entities
			
			value = pcdata
		else
			value = true
		end
		
		delegate.attribute(data.byteslice(identifier_begin...identifier_end), value)
	}
	
	action tag_opening_end {
		delegate.open_tag_end(self_closing)
	}

	action tag_closing_begin {
	}

	action tag_closing_end {
		delegate.close_tag(data.byteslice(identifier_begin...identifier_end), identifier_begin)
	}
	
	action tag_error {
		raise ParseError.new("could not parse tag", buffer, p)
	}

	action cdata_begin {
		cdata_begin = p
	}

	action cdata_end {
		cdata_end = p
		
		delegate.cdata(data.byteslice(cdata_begin...cdata_end))
	}
	
	action cdata_error {
		raise ParseError.new("could not parse cdata", buffer, p)
	}
	
	# This magic ensures that we process bytes.
	getkey bytes[p];
	
	include markup "xrb/markup.rl";
}%%

require_relative '../error'

module XRB
	module Fallback
		%% write data;
		
		def self.parse_markup(buffer, delegate, entities)
			data = buffer.read
			bytes = data.bytes
			
			p = 0
			# Must set pe here or it gets incorrectly set to data.length
			pe = eof = data.bytesize
			stack = []
			
			pcdata = nil
			characters_begin = characters_end = nil
			entity_begin = entity_end = nil
			identifier_begin = identifier_end = nil
			doctype_begin = doctype_end = nil
			comment_begin = comment_end = nil
			instruction_begin = instruction_end = nil
			cdata_begin = cdata_end = nil
			has_entities = has_value = false
			
			%% write init;
			%% write exec;
			
			if p != eof
				raise ParseError.new("could not consume all input", buffer, p)
			end
			
			return nil
		end
	end
end
