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
	parse_expression := (expression_value %expression_end '}') @err(expression_error) @emit_expression @{fnext main;};
	
	# Instructions:
	instruction_value = (any - [?] | '?' [^>])*;
	
	parse_instruction := (
		('r' space+ instruction_value >instruction_begin %instruction_end '?>') |
		(identifier - 'r' space+ instruction_value '?>') >text_begin %emit_text
	) @err(instruction_error) @{fnext main;};
	
	# Top level:
	text = (any+ -- ('#{' | '<?')) >text_begin %text_end %emit_text;
	expression = '#{' @{fnext parse_expression;};
	instruction = '<?' @{fnext parse_instruction;};
	
	main := (
		text |
		expression |
		instruction
	)**;
}%%