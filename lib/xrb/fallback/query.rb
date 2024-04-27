
# line 1 "lib/xrb/fallback/query.rl"
# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.


# line 57 "lib/xrb/fallback/query.rl"


require_relative '../error'

module XRB
	module Fallback
		
		# line 16 "lib/xrb/fallback/query.rb"
		class << self
			attr_accessor :_query_trans_keys
			private :_query_trans_keys, :_query_trans_keys=
		end
		self._query_trans_keys = [
			0, 0, 48, 102, 48, 102, 
			37, 93, 37, 93, 48, 
			102, 48, 102, 37, 93, 
			37, 93, 48, 102, 48, 102, 
			37, 93, 37, 93, 37, 
			93, 37, 93, 37, 93, 
			38, 91, 38, 61, 0
		]

		class << self
			attr_accessor :_query_key_spans
			private :_query_key_spans, :_query_key_spans=
		end
		self._query_key_spans = [
			0, 55, 55, 57, 57, 55, 55, 57, 
			57, 55, 55, 57, 57, 57, 57, 57, 
			54, 24
		]

		class << self
			attr_accessor :_query_index_offsets
			private :_query_index_offsets, :_query_index_offsets=
		end
		self._query_index_offsets = [
			0, 0, 56, 112, 170, 228, 284, 340, 
			398, 456, 512, 568, 626, 684, 742, 800, 
			858, 913
		]

		class << self
			attr_accessor :_query_indicies
			private :_query_indicies, :_query_indicies=
		end
		self._query_indicies = [
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 1, 1, 1, 1, 1, 1, 
			1, 0, 0, 0, 0, 0, 0, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 0, 0, 0, 0, 0, 0, 1, 
			2, 2, 2, 2, 2, 2, 2, 2, 
			2, 2, 1, 1, 1, 1, 1, 1, 
			1, 2, 2, 2, 2, 2, 2, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 2, 2, 2, 2, 2, 2, 1, 
			4, 1, 3, 3, 3, 3, 5, 3, 
			3, 3, 3, 6, 6, 6, 6, 6, 
			6, 6, 6, 6, 6, 3, 3, 3, 
			1, 3, 3, 3, 3, 3, 3, 3, 
			3, 3, 3, 3, 3, 3, 3, 3, 
			3, 3, 3, 3, 3, 3, 3, 3, 
			3, 3, 3, 3, 3, 3, 1, 3, 
			1, 3, 7, 1, 2, 2, 2, 2, 
			8, 2, 2, 2, 2, 9, 9, 9, 
			9, 9, 9, 9, 9, 9, 9, 2, 
			2, 2, 1, 2, 2, 2, 2, 2, 
			2, 2, 2, 2, 2, 2, 2, 2, 
			2, 2, 2, 2, 2, 2, 2, 2, 
			2, 2, 2, 2, 2, 2, 2, 2, 
			1, 2, 1, 2, 10, 10, 10, 10, 
			10, 10, 10, 10, 10, 10, 1, 1, 
			1, 1, 1, 1, 1, 10, 10, 10, 
			10, 10, 10, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 10, 10, 10, 
			10, 10, 10, 1, 11, 11, 11, 11, 
			11, 11, 11, 11, 11, 11, 1, 1, 
			1, 1, 1, 1, 1, 11, 11, 11, 
			11, 11, 11, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 11, 11, 11, 
			11, 11, 11, 1, 13, 1, 12, 12, 
			12, 12, 14, 12, 12, 12, 12, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 12, 12, 12, 1, 12, 12, 12, 
			12, 12, 12, 12, 12, 12, 12, 12, 
			12, 12, 12, 12, 12, 12, 12, 12, 
			12, 12, 12, 12, 12, 12, 12, 12, 
			12, 12, 1, 12, 16, 12, 18, 1, 
			17, 17, 17, 17, 19, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 1, 17, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 1, 17, 20, 17, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 1, 1, 1, 1, 1, 1, 
			1, 21, 21, 21, 21, 21, 21, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 21, 21, 21, 21, 21, 21, 1, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 1, 1, 1, 1, 1, 1, 
			1, 17, 17, 17, 17, 17, 17, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 17, 17, 17, 17, 17, 17, 1, 
			18, 1, 17, 17, 17, 17, 19, 17, 
			17, 17, 17, 22, 22, 22, 22, 22, 
			22, 22, 22, 22, 22, 17, 17, 17, 
			1, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 1, 17, 
			23, 17, 4, 1, 3, 3, 3, 3, 
			5, 3, 3, 3, 3, 6, 6, 6, 
			6, 6, 6, 6, 6, 6, 6, 3, 
			3, 3, 1, 3, 3, 3, 3, 3, 
			3, 3, 3, 3, 3, 3, 3, 3, 
			3, 3, 3, 3, 3, 3, 3, 3, 
			3, 3, 3, 3, 3, 3, 3, 3, 
			1, 3, 1, 3, 7, 24, 2, 2, 
			2, 2, 8, 2, 2, 2, 2, 2, 
			2, 2, 2, 2, 2, 2, 2, 2, 
			2, 2, 2, 2, 25, 2, 2, 2, 
			2, 2, 2, 2, 2, 2, 2, 2, 
			2, 2, 2, 2, 2, 2, 2, 2, 
			2, 2, 2, 2, 2, 2, 2, 2, 
			2, 2, 26, 2, 1, 2, 28, 29, 
			27, 27, 27, 27, 30, 27, 27, 27, 
			27, 27, 27, 27, 27, 27, 27, 27, 
			27, 27, 27, 27, 27, 27, 1, 27, 
			27, 27, 27, 27, 27, 27, 27, 27, 
			27, 27, 27, 27, 27, 27, 27, 27, 
			27, 27, 27, 27, 27, 27, 27, 27, 
			27, 27, 27, 27, 1, 27, 1, 27, 
			31, 32, 11, 11, 11, 11, 33, 11, 
			11, 11, 11, 11, 11, 11, 11, 11, 
			11, 11, 11, 11, 11, 11, 11, 11, 
			1, 11, 11, 11, 11, 11, 11, 11, 
			11, 11, 11, 11, 11, 11, 11, 11, 
			11, 11, 11, 11, 11, 11, 11, 11, 
			11, 11, 11, 11, 11, 11, 1, 11, 
			1, 11, 34, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 35, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 36, 
			1, 37, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			38, 1, 0
		]

		class << self
			attr_accessor :_query_trans_targs
			private :_query_trans_targs, :_query_trans_targs=
		end
		self._query_trans_targs = [
			2, 0, 13, 13, 1, 13, 4, 1, 
			13, 4, 6, 15, 8, 9, 8, 11, 
			17, 8, 9, 8, 16, 10, 11, 16, 
			3, 14, 7, 15, 5, 3, 15, 5, 
			3, 15, 3, 14, 7, 3, 14
		]

		class << self
			attr_accessor :_query_trans_actions
			private :_query_trans_actions, :_query_trans_actions=
		end
		self._query_trans_actions = [
			0, 0, 0, 1, 2, 2, 3, 4, 
			4, 0, 0, 0, 1, 2, 2, 5, 
			0, 0, 4, 4, 6, 0, 0, 7, 
			8, 6, 6, 10, 11, 9, 11, 4, 
			12, 4, 13, 0, 0, 14, 15
		]

		class << self
			attr_accessor :_query_eof_actions
			private :_query_eof_actions, :_query_eof_actions=
		end
		self._query_eof_actions = [
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 8, 9, 12, 
			13, 14
		]

		class << self
			attr_accessor :query_start
		end
		self.query_start = 12;
		class << self
			attr_accessor :query_first_final
		end
		self.query_first_final = 12;
		class << self
			attr_accessor :query_error
		end
		self.query_error = 0;

		class << self
			attr_accessor :query_en_main
		end
		self.query_en_main = 12;


		# line 64 "lib/xrb/fallback/query.rl"
		
		def self.parse_query(buffer, delegate)
			data = buffer.read
			bytes = data.bytes
							
			p = 0
			pe = eof = data.bytesize
			stack = []
							
			string_begin = string_end = nil
			integer_begin = integer_end = nil
			value_begin = value_end = nil
			encoded = false
							
							
			# line 245 "lib/xrb/fallback/query.rb"
			begin
				p ||= 0
				pe ||= data.length
				cs = query_start
			end

			# line 79 "lib/xrb/fallback/query.rl"
							
			# line 254 "lib/xrb/fallback/query.rb"
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
								# line 7 "lib/xrb/fallback/query.rl"
								begin

									string_begin = p
								end
							when 6 then
								# line 11 "lib/xrb/fallback/query.rl"
								begin

									string_end = p
								
									delegate.string(data.byteslice(string_begin...string_end), encoded)
								
									encoded = false
								end
							when 7 then
								# line 23 "lib/xrb/fallback/query.rl"
								begin

									integer_end = p
								
									delegate.integer(data.byteslice(integer_begin...integer_end))
								end
							when 15 then
								# line 29 "lib/xrb/fallback/query.rl"
								begin

									delegate.append
								end
							when 10 then
								# line 33 "lib/xrb/fallback/query.rl"
								begin

									value_begin = p
								end
							when 13 then
								# line 45 "lib/xrb/fallback/query.rl"
								begin

									delegate.pair
								end
							when 4 then
								# line 49 "lib/xrb/fallback/query.rl"
								begin

									encoded = 1;
								end
							when 3 then
								# line 7 "lib/xrb/fallback/query.rl"
								begin

									string_begin = p
								end
								# line 19 "lib/xrb/fallback/query.rl"
								begin

									integer_begin = p
								end
							when 2 then
								# line 7 "lib/xrb/fallback/query.rl"
								begin

									string_begin = p
								end
								# line 49 "lib/xrb/fallback/query.rl"
								begin

									encoded = 1;
								end
							when 8 then
								# line 11 "lib/xrb/fallback/query.rl"
								begin

									string_end = p
								
									delegate.string(data.byteslice(string_begin...string_end), encoded)
								
									encoded = false
								end
								# line 45 "lib/xrb/fallback/query.rl"
								begin

									delegate.pair
								end
							when 5 then
								# line 19 "lib/xrb/fallback/query.rl"
								begin

									integer_begin = p
								end
								# line 7 "lib/xrb/fallback/query.rl"
								begin

									string_begin = p
								end
							when 14 then
								# line 29 "lib/xrb/fallback/query.rl"
								begin

									delegate.append
								end
								# line 45 "lib/xrb/fallback/query.rl"
								begin

									delegate.pair
								end
							when 11 then
								# line 33 "lib/xrb/fallback/query.rl"
								begin

									value_begin = p
								end
								# line 49 "lib/xrb/fallback/query.rl"
								begin

									encoded = 1;
								end
							when 12 then
								# line 37 "lib/xrb/fallback/query.rl"
								begin

									value_end = p
								
									delegate.assign(data.byteslice(value_begin...value_end), encoded)
								
									encoded = false
								end
								# line 45 "lib/xrb/fallback/query.rl"
								begin

									delegate.pair
								end
							when 9 then
								# line 33 "lib/xrb/fallback/query.rl"
								begin

									value_begin = p
								end
								# line 37 "lib/xrb/fallback/query.rl"
								begin

									value_end = p
								
									delegate.assign(data.byteslice(value_begin...value_end), encoded)
								
									encoded = false
								end
								# line 45 "lib/xrb/fallback/query.rl"
								begin

									delegate.pair
								end
								# line 444 "lib/xrb/fallback/query.rb"
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
							when 13 then
								# line 45 "lib/xrb/fallback/query.rl"
								begin

									delegate.pair
								end
							when 8 then
								# line 11 "lib/xrb/fallback/query.rl"
								begin

									string_end = p
												
									delegate.string(data.byteslice(string_begin...string_end), encoded)
												
									encoded = false
								end
								# line 45 "lib/xrb/fallback/query.rl"
								begin

									delegate.pair
								end
							when 14 then
								# line 29 "lib/xrb/fallback/query.rl"
								begin

									delegate.append
								end
								# line 45 "lib/xrb/fallback/query.rl"
								begin

									delegate.pair
								end
							when 12 then
								# line 37 "lib/xrb/fallback/query.rl"
								begin

									value_end = p
												
									delegate.assign(data.byteslice(value_begin...value_end), encoded)
												
									encoded = false
								end
								# line 45 "lib/xrb/fallback/query.rl"
								begin

									delegate.pair
								end
							when 9 then
								# line 33 "lib/xrb/fallback/query.rl"
								begin

									value_begin = p
								end
								# line 37 "lib/xrb/fallback/query.rl"
								begin

									value_end = p
												
									delegate.assign(data.byteslice(value_begin...value_end), encoded)
												
									encoded = false
								end
								# line 45 "lib/xrb/fallback/query.rl"
								begin

									delegate.pair
								end
								# line 529 "lib/xrb/fallback/query.rb"
							end
						end

					end
					if _goto_level <= _out
						break
					end
				end
			end

			# line 80 "lib/xrb/fallback/query.rl"
							
			if p != eof
				raise ParseError.new("could not consume all input", buffer, p)
			end
							
			return nil
		end
	end
end
