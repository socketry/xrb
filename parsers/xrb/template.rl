%%{
	machine template;
	
	unicode = any - ascii;
	identifier = (unicode | [a-zA-Z0-9\-_\.:])+;
	
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
	
	action backtrack {
		fprintf(stderr, "backtrack p=%s te=%s\n", p, te);
		p -= 1;
		te -= 1;
	}
	
	pcdata = [^#<] |
		('#' [^{] @backtrack) | 
		('<' [^?] @backtrack)
	;
	
	text = (pcdata - newline)*;
	
	text_lines = (
		text newline
	)*;
	
	# We are only interested in instructions that start with r:
	instruction = '<?r' (
		(space+ (any - [?] | '?' [^>])*) >instruction_begin %instruction_end
		'?>') @err(instruction_error);
	
	instruction_line = (space - newline)* instruction (space - newline)* newline;
	
	other_instruction = '<?' (
		(identifier - 'r') space+ (any - [?] | '?' [^>])* '?>'
	) @err(instruction_error);
	
	main := |*
		# Matches a full instruction line (consume whitespace and newline):
		instruction_line => emit_instruction_line;
		
		# Matches multiple lines of only text:
		text_lines => emit_text;
		
		# Matches a single instruction: <?r bar?>
		instruction => emit_instruction;
		
		# Matches a single expression: #{foo}
		expression_start => {fnext parse_expression;};
		
		other_instruction => emit_text;
		
		# Matches text:
		text => emit_text;
	*|;
}%%