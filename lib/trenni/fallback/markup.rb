
# line 1 "markup.rl"
# Copyright, 2016, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


# line 201 "markup.rl"


require_relative '../parse_error'

module Trenni
	module Fallback
		
# line 33 "markup.rb"
class << self
	attr_accessor :_markup_actions
	private :_markup_actions, :_markup_actions=
end
self._markup_actions = [
	0, 1, 0, 1, 1, 1, 3, 1, 
	4, 1, 6, 1, 7, 1, 12, 1, 
	13, 1, 15, 1, 16, 1, 18, 1, 
	19, 1, 20, 1, 21, 1, 24, 1, 
	29, 1, 31, 1, 32, 1, 34, 1, 
	35, 1, 39, 2, 1, 22, 2, 1, 
	28, 2, 2, 4, 2, 2, 39, 2, 
	3, 37, 2, 5, 3, 2, 5, 4, 
	2, 5, 39, 2, 8, 38, 2, 9, 
	38, 2, 10, 38, 2, 18, 19, 2, 
	25, 0, 2, 26, 28, 2, 27, 28, 
	3, 1, 22, 24, 3, 1, 28, 24, 
	3, 5, 3, 37, 3, 26, 28, 24, 
	3, 27, 28, 24, 3, 36, 2, 4, 
	3, 36, 2, 39, 4, 12, 36, 2, 
	4, 4, 12, 36, 2, 39, 4, 15, 
	36, 2, 4, 4, 15, 36, 2, 39, 
	4, 20, 36, 2, 4, 4, 20, 36, 
	2, 39, 4, 29, 36, 2, 4, 4, 
	29, 36, 2, 39, 4, 31, 36, 2, 
	4, 4, 31, 36, 2, 39, 4, 34, 
	36, 2, 4, 4, 34, 36, 2, 39, 
	6, 23, 30, 17, 14, 11, 33, 7, 
	12, 23, 30, 17, 14, 11, 33, 7, 
	15, 23, 30, 17, 14, 11, 33, 7, 
	20, 23, 30, 17, 14, 11, 33, 7, 
	29, 23, 30, 17, 14, 11, 33, 7, 
	31, 23, 30, 17, 14, 11, 33, 7, 
	34, 23, 30, 17, 14, 11, 33, 8, 
	3, 37, 23, 30, 17, 14, 11, 33, 
	9, 5, 3, 37, 23, 30, 17, 14, 
	11, 33
]

class << self
	attr_accessor :_markup_key_offsets
	private :_markup_key_offsets, :_markup_key_offsets=
end
self._markup_key_offsets = [
	0, 0, 12, 28, 44, 61, 62, 63, 
	66, 69, 74, 77, 82, 85, 86, 87, 
	88, 90, 91, 92, 93, 94, 95, 96, 
	97, 98, 99, 100, 101, 102, 103, 104, 
	105, 107, 117, 128, 138, 153, 157, 158, 
	160, 167, 170, 173, 179, 186, 193, 195, 
	197, 199, 201, 203, 205, 207, 209, 211
]

class << self
	attr_accessor :_markup_trans_keys
	private :_markup_trans_keys, :_markup_trans_keys=
end
self._markup_trans_keys = [
	33, 47, 63, 96, 0, 44, 59, 64, 
	91, 94, 123, 127, 32, 47, 62, 96, 
	0, 8, 9, 13, 14, 44, 59, 64, 
	91, 94, 123, 127, 32, 47, 62, 96, 
	0, 8, 9, 13, 14, 44, 59, 64, 
	91, 94, 123, 127, 32, 47, 61, 62, 
	96, 0, 8, 9, 13, 14, 44, 59, 
	64, 91, 94, 123, 127, 62, 34, 34, 
	38, 60, 34, 38, 60, 32, 47, 62, 
	9, 13, 34, 38, 60, 32, 47, 62, 
	9, 13, 45, 68, 91, 45, 45, 45, 
	45, 62, 79, 67, 84, 89, 80, 69, 
	62, 67, 68, 65, 84, 65, 91, 93, 
	93, 62, 93, 47, 96, 0, 44, 59, 
	64, 91, 94, 123, 127, 47, 62, 96, 
	0, 44, 59, 64, 91, 94, 123, 127, 
	47, 96, 0, 44, 59, 64, 91, 94, 
	123, 127, 32, 47, 96, 0, 8, 9, 
	13, 14, 44, 59, 64, 91, 94, 123, 
	127, 32, 63, 9, 13, 63, 62, 63, 
	35, 48, 57, 65, 90, 97, 122, 120, 
	48, 57, 59, 48, 57, 48, 57, 65, 
	70, 97, 102, 59, 48, 57, 65, 70, 
	97, 102, 59, 48, 57, 65, 90, 97, 
	122, 38, 60, 38, 60, 38, 60, 38, 
	60, 38, 60, 38, 60, 38, 60, 38, 
	60, 38, 60, 0
]

