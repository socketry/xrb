
# line 1 "template.rl"
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


# line 61 "template.rl"


require_relative '../parse_error'

module Trenni
	module Fallback
		
# line 33 "template.rb"
class << self
	attr_accessor :_template_actions
	private :_template_actions, :_template_actions=
end
self._template_actions = [
	0, 1, 0, 1, 1, 1, 5, 1, 
	6, 1, 7, 1, 8, 1, 10, 1, 
	11, 1, 12, 1, 16, 1, 18, 1, 
	19, 1, 20, 1, 21, 2, 0, 1, 
	2, 2, 17, 2, 6, 7, 2, 12, 
	13, 2, 12, 14, 2, 12, 15, 3, 
	3, 4, 9
]

class << self
	attr_accessor :_template_key_offsets
	private :_template_key_offsets, :_template_key_offsets=
end
self._template_key_offsets = [
	0, 0, 3, 4, 5, 6, 7, 8, 
	9, 12, 16, 17, 18, 22, 23, 24, 
	25, 28, 32, 33, 34, 38, 40, 44, 
	48, 51, 54, 57, 61, 64, 65, 68, 
	72, 74, 78, 82, 85, 88, 91, 95, 
	98, 99, 102, 108, 111, 114, 120, 124, 
	124, 127, 129, 130, 130, 133, 135, 136
]

class << self
	attr_accessor :_template_trans_keys
	private :_template_trans_keys, :_template_trans_keys=
end
self._template_trans_keys = [
	10, 35, 60, 123, 63, 123, 63, 63, 
	114, 32, 9, 13, 32, 63, 9, 13, 
	63, 62, 10, 32, 9, 13, 123, 63, 
	114, 32, 9, 13, 32, 63, 9, 13, 
	63, 62, 34, 39, 123, 125, 34, 35, 
	35, 39, 123, 125, 35, 39, 123, 125, 
	34, 35, 39, 35, 123, 125, 35, 123, 
	125, 34, 35, 39, 123, 34, 35, 123, 
	39, 34, 123, 125, 34, 39, 123, 125, 
	34, 35, 35, 39, 123, 125, 35, 39, 
	123, 125, 34, 35, 39, 35, 123, 125, 
	35, 123, 125, 34, 35, 39, 123, 34, 
	35, 123, 39, 34, 123, 125, 10, 32, 
	35, 60, 9, 13, 10, 35, 60, 10, 
	35, 60, 10, 32, 35, 60, 9, 13, 
	10, 32, 9, 13, 34, 35, 39, 34, 
	35, 39, 34, 35, 39, 34, 35, 39, 
	0
]

class << self
	attr_accessor :_template_single_lengths
	private :_template_single_lengths, :_template_single_lengths=
end
self._template_single_lengths = [
	0, 3, 1, 1, 1, 1, 1, 1, 
	1, 2, 1, 1, 2, 1, 1, 1, 
	1, 2, 1, 1, 4, 2, 4, 4, 
	3, 3, 3, 4, 3, 1, 3, 4, 
	2, 4, 4, 3, 3, 3, 4, 3, 
	1, 3, 4, 3, 3, 4, 2, 0, 
	3, 2, 1, 0, 3, 2, 1, 0
]

class << self
	attr_accessor :_template_range_lengths
	private :_template_range_lengths, :_template_range_lengths=
end
self._template_range_lengths = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	1, 1, 0, 0, 1, 0, 0, 0, 
	1, 1, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 1, 0, 0, 1, 1, 0, 
	0, 0, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_template_index_offsets
	private :_template_index_offsets, :_template_index_offsets=
end
self._template_index_offsets = [
	0, 0, 4, 6, 8, 10, 12, 14, 
	16, 19, 23, 25, 27, 31, 33, 35, 
	37, 40, 44, 46, 48, 53, 56, 61, 
	66, 70, 74, 78, 83, 87, 89, 93, 
	98, 101, 106, 111, 115, 119, 123, 128, 
	132, 134, 138, 144, 148, 152, 158, 162, 
	163, 167, 170, 172, 173, 177, 180, 182
]

class << self
	attr_accessor :_template_indicies
	private :_template_indicies, :_template_indicies=
