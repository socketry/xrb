
# line 1 "query.rl"
# Copyright, 2020, by Samuel G. D. Williams. <http://www.codeotaku.com>
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


# line 66 "query.rl"


require_relative '../error'

module Trenni
	module Fallback
		
# line 33 "query.rb"
class << self
	attr_accessor :_query_trans_keys
	private :_query_trans_keys, :_query_trans_keys=
end
self._query_trans_keys = [
	0, 0, 38, 93, 38, 93, 
	38, 93, 38, 93, 38, 
	93, 38, 93, 38, 93, 
	38, 93, 38, 93, 38, 91, 
	38, 61, 0
]

class << self
	attr_accessor :_query_key_spans
	private :_query_key_spans, :_query_key_spans=
end
self._query_key_spans = [
	0, 56, 56, 56, 56, 56, 56, 56, 
	56, 56, 54, 24
]

class << self
	attr_accessor :_query_index_offsets
	private :_query_index_offsets, :_query_index_offsets=
end
self._query_index_offsets = [
	0, 0, 57, 114, 171, 228, 285, 342, 
	399, 456, 513, 568
]

class << self
	attr_accessor :_query_indicies
	private :_query_indicies, :_query_indicies=
end
self._query_indicies = [
	1, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 2, 2, 2, 2, 2, 2, 
	2, 2, 2, 2, 0, 0, 0, 1, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 1, 0, 1, 
	0, 1, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 3, 3, 3, 
	1, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 1, 3, 
	1, 3, 1, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 6, 6, 6, 6, 
	6, 6, 6, 6, 6, 6, 5, 5, 
	5, 1, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 1, 
	5, 7, 5, 1, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	8, 8, 1, 8, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	1, 8, 9, 8, 1, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 10, 10, 
	10, 10, 10, 10, 10, 10, 10, 10, 
	8, 8, 8, 1, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	8, 1, 8, 11, 8, 1, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 2, 
	2, 2, 2, 2, 2, 2, 2, 2, 
	2, 0, 0, 0, 1, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 1, 0, 1, 0, 12, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 13, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 14, 3, 1, 3, 16, 
	15, 15, 15, 15, 15, 15, 15, 15, 
	15, 15, 15, 15, 15, 15, 15, 15, 
	15, 15, 15, 15, 15, 15, 1, 15, 
	15, 15, 15, 15, 15, 15, 15, 15, 
	15, 15, 15, 15, 15, 15, 15, 15, 
	15, 15, 15, 15, 15, 15, 15, 15, 
	15, 15, 15, 15, 1, 15, 1, 15, 
	18, 17, 17, 17, 17, 17, 17, 17, 
	17, 17, 17, 17, 17, 17, 17, 17, 
	17, 17, 17, 17, 17, 17, 17, 1, 
	17, 17, 17, 17, 17, 17, 17, 17, 
	17, 17, 17, 17, 17, 17, 17, 17, 
	17, 17, 17, 17, 17, 17, 17, 17, 
	17, 17, 17, 17, 17, 1, 17, 1, 
	17, 19, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	20, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 21, 1, 
	22, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 23, 
	1, 0
]

class << self
	attr_accessor :_query_trans_targs
	private :_query_trans_targs, :_query_trans_targs=
end
self._query_trans_targs = [
	7, 0, 2, 7, 2, 4, 5, 11, 
	4, 10, 5, 10, 1, 8, 3, 9, 
	1, 9, 1, 1, 8, 3, 1, 8
]

class << self
	attr_accessor :_query_trans_actions
	private :_query_trans_actions, :_query_trans_actions=
end
self._query_trans_actions = [
	1, 0, 2, 0, 0, 1, 3, 0, 
	0, 4, 0, 5, 6, 4, 4, 8, 
	7, 0, 9, 10, 0, 0, 11, 12
]

class << self
	attr_accessor :_query_eof_actions
	private :_query_eof_actions, :_query_eof_actions=
end
self._query_eof_actions = [
	0, 0, 0, 0, 0, 0, 0, 6, 
	7, 9, 10, 11
]

class << self
	attr_accessor :query_start
end
self.query_start = 6;
class << self
	attr_accessor :query_first_final
end
self.query_first_final = 6;
class << self
	attr_accessor :query_error
end
self.query_error = 0;

class << self
	attr_accessor :query_en_main
