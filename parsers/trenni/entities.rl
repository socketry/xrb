%%{
	machine entities;
	
	parse_entity := (
		[a-zA-Z0-9]+ >entity_begin %entity_name ';' |
		'#x' [0-9a-fA-F]+ >entity_begin %entity_hex ';' |
		'#' [0-9]+ >entity_begin %entity_number ';'
	) @{fret;} @err(entity_error);
	
	entity = '&' @{fcall parse_entity;};
}%%
