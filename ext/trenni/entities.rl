%%{
	machine entities;
	
	entity = '&' (
		"amp;" %{entity_codepoint(38);} |
		"quot;" %{entity_codepoint(34);} |
		'#x' [0-9a-fA-F]+ >entity_begin %entity_hex ';' |
		'#' [0-9]+ >entity_begin %entity_number ';'
	) @err(entity_error);
}%%