end
self.query_en_main = 6;


# line 73 "query.rl"
		
		def self.parse_query(buffer, delegate)
			data = buffer.read
			bytes = data.bytes
			
			p = 0
			pe = eof = data.bytesize
			stack = []
			
			string_begin = string_end = nil
			integer_begin = integer_end = nil
			value_begin = value_end = nil
			
			
# line 209 "query.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = query_start
end

# line 87 "query.rl"
			
# line 218 "query.rb"
begin
	testEof = false
	_slen, _trans, _keys, _inds, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
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
	_keys = cs << 1
	_inds = _query_index_offsets[cs]
	_slen = _query_key_spans[cs]
	_wide = ( bytes[p])
	_trans = if (   _slen > 0 && 
			_query_trans_keys[_keys] <= _wide && 
			_wide <= _query_trans_keys[_keys + 1] 
		    ) then
			_query_indicies[ _inds + _wide - _query_trans_keys[_keys] ] 
		 else 
			_query_indicies[ _inds + _slen ]
		 end
	cs = _query_trans_targs[_trans]
	if _query_trans_actions[_trans] != 0
	case _query_trans_actions[_trans]
	when 1 then
# line 24 "query.rl"
		begin

		string_begin = p
			end
	when 4 then
# line 28 "query.rl"
		begin

		string_end = p
		
		delegate.string(data.byteslice(string_begin...string_end))
			end
	when 5 then
# line 38 "query.rl"
		begin

		integer_end = p
		
		delegate.integer(data.byteslice(integer_begin...integer_end))
			end
	when 12 then
# line 44 "query.rl"
		begin

		delegate.append
			end
	when 8 then
# line 48 "query.rl"
		begin

		value_begin = p
			end
	when 10 then
# line 58 "query.rl"
		begin

		delegate.pair
			end
	when 2 then
# line 24 "query.rl"
		begin

		string_begin = p
			end
# line 34 "query.rl"
		begin

		integer_begin = p
			end
	when 6 then
# line 28 "query.rl"
		begin

		string_end = p
		
		delegate.string(data.byteslice(string_begin...string_end))
			end
# line 58 "query.rl"
		begin

		delegate.pair
			end
	when 3 then
# line 34 "query.rl"
		begin

		integer_begin = p
			end
# line 24 "query.rl"
		begin

		string_begin = p
			end
	when 11 then
# line 44 "query.rl"
		begin

		delegate.append
			end
# line 58 "query.rl"
		begin

		delegate.pair
			end
	when 9 then
# line 52 "query.rl"
		begin

		value_end = p
		
		delegate.assign(data.byteslice(value_begin...value_end))
			end
# line 58 "query.rl"
		begin

		delegate.pair
			end
	when 7 then
# line 48 "query.rl"
		begin

		value_begin = p
			end
# line 52 "query.rl"
		begin

		value_end = p
		
		delegate.assign(data.byteslice(value_begin...value_end))
			end
# line 58 "query.rl"
		begin

		delegate.pair
			end
# line 372 "query.rb"
	end
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
	  case _query_eof_actions[cs]
	when 10 then
# line 58 "query.rl"
		begin

		delegate.pair
			end
	when 6 then
# line 28 "query.rl"
		begin

		string_end = p
		
		delegate.string(data.byteslice(string_begin...string_end))
			end
# line 58 "query.rl"
		begin

		delegate.pair
			end
	when 11 then
# line 44 "query.rl"
		begin

		delegate.append
			end
# line 58 "query.rl"
		begin

		delegate.pair
			end
	when 9 then
# line 52 "query.rl"
		begin

		value_end = p
		
		delegate.assign(data.byteslice(value_begin...value_end))
			end
# line 58 "query.rl"
		begin

		delegate.pair
			end
	when 7 then
# line 48 "query.rl"
		begin

		value_begin = p
			end
# line 52 "query.rl"
		begin

		value_end = p
		
		delegate.assign(data.byteslice(value_begin...value_end))
			end
# line 58 "query.rl"
		begin

		delegate.pair
			end
# line 451 "query.rb"
	  end
	end

	end
	if _goto_level <= _out
		break
	end
end
	end

# line 88 "query.rl"
			
			if p != eof
				raise ParseError.new("could not consume all input", buffer, p)
			end
			
			return nil
		end
	end
end