class << self
	attr_accessor :_markup_single_lengths
	private :_markup_single_lengths, :_markup_single_lengths=
end
self._markup_single_lengths = [
	0, 4, 4, 4, 5, 1, 1, 3, 
	3, 3, 3, 3, 3, 1, 1, 1, 
	2, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	2, 2, 3, 2, 3, 2, 1, 2, 
	1, 1, 1, 0, 1, 1, 2, 2, 
	2, 2, 2, 2, 2, 2, 2, 0
]

class << self
	attr_accessor :_markup_range_lengths
	private :_markup_range_lengths, :_markup_range_lengths=
end
self._markup_range_lengths = [
	0, 4, 6, 6, 6, 0, 0, 0, 
	0, 1, 0, 1, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 4, 4, 4, 6, 1, 0, 0, 
	3, 1, 1, 3, 3, 3, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_markup_index_offsets
	private :_markup_index_offsets, :_markup_index_offsets=
end
self._markup_index_offsets = [
	0, 0, 9, 20, 31, 43, 45, 47, 
	51, 55, 60, 64, 69, 73, 75, 77, 
	79, 82, 84, 86, 88, 90, 92, 94, 
	96, 98, 100, 102, 104, 106, 108, 110, 
	112, 115, 122, 130, 137, 147, 151, 153, 
	156, 161, 164, 167, 171, 176, 181, 184, 
	187, 190, 193, 196, 199, 202, 205, 208
]

class << self
	attr_accessor :_markup_indicies
	private :_markup_indicies, :_markup_indicies=
end
self._markup_indicies = [
	2, 3, 4, 1, 1, 1, 1, 1, 
	0, 6, 7, 8, 1, 1, 6, 1, 
	1, 1, 1, 5, 10, 11, 12, 1, 
	1, 10, 1, 1, 1, 1, 9, 14, 
	15, 16, 17, 1, 1, 14, 1, 1, 
	1, 1, 13, 12, 1, 18, 1, 20, 
	21, 1, 19, 23, 24, 1, 22, 25, 
	26, 27, 25, 1, 29, 30, 1, 28, 
	31, 32, 33, 31, 1, 34, 36, 37, 
	35, 38, 35, 39, 38, 40, 38, 40, 
	41, 38, 42, 35, 43, 35, 44, 35, 
	45, 35, 46, 35, 47, 35, 48, 47, 
	49, 35, 50, 35, 51, 35, 52, 35, 
	53, 35, 54, 35, 55, 54, 56, 54, 
	57, 56, 54, 1, 1, 1, 1, 1, 
	1, 58, 1, 60, 1, 1, 1, 1, 
	1, 59, 62, 62, 62, 62, 62, 62, 
	61, 64, 62, 62, 62, 64, 62, 62, 
	62, 62, 63, 66, 67, 66, 65, 69, 
	68, 70, 69, 68, 72, 73, 73, 73, 
	71, 75, 74, 71, 77, 76, 71, 78, 
	78, 78, 71, 80, 79, 79, 79, 71, 
	82, 81, 81, 81, 71, 84, 85, 83, 
	87, 88, 86, 90, 91, 89, 93, 94, 
	92, 96, 97, 95, 99, 100, 98, 102, 
	103, 101, 105, 106, 104, 108, 109, 107, 
	35, 0
]

class << self
	attr_accessor :_markup_trans_targs
	private :_markup_trans_targs, :_markup_trans_targs=
end
self._markup_trans_targs = [
	2, 0, 12, 33, 35, 2, 3, 5, 
	49, 4, 3, 5, 49, 4, 3, 5, 
	6, 49, 7, 8, 11, 10, 8, 9, 
	10, 3, 5, 49, 8, 9, 10, 3, 
	5, 49, 13, 0, 17, 24, 14, 15, 
	16, 50, 18, 19, 20, 21, 22, 23, 
	51, 25, 26, 27, 28, 29, 30, 31, 
	32, 52, 34, 34, 53, 36, 0, 36, 
	37, 38, 37, 39, 38, 39, 54, 0, 
	41, 45, 42, 43, 42, 55, 44, 44, 
	55, 45, 55, 47, 48, 1, 47, 48, 
	1, 47, 48, 1, 47, 48, 1, 47, 
	48, 1, 47, 48, 1, 47, 48, 1, 
	47, 48, 1, 47, 48, 1
]

class << self
	attr_accessor :_markup_trans_actions
	private :_markup_trans_actions, :_markup_trans_actions=
end
self._markup_trans_actions = [
	1, 35, 0, 0, 0, 0, 43, 88, 
	43, 79, 0, 29, 0, 0, 46, 92, 
	3, 46, 0, 49, 0, 52, 61, 58, 
	64, 82, 100, 82, 7, 5, 41, 85, 
	104, 85, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 1, 0, 3, 1, 27, 0, 
	3, 21, 21, 76, 0, 23, 0, 9, 
	0, 11, 11, 0, 0, 73, 11, 0, 
	70, 0, 67, 108, 112, 176, 61, 64, 
	240, 7, 41, 231, 146, 151, 207, 126, 
	131, 191, 116, 121, 183, 166, 171, 223, 
	156, 161, 215, 136, 141, 199
]

class << self
	attr_accessor :_markup_eof_actions
	private :_markup_eof_actions, :_markup_eof_actions=
end
self._markup_eof_actions = [
	0, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 0, 0, 19, 19, 
	19, 0, 0, 0, 0, 0, 0, 15, 
	0, 0, 0, 0, 0, 0, 39, 39, 
	39, 35, 35, 27, 27, 27, 27, 27, 
	9, 9, 9, 9, 9, 9, 0, 96, 
	55, 31, 17, 13, 37, 33, 25, 0
]

class << self
	attr_accessor :markup_start
end
self.markup_start = 46;
class << self
	attr_accessor :markup_first_final
end
self.markup_first_final = 46;
class << self
	attr_accessor :markup_error
end
self.markup_error = 0;

class << self
	attr_accessor :markup_en_parse_entity
end
self.markup_en_parse_entity = 40;
class << self
	attr_accessor :markup_en_main
end
self.markup_en_main = 46;


# line 208 "markup.rl"
		
		def self.parse_markup(buffer, delegate, entities)
			data = buffer.read
			
			p = 0
			eof = data.size
			stack = []
			
			
# line 286 "markup.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = markup_start
	top = 0
end

# line 217 "markup.rl"
			
# line 296 "markup.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_keys = _markup_key_offsets[cs]
	_trans = _markup_index_offsets[cs]
	_klen = _markup_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _markup_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _markup_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _markup_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _markup_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _markup_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	_trans = _markup_indicies[_trans]
	cs = _markup_trans_targs[_trans]
	if _markup_trans_actions[_trans] != 0
		_acts = _markup_trans_actions[_trans]
		_nacts = _markup_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _markup_actions[_acts - 1]
when 0 then
# line 24 "markup.rl"
		begin

		identifier_begin = p
			end
when 1 then
# line 28 "markup.rl"
		begin

		identifier_end = p
			end
when 2 then
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
when 3 then
# line 36 "markup.rl"
		begin

			end
when 4 then
# line 39 "markup.rl"
		begin

		characters_begin = p
			end
when 5 then
# line 43 "markup.rl"
		begin

		characters_end = p
		
		pcdata << data[characters_begin...characters_end]
			end
when 6 then
# line 49 "markup.rl"
		begin

		raise ParseError.new("could not parse entity", buffer, p)
			end
when 7 then
# line 53 "markup.rl"
		begin

		entity_begin = p
			end
when 8 then
# line 57 "markup.rl"
		begin

		entity_end = p
		
		name = data[entity_begin...entity_end]
		puts "Entity: #{name.inspect} => #{entities[name]}"
		
		pcdata << entities[name]
			end
when 9 then
# line 66 "markup.rl"
		begin

		entity_end = p
		
		pcdata << data[entity_begin...entity_end].to_i(16)
			end
when 10 then
# line 72 "markup.rl"
		begin

		entity_end = p
		
		pcdata << data[entity_begin...entity_end].to_i(10)
			end
when 11 then
# line 78 "markup.rl"
		begin

		doctype_begin = p
			end
when 12 then
# line 82 "markup.rl"
		begin

		doctype_end = p
		
		delegate.doctype(data[doctype_begin...doctype_end])
			end
when 14 then
# line 92 "markup.rl"
		begin

		comment_begin = p
			end
when 15 then
# line 96 "markup.rl"
		begin

		comment_end = p
		
		delegate.comment(data[comment_begin...comment_end])
			end
when 17 then
# line 106 "markup.rl"
		begin

			end
when 18 then
# line 109 "markup.rl"
		begin

		instruction_text_begin = p
			end
when 19 then
# line 113 "markup.rl"
		begin

		instruction_text_end = p
			end
when 20 then
# line 117 "markup.rl"
		begin

		delegate.instruction(
			data[identifier_begin...identifier_end],
			data[instruction_text_begin...instruction_text_end]
		)
			end
when 21 then
# line 124 "markup.rl"
		begin

		raise ParseError.new("could not parse instruction", buffer, p)
			end
when 22 then
# line 128 "markup.rl"
		begin

		self_closing = false
		
		delegate.open_tag_begin(data[identifier_begin...identifier_end])
			end
when 23 then
# line 134 "markup.rl"
		begin

			end
when 24 then
# line 137 "markup.rl"
		begin

		self_closing = true
			end
when 25 then
# line 141 "markup.rl"
		begin

		has_value = false
		pcdata = ""
			end
when 26 then
# line 146 "markup.rl"
		begin

		has_value = true
			end
when 27 then
# line 150 "markup.rl"
		begin

		has_value = true
			end
when 28 then
# line 154 "markup.rl"
		begin

		if has_value
			value = pcdata
		else
			value = true
		end
		
		delegate.attribute(data[identifier_begin...identifier_end], value)
			end
when 29 then
# line 164 "markup.rl"
		begin

		delegate.open_tag_end(self_closing)
			end
when 30 then
# line 168 "markup.rl"
		begin

			end
when 31 then
# line 171 "markup.rl"
		begin

		delegate.close_tag(data[identifier_begin...identifier_end])
			end
when 32 then
# line 175 "markup.rl"
		begin

		raise ParseError.new("could not parse tag", buffer, p)
			end
when 33 then
# line 179 "markup.rl"
		begin

		cdata_begin = p
			end
when 34 then
# line 183 "markup.rl"
		begin

		cdata_end = p
		
		delegate.cdata(data[cdata_begin...cdata_end])
			end
when 36 then
# line 193 "markup.rl"
		begin

			end
when 37 then
# line 196 "markup.rl"
		begin

		delegate.text(pcdata)
			end
when 38 then
# line 8 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
		begin
	begin
		top -= 1
		cs = stack[top]
		_trigger_goto = true
		_goto_level = _again
		break
	end
		end
when 39 then
# line 10 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 40
		_trigger_goto = true
		_goto_level = _again
		break
	end
		end
# line 634 "markup.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	__acts = _markup_eof_actions[cs]
	__nacts =  _markup_actions[__acts]
	__acts += 1
	while __nacts > 0
		__nacts -= 1
		__acts += 1
		case _markup_actions[__acts - 1]
when 3 then
# line 36 "markup.rl"
		begin

			end
when 5 then
# line 43 "markup.rl"
		begin

		characters_end = p
		
		pcdata << data[characters_begin...characters_end]
			end
when 6 then
# line 49 "markup.rl"
		begin

		raise ParseError.new("could not parse entity", buffer, p)
			end
when 12 then
# line 82 "markup.rl"
		begin

		doctype_end = p
		
		delegate.doctype(data[doctype_begin...doctype_end])
			end
when 13 then
# line 88 "markup.rl"
		begin

		raise ParseError.new("could not parse doctype", buffer, p)
			end
when 15 then
# line 96 "markup.rl"
		begin

		comment_end = p
		
		delegate.comment(data[comment_begin...comment_end])
			end
when 16 then
# line 102 "markup.rl"
		begin

		raise ParseError.new("could not parse comment", buffer, p)
			end
when 20 then
# line 117 "markup.rl"
		begin

		delegate.instruction(
			data[identifier_begin...identifier_end],
			data[instruction_text_begin...instruction_text_end]
		)
			end
when 21 then
# line 124 "markup.rl"
		begin

		raise ParseError.new("could not parse instruction", buffer, p)
			end
when 29 then
# line 164 "markup.rl"
		begin

		delegate.open_tag_end(self_closing)
			end
when 31 then
# line 171 "markup.rl"
		begin

		delegate.close_tag(data[identifier_begin...identifier_end])
			end
when 32 then
# line 175 "markup.rl"
		begin

		raise ParseError.new("could not parse tag", buffer, p)
			end
when 34 then
# line 183 "markup.rl"
		begin

		cdata_end = p
		
		delegate.cdata(data[cdata_begin...cdata_end])
			end
when 35 then
# line 189 "markup.rl"
		begin

		raise ParseError.new("could not parse cdata", buffer, p)
			end
when 37 then
# line 196 "markup.rl"
		begin

		delegate.text(pcdata)
			end
# line 762 "markup.rb"
		end # eof action switch
	end
	if _trigger_goto
		next
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 218 "markup.rl"
			
			if p != data.size
				raise ParseError.new("could not consume all input", buffer, p)
			end
			
			return nil
		end
	end
end
