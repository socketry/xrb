%%{
	machine Markup;
	
	unicode = any - ascii;
	identifier_character = unicode | [a-zA-Z0-9\-_\.:];
	
	# > is called on entering, % is called on exiting.
	identifier = identifier_character+ >identifier_start %identifier_end;
	
	cdata_text = (any* -- ']]>');
	cdata = '<![CDATA[' (cdata_text ']]>') @err(cdata_error);
	
	pcdata = (any - [<&])+;
	
	entity = '&' (
		[a-zA-Z]+ >entity_start %entity_name ';' |
		'#x' [0-9a-fA-F]+ >entity_start %entity_hex ';' |
		'#' [0-9]+ >entity_start %entity_number ';'
	) @err(entity_error);
	
	doctype_text = (any* -- '>');
	doctype = '<!DOCTYPE' (doctype_text '>') @err(doctype_error);
	
	comment_text = (any* -- '-->');
	comment = '<!--' (comment_text '-->') @err(comment_error);
	
	# Markup Instructions
	instruction_text = (any* -- '?>');
	instruction = '<?' (identifier space+ instruction_text >instruction_text_start '?>') @err(instruction_error);
	
	tag_attribute_value = (pcdata | entity)*;
	tag_attribute_quoted_value = 
		'"' (tag_attribute_value -- '"') >value_start %value_end '"' |
		"'" (tag_attribute_value -- "'") >value_start %value_end "'";
	
	tag_attribute = identifier >tag_attribute_start ('=' tag_attribute_quoted_value %tag_attribute_value)? %tag_attribute;
	
	# The @err handler will be triggered if the parser finishes in any state except the final accepting state.
	tag_opening = '<' (identifier %tag_name (space+ tag_attribute)* space* ('/' >tag_self_closing)? '>') @err(tag_error);
	
	tag_closing = '</' (identifier '>') @err(tag_error);
	
	main := |*
		# These are ordered (roughly) from most likely to least likely:
		pcdata => match_text;
		tag_opening => match_opening_tag;
		tag_closing => match_closing_tag;
		instruction => match_instruction;
		comment => match_comment;
		doctype => match_doctype;
		cdata => match_cdata;
		entity => match_entity;
	*|;
}%%