end
self._template_indicies = [
	2, 3, 4, 1, 0, 1, 0, 1, 
	5, 6, 5, 6, 7, 6, 8, 5, 
	9, 9, 5, 11, 12, 11, 10, 14, 
	13, 15, 13, 17, 15, 15, 16, 18, 
	6, 19, 6, 20, 21, 22, 22, 21, 
	24, 25, 24, 23, 27, 26, 28, 26, 
	30, 31, 32, 33, 29, 34, 35, 30, 
	36, 37, 38, 39, 34, 36, 37, 40, 
	39, 34, 41, 42, 41, 37, 43, 44, 
	45, 41, 43, 46, 45, 41, 41, 42, 
	41, 47, 37, 34, 35, 48, 30, 49, 
	31, 37, 50, 51, 49, 53, 54, 55, 
	56, 52, 57, 58, 53, 59, 60, 61, 
	62, 57, 59, 60, 63, 62, 57, 64, 
	65, 64, 60, 66, 67, 68, 64, 66, 
	69, 68, 64, 64, 65, 64, 70, 60, 
	57, 58, 71, 53, 72, 54, 60, 73, 
	74, 72, 2, 75, 76, 77, 75, 6, 
	2, 79, 80, 6, 2, 3, 4, 1, 
	2, 75, 79, 82, 75, 6, 17, 15, 
	15, 16, 83, 41, 42, 41, 37, 34, 
	35, 30, 49, 31, 21, 64, 65, 64, 
	60, 57, 58, 53, 72, 54, 21, 0
]

class << self
	attr_accessor :_template_trans_targs
	private :_template_trans_targs, :_template_trans_targs=
end
self._template_trans_targs = [
	42, 1, 44, 2, 3, 42, 43, 7, 
	8, 9, 10, 9, 11, 10, 11, 12, 
	42, 46, 47, 15, 16, 0, 17, 18, 
	17, 19, 18, 19, 46, 20, 21, 29, 
	20, 51, 22, 28, 23, 24, 22, 49, 
	22, 25, 27, 26, 25, 48, 25, 24, 
	21, 30, 30, 50, 31, 32, 40, 31, 
	55, 33, 39, 34, 35, 33, 53, 33, 
	36, 38, 37, 36, 52, 36, 35, 32, 
	41, 41, 54, 45, 13, 14, 42, 4, 
	5, 42, 6, 42
]

class << self
	attr_accessor :_template_trans_actions
	private :_template_trans_actions, :_template_trans_actions=
end
self._template_trans_actions = [
	23, 0, 17, 0, 0, 25, 17, 0, 
	0, 0, 1, 1, 29, 0, 3, 0, 
	27, 38, 0, 0, 0, 0, 0, 1, 
	1, 29, 0, 3, 41, 0, 0, 0, 
	9, 11, 0, 0, 0, 0, 9, 11, 
	35, 0, 0, 0, 9, 11, 35, 7, 
	7, 0, 9, 11, 0, 0, 0, 9, 
	47, 0, 0, 0, 0, 9, 47, 35, 
	0, 0, 0, 9, 47, 35, 7, 7, 
	0, 9, 47, 44, 0, 0, 21, 0, 
	0, 19, 0, 32
]

class << self
	attr_accessor :_template_to_state_actions
	private :_template_to_state_actions, :_template_to_state_actions=
end
self._template_to_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 13, 13, 13, 0, 
	13, 13, 0, 0, 0, 0, 13, 13, 
	13, 13, 0, 13, 13, 0, 0, 0, 
	0, 13, 13, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_template_from_state_actions
	private :_template_from_state_actions, :_template_from_state_actions=
end
self._template_from_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 15, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_template_eof_actions
	private :_template_eof_actions, :_template_eof_actions=
end
self._template_eof_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_template_eof_trans
	private :_template_eof_trans, :_template_eof_trans=
