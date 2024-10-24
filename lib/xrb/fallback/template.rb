# frozen_string_literal: true

# line 1 "lib/xrb/fallback/template.rl"
# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.


# line 80 "lib/xrb/fallback/template.rl"


require_relative '../error'

module XRB
	module Fallback
		
		# line 16 "lib/xrb/fallback/template.rb"
		class << self
			attr_accessor :_template_trans_keys
			private :_template_trans_keys, :_template_trans_keys=
		end
		self._template_trans_keys = [
			0, 0, 10, 60, 10, 123, 
			10, 63, 10, 114, 9, 
			60, 63, 63, 62, 62, 
			9, 32, 63, 63, 62, 62, 
			34, 125, 34, 35, 35, 
			125, 35, 125, 34, 39, 
			35, 125, 35, 125, 34, 123, 
			34, 123, 39, 39, 34, 
			125, 34, 125, 34, 125, 
			34, 35, 35, 125, 35, 125, 
			34, 39, 35, 125, 35, 
			125, 34, 123, 34, 123, 
			39, 39, 34, 125, 9, 60, 
			10, 60, 10, 60, 10, 
			123, 10, 63, 10, 114, 
			9, 60, 9, 60, 10, 63, 
			10, 114, 9, 60, 63, 
			63, 10, 123, 10, 63, 
			10, 114, 9, 60, 63, 63, 
			9, 32, 34, 39, 34, 
			35, 39, 39, 0, 0, 
			34, 39, 34, 35, 39, 39, 
			0, 0, 0
		]

		class << self
			attr_accessor :_template_key_spans
			private :_template_key_spans, :_template_key_spans=
		end
		self._template_key_spans = [
			0, 51, 114, 54, 105, 52, 1, 1, 
			24, 1, 1, 92, 2, 91, 91, 6, 
			91, 91, 90, 90, 1, 92, 92, 92, 
			2, 91, 91, 6, 91, 91, 90, 90, 
			1, 92, 52, 51, 51, 114, 54, 105, 
			52, 52, 54, 105, 52, 1, 114, 54, 
			105, 52, 1, 24, 6, 2, 1, 0, 
			6, 2, 1, 0
		]

		class << self
			attr_accessor :_template_index_offsets
			private :_template_index_offsets, :_template_index_offsets=
		end
		self._template_index_offsets = [
			0, 0, 52, 167, 222, 328, 381, 383, 
			385, 410, 412, 414, 507, 510, 602, 694, 
			701, 793, 885, 976, 1067, 1069, 1162, 1255, 
			1348, 1351, 1443, 1535, 1542, 1634, 1726, 1817, 
			1908, 1910, 2003, 2056, 2108, 2160, 2275, 2330, 
			2436, 2489, 2542, 2597, 2703, 2756, 2758, 2873, 
			2928, 3034, 3087, 3089, 3114, 3121, 3124, 3126, 
			3127, 3134, 3137, 3139
		]

		class << self
			attr_accessor :_template_indicies
			private :_template_indicies, :_template_indicies=
		end
		self._template_indicies = [
			2, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 3, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 4, 1, 2, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 3, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 4, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 0, 1, 2, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			3, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 4, 1, 1, 5, 1, 2, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 3, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			4, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 6, 1, 
			0, 0, 0, 0, 0, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 0, 
			1, 1, 3, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 4, 1, 9, 8, 10, 
			8, 10, 12, 10, 10, 10, 11, 11, 
			11, 11, 11, 11, 11, 11, 11, 11, 
			11, 11, 11, 11, 11, 11, 11, 11, 
			10, 11, 14, 13, 15, 13, 17, 16, 
			16, 16, 16, 18, 16, 16, 16, 16, 
			16, 16, 16, 16, 16, 16, 16, 16, 
			16, 16, 16, 16, 16, 16, 16, 16, 
			16, 16, 16, 16, 16, 16, 16, 16, 
			16, 16, 16, 16, 16, 16, 16, 16, 
			16, 16, 16, 16, 16, 16, 16, 16, 
			16, 16, 16, 16, 16, 16, 16, 16, 
			16, 16, 16, 16, 16, 16, 16, 16, 
			16, 16, 16, 16, 16, 16, 16, 16, 
			16, 16, 16, 16, 16, 16, 16, 16, 
			16, 16, 16, 16, 16, 16, 16, 19, 
			16, 20, 16, 21, 22, 17, 23, 21, 
			21, 21, 24, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 25, 21, 
			26, 21, 23, 21, 21, 21, 24, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 21, 21, 21, 21, 21, 21, 
			21, 21, 27, 21, 26, 21, 28, 29, 
			24, 24, 24, 28, 24, 30, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 31, 28, 32, 
			28, 30, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 33, 28, 32, 28, 28, 29, 24, 
			24, 24, 28, 24, 24, 24, 24, 24, 
			24, 24, 24, 24, 24, 24, 24, 24, 
			24, 24, 24, 24, 24, 24, 24, 24, 
			24, 24, 24, 24, 24, 24, 24, 24, 
			24, 24, 24, 24, 24, 24, 24, 24, 
			24, 24, 24, 24, 24, 24, 24, 24, 
			24, 24, 24, 24, 24, 24, 24, 24, 
			24, 24, 24, 24, 24, 24, 24, 24, 
			24, 24, 24, 24, 24, 24, 24, 24, 
			24, 24, 24, 24, 24, 24, 24, 24, 
			24, 24, 24, 24, 24, 24, 34, 24, 
			21, 22, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 17, 17, 17, 17, 17, 17, 17, 
			17, 35, 17, 36, 18, 24, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 37, 36, 
			38, 36, 40, 39, 39, 39, 39, 41, 
			39, 39, 39, 39, 39, 39, 39, 39, 
			39, 39, 39, 39, 39, 39, 39, 39, 
			39, 39, 39, 39, 39, 39, 39, 39, 
			39, 39, 39, 39, 39, 39, 39, 39, 
			39, 39, 39, 39, 39, 39, 39, 39, 
			39, 39, 39, 39, 39, 39, 39, 39, 
			39, 39, 39, 39, 39, 39, 39, 39, 
			39, 39, 39, 39, 39, 39, 39, 39, 
			39, 39, 39, 39, 39, 39, 39, 39, 
			39, 39, 39, 39, 39, 39, 39, 39, 
			39, 39, 39, 42, 39, 43, 39, 45, 
			44, 44, 44, 44, 46, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			47, 44, 48, 44, 49, 50, 45, 51, 
			49, 49, 49, 52, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 53, 
			49, 54, 49, 51, 49, 49, 49, 52, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 49, 49, 49, 49, 49, 
			49, 49, 49, 55, 49, 54, 49, 56, 
			57, 52, 52, 52, 56, 52, 58, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 59, 56, 
			60, 56, 58, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 56, 56, 56, 56, 56, 56, 
			56, 56, 61, 56, 60, 56, 56, 57, 
			52, 52, 52, 56, 52, 52, 52, 52, 
			52, 52, 52, 52, 52, 52, 52, 52, 
			52, 52, 52, 52, 52, 52, 52, 52, 
			52, 52, 52, 52, 52, 52, 52, 52, 
			52, 52, 52, 52, 52, 52, 52, 52, 
			52, 52, 52, 52, 52, 52, 52, 52, 
			52, 52, 52, 52, 52, 52, 52, 52, 
			52, 52, 52, 52, 52, 52, 52, 52, 
			52, 52, 52, 52, 52, 52, 52, 52, 
			52, 52, 52, 52, 52, 52, 52, 52, 
			52, 52, 52, 52, 52, 52, 52, 62, 
			52, 49, 50, 45, 45, 45, 45, 45, 
			45, 45, 45, 45, 45, 45, 45, 45, 
			45, 45, 45, 45, 45, 45, 45, 45, 
			45, 45, 45, 45, 45, 45, 45, 45, 
			45, 45, 45, 45, 45, 45, 45, 45, 
			45, 45, 45, 45, 45, 45, 45, 45, 
			45, 45, 45, 45, 45, 45, 45, 45, 
			45, 45, 45, 45, 45, 45, 45, 45, 
			45, 45, 45, 45, 45, 45, 45, 45, 
			45, 45, 45, 45, 45, 45, 45, 45, 
			45, 45, 45, 45, 45, 45, 45, 45, 
			45, 45, 63, 45, 64, 46, 52, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 65, 
			64, 66, 64, 68, 69, 68, 68, 68, 
			67, 67, 67, 67, 67, 67, 67, 67, 
			67, 67, 67, 67, 67, 67, 67, 67, 
			67, 67, 68, 67, 67, 70, 67, 67, 
			67, 67, 67, 67, 67, 67, 67, 67, 
			67, 67, 67, 67, 67, 67, 67, 67, 
			67, 67, 67, 67, 67, 67, 71, 67, 
			74, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 75, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 76, 73, 2, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 3, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 4, 1, 
			74, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 75, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 76, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 78, 73, 74, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 75, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 76, 73, 73, 
			79, 73, 74, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 75, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 76, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 80, 73, 78, 78, 78, 78, 
			78, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 78, 73, 73, 75, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 76, 
			73, 81, 74, 81, 81, 81, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			81, 73, 73, 75, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 82, 73, 74, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 75, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			76, 73, 73, 83, 73, 74, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 75, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 76, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 84, 73, 85, 
			85, 85, 85, 85, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 85, 73, 
			73, 75, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 76, 73, 9, 8, 74, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 75, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			76, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 87, 
			73, 74, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 75, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 76, 73, 73, 88, 73, 
			74, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 75, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 76, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			89, 73, 90, 90, 90, 90, 90, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 90, 73, 73, 75, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 73, 73, 73, 
			73, 73, 73, 73, 73, 76, 73, 14, 
			13, 10, 12, 10, 10, 10, 91, 91, 
			91, 91, 91, 91, 91, 91, 91, 91, 
			91, 91, 91, 91, 91, 91, 91, 91, 
			10, 91, 28, 29, 24, 24, 24, 28, 
			24, 21, 22, 17, 36, 18, 92, 56, 
			57, 52, 52, 52, 56, 52, 49, 50, 
			45, 64, 46, 92, 0
		]

		class << self
			attr_accessor :_template_trans_targs
			private :_template_trans_targs, :_template_trans_targs=
		end
		self._template_trans_targs = [
			34, 1, 36, 2, 3, 4, 5, 34, 
			6, 7, 8, 34, 34, 9, 10, 51, 
			11, 12, 20, 11, 55, 13, 19, 14, 
			15, 13, 53, 13, 16, 18, 17, 16, 
			52, 16, 15, 12, 21, 21, 54, 23, 
			24, 32, 23, 59, 23, 24, 32, 23, 
			59, 25, 31, 26, 27, 25, 57, 25, 
			28, 30, 29, 28, 56, 28, 27, 24, 
			33, 33, 58, 35, 41, 36, 46, 47, 
			34, 35, 36, 37, 38, 34, 34, 39, 
			40, 41, 42, 43, 44, 45, 34, 34, 
			48, 49, 50, 34, 0
		]

		class << self
			attr_accessor :_template_trans_actions
			private :_template_trans_actions, :_template_trans_actions=
		end
		self._template_trans_actions = [
			1, 0, 2, 0, 0, 0, 0, 3, 
			0, 4, 0, 5, 6, 0, 4, 7, 
			0, 0, 0, 9, 10, 0, 0, 0, 
			0, 9, 10, 11, 0, 0, 0, 9, 
			10, 11, 12, 12, 0, 9, 10, 14, 
			14, 14, 15, 16, 0, 0, 0, 9, 
			17, 0, 0, 0, 0, 9, 17, 11, 
			0, 0, 0, 9, 17, 11, 12, 12, 
			0, 9, 17, 20, 20, 21, 19, 19, 
			22, 0, 23, 24, 24, 25, 26, 0, 
			0, 0, 24, 0, 0, 27, 28, 29, 
			0, 0, 30, 31, 0
		]

		class << self
			attr_accessor :_template_to_state_actions
			private :_template_to_state_actions, :_template_to_state_actions=
		end
		self._template_to_state_actions = [
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 8, 8, 8, 0, 8, 
			8, 0, 0, 0, 0, 8, 8, 8, 
			8, 8, 0, 8, 8, 0, 0, 0, 
			0, 8, 8, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0
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
			0, 0, 18, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0
		]

		class << self
			attr_accessor :_template_eof_actions
			private :_template_eof_actions, :_template_eof_actions=
		end
		self._template_eof_actions = [
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 13, 13, 
			13, 13, 13, 13, 13, 13, 13, 13, 
			13, 13, 19, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0
		]

		class << self
			attr_accessor :_template_eof_trans
			private :_template_eof_trans, :_template_eof_trans=
		end
		self._template_eof_trans = [
			0, 1, 1, 1, 1, 1, 8, 8, 
			12, 8, 8, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 73, 78, 73, 73, 73, 
			73, 73, 73, 73, 73, 87, 73, 73, 
			73, 73, 87, 92, 0, 0, 0, 0, 
			0, 0, 0, 0
		]

		class << self
			attr_accessor :template_start
		end
		self.template_start = 34;
		class << self
			attr_accessor :template_first_final
		end
		self.template_first_final = 34;
		class << self
			attr_accessor :template_error
		end
		self.template_error = 0;

		class << self
			attr_accessor :template_en_parse_nested_expression
		end
		self.template_en_parse_nested_expression = 11;
		class << self
			attr_accessor :template_en_parse_expression
		end
		self.template_en_parse_expression = 22;
		class << self
			attr_accessor :template_en_main
		end
		self.template_en_main = 34;


		# line 87 "lib/xrb/fallback/template.rl"
		
		def self.parse_template(buffer, delegate)
			data = buffer.read
			bytes = data.bytes
							
			p = 0
			pe = eof = data.bytesize
			stack = []
							
			ts = te = nil
			act = nil
							
			expression_begin = expression_end = nil
			instruction_begin = instruction_end = nil
			text_begin = text_end = nil
			delimiter_begin = delimiter_end = nil
							
							
			# line 621 "lib/xrb/fallback/template.rb"
			begin
				p ||= 0
				pe ||= data.length
				cs = template_start
				top = 0
				ts = nil
				te = nil
				act = 0
			end

			# line 105 "lib/xrb/fallback/template.rl"
							
			# line 634 "lib/xrb/fallback/template.rb"
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
						case _template_from_state_actions[cs] 
						when 18 then
							# line 1 "NONE"
							begin
								ts = p
							end
							# line 662 "lib/xrb/fallback/template.rb"
						end
						_keys = cs << 1
						_inds = _template_index_offsets[cs]
						_slen = _template_key_spans[cs]
						_wide = ( bytes[p])
						_trans = if (   _slen > 0 && 
								_template_trans_keys[_keys] <= _wide && 
								_wide <= _template_trans_keys[_keys + 1] 
											) then
							_template_indicies[ _inds + _wide - _template_trans_keys[_keys] ] 
						else 
							_template_indicies[ _inds + _slen ]
						end
					end
					if _goto_level <= _eof_trans
						cs = _template_trans_targs[_trans]
						if _template_trans_actions[_trans] != 0
							case _template_trans_actions[_trans]
							when 4 then
								# line 11 "lib/xrb/fallback/template.rl"
								begin

									instruction_end = p
								end
							when 14 then
								# line 27 "lib/xrb/fallback/template.rl"
								begin

									expression_begin = p
								end
							when 20 then
								# line 43 "lib/xrb/fallback/template.rl"
								begin

									text_begin = p
								
									delimiter_begin = nil
									delimiter_end = nil
								end
							when 12 then
								# line 14 "parsers/xrb/template.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 11
										_goto_level = _again
										next
									end
								end
							when 9 then
								# line 18 "parsers/xrb/template.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 11
										_goto_level = _again
										next
									end
								end
							when 10 then
								# line 20 "parsers/xrb/template.rl"
								begin
									begin
										top -= 1
										cs = stack[top]
										_goto_level = _again
										next
									end
								end
							when 2 then
								# line 1 "NONE"
								begin
									te = p+1
								end
							when 6 then
								# line 19 "lib/xrb/fallback/template.rl"
								begin
									te = p+1
									begin 
										delegate.instruction(data.byteslice(instruction_begin...instruction_end), "\n")
									end
								end
							when 25 then
								# line 72 "lib/xrb/fallback/template.rl"
								begin
									te = p
									p = p - 1; begin 
										delegate.text(data.byteslice(ts...te))
									end
								end
							when 31 then
								# line 15 "lib/xrb/fallback/template.rl"
								begin
									te = p
									p = p - 1; begin 
										delegate.instruction(data.byteslice(instruction_begin...instruction_end))
									end
								end
							when 28 then
								# line 62 "lib/xrb/fallback/template.rl"
								begin
									te = p
									p = p - 1; begin 
										if delimiter_begin
											text_end = delimiter_begin
												
											p = delimiter_begin - 1;
										end
								
										delegate.text(data.byteslice(text_begin...text_end))
									end
								end
							when 1 then
								# line 72 "lib/xrb/fallback/template.rl"
								begin
									begin p = ((te))-1; end
									begin 
										delegate.text(data.byteslice(ts...te))
									end
								end
							when 5 then
								# line 1 "NONE"
								begin
									case act
									when 4 then
										begin begin p = ((te))-1; end

																delegate.instruction(data.byteslice(instruction_begin...instruction_end))
										end
									when 5 then
										begin begin p = ((te))-1; end

																if delimiter_begin
																	text_end = delimiter_begin
																	
																	p = delimiter_begin - 1;
																end
											
																delegate.text(data.byteslice(text_begin...text_end))
										end
									end 
								end
							when 3 then
								# line 23 "lib/xrb/fallback/template.rl"
								begin

									raise ParseError.new("failed to parse instruction", buffer, p)
								end
								# line 62 "lib/xrb/fallback/template.rl"
								begin
									begin p = ((te))-1; end
									begin 
										if delimiter_begin
											text_end = delimiter_begin
											
											p = delimiter_begin - 1;
										end
										
										delegate.text(data.byteslice(text_begin...text_end))
									end
								end
							when 15 then
								# line 27 "lib/xrb/fallback/template.rl"
								begin

									expression_begin = p
								end
								# line 18 "parsers/xrb/template.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 11
										_goto_level = _again
										next
									end
								end
							when 24 then
								# line 50 "lib/xrb/fallback/template.rl"
								begin

									text_end = p
								end
								# line 54 "lib/xrb/fallback/template.rl"
								begin

									delimiter_begin = p
								end
							when 26 then
								# line 58 "lib/xrb/fallback/template.rl"
								begin

									delimiter_end = p
								end
								# line 62 "lib/xrb/fallback/template.rl"
								begin
									te = p+1
									begin 
										if delimiter_begin
											text_end = delimiter_begin
											
											p = delimiter_begin - 1;
										end
										
										delegate.text(data.byteslice(text_begin...text_end))
									end
								end
							when 11 then
								# line 14 "parsers/xrb/template.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 11
										_goto_level = _again
										next
									end
								end
								# line 18 "parsers/xrb/template.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 11
										_goto_level = _again
										next
									end
								end
							when 7 then
								# line 1 "NONE"
								begin
									te = p+1
								end
								# line 15 "lib/xrb/fallback/template.rl"
								begin
						act = 4;		end
							when 29 then
								# line 58 "parsers/xrb/template.rl"
								begin
									te = p+1
									begin 	begin
										stack[top] = cs
										top+= 1
										cs = 22
										_goto_level = _again
										next
									end
									end
								end
								# line 58 "lib/xrb/fallback/template.rl"
								begin

									delimiter_end = p
								end
							when 17 then
								# line 31 "lib/xrb/fallback/template.rl"
								begin

									expression_end = p
								end
								# line 35 "lib/xrb/fallback/template.rl"
								begin

									delegate.expression(data.byteslice(expression_begin...expression_end))
								end
								# line 21 "parsers/xrb/template.rl"
								begin
									begin
										top -= 1
										cs = stack[top]
										_goto_level = _again
										next
									end
								end
							when 19 then
								# line 43 "lib/xrb/fallback/template.rl"
								begin

									text_begin = p
								
									delimiter_begin = nil
									delimiter_end = nil
								end
								# line 50 "lib/xrb/fallback/template.rl"
								begin

									text_end = p
								end
								# line 54 "lib/xrb/fallback/template.rl"
								begin

									delimiter_begin = p
								end
							when 22 then
								# line 50 "lib/xrb/fallback/template.rl"
								begin

									text_end = p
								end
								# line 54 "lib/xrb/fallback/template.rl"
								begin

									delimiter_begin = p
								end
								# line 62 "lib/xrb/fallback/template.rl"
								begin
									te = p
									p = p - 1; begin 
										if delimiter_begin
											text_end = delimiter_begin
												
											p = delimiter_begin - 1;
										end
								
										delegate.text(data.byteslice(text_begin...text_end))
									end
								end
							when 30 then
								# line 1 "NONE"
								begin
									te = p+1
								end
								# line 7 "lib/xrb/fallback/template.rl"
								begin

									instruction_begin = p
								end
								# line 58 "lib/xrb/fallback/template.rl"
								begin

									delimiter_end = p
								end
							when 23 then
								# line 1 "NONE"
								begin
									te = p+1
								end
								# line 50 "lib/xrb/fallback/template.rl"
								begin

									text_end = p
								end
								# line 54 "lib/xrb/fallback/template.rl"
								begin

									delimiter_begin = p
								end
							when 16 then
								# line 27 "lib/xrb/fallback/template.rl"
								begin

									expression_begin = p
								end
								# line 31 "lib/xrb/fallback/template.rl"
								begin

									expression_end = p
								end
								# line 35 "lib/xrb/fallback/template.rl"
								begin

									delegate.expression(data.byteslice(expression_begin...expression_end))
								end
								# line 21 "parsers/xrb/template.rl"
								begin
									begin
										top -= 1
										cs = stack[top]
										_goto_level = _again
										next
									end
								end
							when 27 then
								# line 1 "NONE"
								begin
									te = p+1
								end
								# line 7 "lib/xrb/fallback/template.rl"
								begin

									instruction_begin = p
								end
								# line 58 "lib/xrb/fallback/template.rl"
								begin

									delimiter_end = p
								end
								# line 62 "lib/xrb/fallback/template.rl"
								begin
						act = 5;		end
							when 21 then
								# line 1 "NONE"
								begin
									te = p+1
								end
								# line 43 "lib/xrb/fallback/template.rl"
								begin

									text_begin = p
								
									delimiter_begin = nil
									delimiter_end = nil
								end
								# line 50 "lib/xrb/fallback/template.rl"
								begin

									text_end = p
								end
								# line 54 "lib/xrb/fallback/template.rl"
								begin

									delimiter_begin = p
								end
								# line 1078 "lib/xrb/fallback/template.rb"
							end
						end
					end
					if _goto_level <= _again
						case _template_to_state_actions[cs] 
						when 8 then
							# line 1 "NONE"
							begin
					ts = nil;		end
							# line 1088 "lib/xrb/fallback/template.rb"
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
							case _template_eof_actions[cs]
							when 13 then
								# line 39 "lib/xrb/fallback/template.rl"
								begin

									raise ParseError.new("failed to parse expression", buffer, p)
								end
							when 19 then
								# line 43 "lib/xrb/fallback/template.rl"
								begin

									text_begin = p
								
									delimiter_begin = nil
									delimiter_end = nil
								end
								# line 50 "lib/xrb/fallback/template.rl"
								begin

									text_end = p
								end
								# line 54 "lib/xrb/fallback/template.rl"
								begin

									delimiter_begin = p
								end
								# line 1134 "lib/xrb/fallback/template.rb"
							end
						end

					end
					if _goto_level <= _out
						break
					end
				end
			end

			# line 106 "lib/xrb/fallback/template.rl"
							
			if p != eof
				raise ParseError.new("could not consume all input", buffer, p)
			end
							
			return nil
		end
	end
end
