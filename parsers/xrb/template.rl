%%{
	machine template;
	
	unicode = any - ascii;
	identifier = (unicode | [a-zA-Z0-9\-_\.:])+;
	
	newline = [\n];
	
	# Expressions:
	expression_start = '#{';
	
	# This expression handles both single quoted and double quoted strings in Ruby. As Ruby supports nested string interpolations, we need to handle this too.
	expression_quoted = 
		'"' (any - '"' | '\"' | '#{' @{fcall parse_nested_expression;})* '"' | 
		"'" (any - "'" | "\'")* "'"
	;
	
	expression_nested = '{' @{fcall parse_nested_expression;};
	expression_value = ([^"'{}]+ | expression_quoted | expression_nested)*;
	parse_nested_expression := expression_value '}' @{fret;};
	parse_expression := (expression_value >expression_begin %expression_end '}') @err(expression_error) @emit_expression @{fret;};
	
	# Instructions:
	instruction_start = '<?r' space;
	instruction_value = (any - [?] | '?' [^>])*;
	instruction_remainder = (instruction_value %instruction_end '?>') @err(instruction_error);
	instruction = '<?r' space+ >instruction_begin instruction_remainder;
	multiline_instruction = (space - newline)* instruction (space - newline)* newline;
	
	# Text:
	pcdata = any* -- (
		expression_start |
		instruction_start |
		newline
	);
	
	text = (
		pcdata >text_begin %text_end
		(
			expression_start |
			instruction_start
		)? >text_delimiter_begin @text_delimiter_end
	);
	
	multiline_text = (
		(any* newline) -- (
			expression_start |
			instruction_start
		) 
	)*;
	
	# Top level:
	main := |*
		multiline_instruction => emit_multiline_instruction;
		
		multiline_text => emit_multiline_text;
		
		expression_start => {fcall parse_expression;};
		instruction => emit_instruction;
		
		text => emit_text;
	*|;
}%%