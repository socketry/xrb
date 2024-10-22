%%{
	machine template;
	
	unicode = any - ascii;
	identifier = (unicode | [a-zA-Z0-9\-_\.:])+;
	
	newline = [\n];
	
	# Expressions:
	expression_start = '#{' %expression_begin;
	
	# This expression handles both single quoted and double quoted strings in Ruby. As Ruby supports nested string interpolations, we need to handle this too.
	expression_quoted = 
		'"' (any - '"' | '\"' | '#{' @{fcall parse_nested_expression;})* '"' | 
		"'" (any - "'" | "\'")* "'"
	;
	
	expression_nested = '{' @{fcall parse_nested_expression;};
	expression_value = ([^"'{}]+ | expression_quoted | expression_nested)*;
	
	parse_nested_expression := expression_value '}' @{fret;};
	parse_expression := (expression_value >expression_begin %expression_end '}') @err(expression_error) @{fnext main;};
	
	# Instructions:
	instruction_value = (any - [?] | '?' [^>])*;
	
	parse_instruction := (instruction_value >instruction_begin %instruction_end '?>') @err(instruction_error) @{fnext main;};
	
	text = any+ >text_begin (
		'#{' >token_begin @token_end @{fnext parse_expression;} |
		'<?r' >token_begin space+ @token_end @{fnext parse_instruction;}
	)? %text_end;
	
	# Top level:
	expression = '#{' @{fnext parse_expression;};
	instruction = '<?r' space+ @{fnext parse_instruction;};
	
	main := (text | expression | instruction)**;
}%%