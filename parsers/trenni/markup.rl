%%{
	machine markup;
	
	unicode = any - ascii;
	identifier_character = unicode | [a-zA-Z0-9\-_\.:];
	
	# > is called on entering, % is called on exiting.
	identifier = identifier_character+ >identifier_begin %identifier_end;
	
	cdata_text = (any* -- ']]>');
	cdata = '<![CDATA[' >cdata_begin (cdata_text ']]>') %cdata_end @err(cdata_error);
	
	include entities "entities.rl";
	
	pcdata_character = any - [<&];
	pcdata_characters = pcdata_character+ >characters_begin %characters_end;
	pcdata = ((pcdata_characters | entity) $(pcdata,2) %(pcdata,1))+ %(pcdata,0) >pcdata_begin %pcdata_end;
	
	text = pcdata >text_begin %text_end;
	
	doctype_text = (any* -- '>');
	doctype = '<!DOCTYPE' >doctype_begin (doctype_text '>') %doctype_end @err(doctype_error);
	
	comment_text = (any* -- '-->');
	comment = '<!--' >comment_begin (comment_text '-->') %comment_end @err(comment_error);
	
	# Markup Instructions
	instruction_text = (any* -- '?>');
	instruction = '<?' >instruction_begin (identifier (space+ instruction_text) >instruction_text_begin %instruction_text_end '?>') %instruction_end @err(instruction_error);
	
	attribute_quoted_value = 
		'"' (pcdata -- '"') '"' %attribute_value | '""' %attribute_empty |
		"'" (pcdata -- "'") "'" %attribute_value | "''" %attribute_empty;
	
	attribute = identifier >attribute_begin ('=' attribute_quoted_value)? %attribute;
	
	# The @err handler will be triggered if the parser finishes in any state except the final accepting state.
	tag_opening = '<' >tag_opening_begin (identifier %tag_name (space+ attribute)* space* ('/' >tag_self_closing)? '>') %tag_opening_end @err(tag_error);
	
	tag_closing = '</' >tag_closing_begin (identifier '>') %tag_closing_end @err(tag_error);
	
	main := (text | tag_opening | tag_closing | instruction | comment | doctype | cdata)**;
}%%