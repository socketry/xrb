%%{
	machine entities;
	
	parse_entity := (
		'amp;' @{entity_codepoint(38);} |
		'quot;' @{entity_codepoint(34);} |
		'lt;' @{entity_codepoint(60);} |
		'gt;' @{entity_codepoint(62);} |
		'#x' [0-9a-fA-F]+ >entity_begin %entity_hex ';' |
		'#' [0-9]+ >entity_begin %entity_number ';'
	) @{fret;} @err(entity_error);
	
	entity = '&' @{fcall parse_entity;};
}%%
