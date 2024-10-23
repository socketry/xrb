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
	instruction_value = (any - [?] | '?' [^>])*;
	instruction_remainder = (instruction_value %instruction_end '?>') @err(instruction_error);
	
	text = (
		(any+ -- (
			expression_start |
			('<?r' space) |
			newline
		)) >text_begin %text_end
		(
			expression_start |
			('<?r' space)
		)? >text_delimiter_begin @text_delimiter_end
	);
	
	# Top level:
	instruction = '<?r' space+ >instruction_begin instruction_remainder;
	multiline_instruction = (space - newline)* instruction (space - newline)* newline;
	
	main := |*
		multiline_instruction => emit_multiline_instruction;
		expression_start => {fcall parse_expression;};
		instruction => emit_instruction;
		newline => emit_newline;
		text => emit_text;
	*|;
}%%