end
self._template_eof_trans = [
	0, 1, 1, 1, 6, 6, 6, 6, 
	6, 6, 6, 6, 17, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 79, 82, 79, 17, 84, 
	0, 0, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :template_start
end
self.template_start = 42;
class << self
	attr_accessor :template_first_final
end
self.template_first_final = 42;
class << self
	attr_accessor :template_error
end
self.template_error = 0;

class << self
	attr_accessor :template_en_parse_nested_expression
end
self.template_en_parse_nested_expression = 20;
class << self
	attr_accessor :template_en_parse_expression
end
self.template_en_parse_expression = 31;
class << self
	attr_accessor :template_en_main
end
self.template_en_main = 42;


# line 68 "template.rl"
		
		def self.parse_template(buffer, delegate)
			data = buffer.read
			
			p = 0
			eof = data.size
			stack = []
			
			expression_begin = expression_end = nil
			instruction_begin = instruction_end = nil
			
			
# line 291 "template.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = template_start
	top = 0
	ts = nil
	te = nil
	act = 0
end

# line 80 "template.rl"
			
# line 304 "template.rb"
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
	_acts = _template_from_state_actions[cs]
	_nacts = _template_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _template_actions[_acts - 1]
			when 11 then
# line 1 "NONE"
		begin
ts = p
		end
# line 338 "template.rb"
		end # from state action switch
	end
	if _trigger_goto
		next
	end
	_keys = _template_key_offsets[cs]
	_trans = _template_index_offsets[cs]
	_klen = _template_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _template_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _template_trans_keys[_mid]
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
	  _klen = _template_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _template_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _template_trans_keys[_mid+1]
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
	_trans = _template_indicies[_trans]
	end
	if _goto_level <= _eof_trans
	cs = _template_trans_targs[_trans]
	if _template_trans_actions[_trans] != 0
		_acts = _template_trans_actions[_trans]
		_nacts = _template_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _template_actions[_acts - 1]
when 0 then
# line 24 "template.rl"
		begin

		instruction_begin = p
			end
when 1 then
# line 28 "template.rl"
		begin

		instruction_end = p
			end
when 2 then
# line 40 "template.rl"
		begin

		expression_begin = p
			end
when 3 then
# line 44 "template.rl"
		begin

		expression_end = p
			end
when 4 then
# line 48 "template.rl"
		begin

		delegate.expression(data[expression_begin...expression_end])
			end
when 6 then
# line 11 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 20
		_trigger_goto = true
		_goto_level = _again
		break
	end
		end
when 7 then
# line 15 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 20
		_trigger_goto = true
		_goto_level = _again
		break
	end
		end
when 8 then
# line 18 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
		begin
	begin
		top -= 1
		cs = stack[top]
		_trigger_goto = true
		_goto_level = _again
		break
	end
		end
when 9 then
# line 19 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
		begin
cs = 42;		end
when 12 then
# line 1 "NONE"
		begin
te = p+1
		end
when 13 then
# line 36 "template.rl"
		begin
act = 1;		end
when 14 then
# line 32 "template.rl"
		begin
act = 3;		end
when 15 then
# line 56 "template.rl"
		begin
act = 5;		end
when 16 then
# line 56 "template.rl"
		begin
te = p
p = p - 1; begin 
		delegate.text(data[ts...te])
	 end
		end
when 17 then
# line 47 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
		begin
te = p
p = p - 1; begin cs = 31; end
		end
when 18 then
# line 56 "template.rl"
		begin
te = p
p = p - 1; begin 
		delegate.text(data[ts...te])
	 end
		end
when 19 then
# line 56 "template.rl"
		begin
 begin p = ((te))-1; end
 begin 
		delegate.text(data[ts...te])
	 end
		end
when 20 then
# line 56 "template.rl"
		begin
 begin p = ((te))-1; end
 begin 
		delegate.text(data[ts...te])
	 end
		end
when 21 then
# line 1 "NONE"
		begin
	case act
	when 1 then
	begin begin p = ((te))-1; end

		delegate.instruction(data[instruction_begin...instruction_end], "\n")
	end
	when 3 then
	begin begin p = ((te))-1; end

		delegate.instruction(data[instruction_begin...instruction_end])
	end
	when 5 then
	begin begin p = ((te))-1; end

		delegate.text(data[ts...te])
	end
end 
			end
# line 550 "template.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	_acts = _template_to_state_actions[cs]
	_nacts = _template_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _template_actions[_acts - 1]
when 10 then
# line 1 "NONE"
		begin
ts = nil;		end
# line 570 "template.rb"
		end # to state action switch
	end
	if _trigger_goto
		next
	end
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
	if _template_eof_trans[cs] > 0
		_trans = _template_eof_trans[cs] - 1;
		_goto_level = _eof_trans
		next;
	end
	__acts = _template_eof_actions[cs]
	__nacts =  _template_actions[__acts]
	__acts += 1
	while __nacts > 0
		__nacts -= 1
		__acts += 1
		case _template_actions[__acts - 1]
when 5 then
# line 52 "template.rl"
		begin

		raise ParseError.new("failed to parse expression", buffer, p)
			end
# line 606 "template.rb"
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

# line 81 "template.rl"
			
			if p != data.size
				raise ParseError.new("could not consume all input", buffer, p)
			end
			
			return nil
		end
	end
end
