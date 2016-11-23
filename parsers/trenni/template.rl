%%{
	machine template;
	
	unicode = any - ascii;
	newline = [\n];
	
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
	
	pcdata = any - [#<] | '#' [^{] | '<' [^?];
	
	text = (pcdata - newline)*;
	
	text_lines = (
		text newline
	)*;
	
	# We are only interested in instructions that start with r:
	instruction = '<?r' space+
		%instruction_begin (any - [?] | '?' [^>])* %instruction_end
	'?>';
	
	instruction_line = (space - newline)* instruction space* newline;
	
	main := |*
		# Matches a full instruction line (consume whitespace and newline):
		instruction_line => emit_instruction_line;
		
		# Matches multiple lines of only text:
		text_lines => emit_text;
		
		# Matches a single instruction: <?r bar?>
		instruction => emit_instruction;
		
		# Matches a single expression: #{foo}
		expression_start => {fnext parse_expression;};
		
		# Matches text:
		text => emit_text;
	*|;
}%%