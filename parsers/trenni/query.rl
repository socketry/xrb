%%{
	machine query;
	
	# An application/x-www-form-urlencoded parser based on the definition by WhatWG.
	# Based on https://url.spec.whatwg.org/#application/x-www-form-urlencoded
	pchar = any - [&=\[\]];
	
	integer = ([0-9]+) >integer_begin %integer_end;
	string = (pchar+ - integer) >string_begin %string_end;
	
	value = (pchar*) >value_begin %value_end;
	
	index = string (
		'[' (integer | string) ']'
	)* ('[]' %append)?;
	
	pair = (
		index ('=' value)?
	) %pair;
	
	main := ((pair '&')* pair)?;
}%%