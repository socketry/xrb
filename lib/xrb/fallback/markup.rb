# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

# line 190 "lib/xrb/fallback/markup.rl"


require_relative "../error"

module XRB
	module Fallback
		
		# line 16 "lib/xrb/fallback/markup.rb"
		class << self
			attr_accessor :_markup_trans_keys
			private :_markup_trans_keys, :_markup_trans_keys=
		end
		self._markup_trans_keys = [
			0, 0, 0, 127, 0, 127, 
			0, 127, 0, 127, 62, 
			62, 34, 39, 34, 60, 
			34, 60, 9, 62, 34, 60, 
			9, 62, 38, 60, 38, 
			60, 38, 60, 45, 91, 
			45, 45, 45, 45, 45, 45, 
			45, 62, 79, 79, 67, 
			67, 84, 84, 89, 89, 
			80, 80, 69, 69, 62, 62, 
			67, 67, 68, 68, 65, 
			65, 84, 84, 65, 65, 
			91, 91, 93, 93, 93, 93, 
			62, 93, 0, 127, 0, 
			127, 0, 127, 0, 127, 
			63, 63, 62, 63, 35, 122, 
			48, 120, 48, 59, 48, 
			102, 48, 102, 48, 122, 
			38, 60, 38, 60, 38, 60, 
			38, 60, 38, 60, 38, 
			60, 38, 60, 38, 60, 
			38, 60, 0, 0, 0
		]

		class << self
			attr_accessor :_markup_key_spans
			private :_markup_key_spans, :_markup_key_spans=
		end
		self._markup_key_spans = [
			0, 128, 128, 128, 128, 1, 6, 27, 
			27, 54, 27, 54, 23, 23, 23, 47, 
			1, 1, 1, 18, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 32, 128, 128, 128, 128, 
			1, 2, 88, 73, 12, 55, 55, 75, 
			23, 23, 23, 23, 23, 23, 23, 23, 
			23, 0
		]

		class << self
			attr_accessor :_markup_index_offsets
			private :_markup_index_offsets, :_markup_index_offsets=
		end
		self._markup_index_offsets = [
			0, 0, 129, 258, 387, 516, 518, 525, 
			553, 581, 636, 664, 719, 743, 767, 791, 
			839, 841, 843, 845, 864, 866, 868, 870, 
			872, 874, 876, 878, 880, 882, 884, 886, 
			888, 890, 892, 894, 927, 1056, 1185, 1314, 
			1443, 1445, 1448, 1537, 1611, 1624, 1680, 1736, 
			1812, 1836, 1860, 1884, 1908, 1932, 1956, 1980, 
			2004, 2028
		]

		class << self
			attr_accessor :_markup_indicies
			private :_markup_indicies, :_markup_indicies=
		end
		self._markup_indicies = [
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 2, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 0, 0, 3, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 1, 1, 1, 1, 4, 
			1, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 1, 1, 1, 1, 0, 
			1, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 1, 1, 1, 1, 1, 
			0, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 6, 6, 6, 6, 6, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 6, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 5, 5, 
			7, 5, 5, 5, 5, 5, 5, 5, 
			5, 5, 5, 5, 1, 1, 1, 8, 
			1, 1, 5, 5, 5, 5, 5, 5, 
			5, 5, 5, 5, 5, 5, 5, 5, 
			5, 5, 5, 5, 5, 5, 5, 5, 
			5, 5, 5, 5, 1, 1, 1, 1, 
			5, 1, 5, 5, 5, 5, 5, 5, 
			5, 5, 5, 5, 5, 5, 5, 5, 
			5, 5, 5, 5, 5, 5, 5, 5, 
			5, 5, 5, 5, 1, 1, 1, 1, 
			1, 5, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 10, 10, 10, 10, 10, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 10, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 9, 
			9, 11, 9, 9, 9, 9, 9, 9, 
			9, 9, 9, 9, 9, 1, 1, 1, 
			12, 1, 1, 9, 9, 9, 9, 9, 
			9, 9, 9, 9, 9, 9, 9, 9, 
			9, 9, 9, 9, 9, 9, 9, 9, 
			9, 9, 9, 9, 9, 1, 1, 1, 
			1, 9, 1, 9, 9, 9, 9, 9, 
			9, 9, 9, 9, 9, 9, 9, 9, 
			9, 9, 9, 9, 9, 9, 9, 9, 
			9, 9, 9, 9, 9, 1, 1, 1, 
			1, 1, 9, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 14, 14, 14, 14, 
			14, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 14, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			13, 13, 15, 13, 13, 13, 13, 13, 
			13, 13, 13, 13, 13, 13, 1, 1, 
			16, 17, 1, 1, 13, 13, 13, 13, 
			13, 13, 13, 13, 13, 13, 13, 13, 
			13, 13, 13, 13, 13, 13, 13, 13, 
			13, 13, 13, 13, 13, 13, 1, 1, 
			1, 1, 13, 1, 13, 13, 13, 13, 
			13, 13, 13, 13, 13, 13, 13, 13, 
			13, 13, 13, 13, 13, 13, 13, 13, 
			13, 13, 13, 13, 13, 13, 1, 1, 
			1, 1, 1, 13, 12, 1, 18, 1, 
			1, 1, 1, 19, 1, 21, 20, 20, 
			20, 22, 20, 20, 20, 20, 20, 20, 
			20, 20, 20, 20, 20, 20, 20, 20, 
			20, 20, 20, 20, 20, 20, 20, 1, 
			20, 24, 23, 23, 23, 25, 23, 23, 
			23, 23, 23, 23, 23, 23, 23, 23, 
			23, 23, 23, 23, 23, 23, 23, 23, 
			23, 23, 23, 1, 23, 26, 26, 26, 
			26, 26, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 26, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 27, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 28, 1, 30, 29, 29, 29, 
			31, 29, 29, 29, 29, 29, 29, 29, 
			29, 29, 29, 29, 29, 29, 29, 29, 
			29, 29, 29, 29, 29, 29, 1, 29, 
			32, 32, 32, 32, 32, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 32, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 33, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 34, 1, 36, 
			21, 35, 35, 35, 35, 35, 35, 35, 
			35, 35, 35, 35, 35, 35, 35, 35, 
			35, 35, 35, 35, 35, 1, 35, 38, 
			24, 37, 37, 37, 37, 37, 37, 37, 
			37, 37, 37, 37, 37, 37, 37, 37, 
			37, 37, 37, 37, 37, 1, 37, 40, 
			30, 39, 39, 39, 39, 39, 39, 39, 
			39, 39, 39, 39, 39, 39, 39, 39, 
			39, 39, 39, 39, 39, 1, 39, 41, 
			42, 42, 42, 42, 42, 42, 42, 42, 
			42, 42, 42, 42, 42, 42, 42, 42, 
			42, 42, 42, 42, 42, 42, 43, 42, 
			42, 42, 42, 42, 42, 42, 42, 42, 
			42, 42, 42, 42, 42, 42, 42, 42, 
			42, 42, 42, 42, 42, 44, 42, 45, 
			42, 46, 45, 47, 45, 47, 45, 45, 
			45, 45, 45, 45, 45, 45, 45, 45, 
			45, 45, 45, 45, 45, 45, 48, 45, 
			49, 42, 50, 42, 51, 42, 52, 42, 
			53, 42, 54, 42, 55, 54, 56, 42, 
			57, 42, 58, 42, 59, 42, 60, 42, 
			61, 42, 62, 61, 63, 61, 64, 61, 
			61, 61, 61, 61, 61, 61, 61, 61, 
			61, 61, 61, 61, 61, 61, 61, 61, 
			61, 61, 61, 61, 61, 61, 61, 61, 
			61, 61, 61, 61, 61, 63, 61, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 65, 65, 1, 65, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 65, 1, 1, 1, 1, 1, 1, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 65, 1, 1, 1, 1, 65, 1, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 65, 1, 1, 1, 1, 1, 65, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 66, 66, 1, 
			66, 66, 66, 66, 66, 66, 66, 66, 
			66, 66, 66, 1, 1, 1, 67, 1, 
			1, 66, 66, 66, 66, 66, 66, 66, 
			66, 66, 66, 66, 66, 66, 66, 66, 
			66, 66, 66, 66, 66, 66, 66, 66, 
			66, 66, 66, 1, 1, 1, 1, 66, 
			1, 66, 66, 66, 66, 66, 66, 66, 
			66, 66, 66, 66, 66, 66, 66, 66, 
			66, 66, 66, 66, 66, 66, 66, 66, 
			66, 66, 66, 1, 1, 1, 1, 1, 
			66, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 68, 68, 
			69, 68, 68, 68, 68, 68, 68, 68, 
			68, 68, 68, 68, 69, 69, 69, 69, 
			69, 69, 68, 68, 68, 68, 68, 68, 
			68, 68, 68, 68, 68, 68, 68, 68, 
			68, 68, 68, 68, 68, 68, 68, 68, 
			68, 68, 68, 68, 69, 69, 69, 69, 
			68, 69, 68, 68, 68, 68, 68, 68, 
			68, 68, 68, 68, 68, 68, 68, 68, 
			68, 68, 68, 68, 68, 68, 68, 68, 
			68, 68, 68, 68, 69, 69, 69, 69, 
			69, 68, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 71, 71, 71, 71, 71, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 71, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 70, 
			70, 69, 70, 70, 70, 70, 70, 70, 
			70, 70, 70, 70, 70, 69, 69, 69, 
			69, 69, 69, 70, 70, 70, 70, 70, 
			70, 70, 70, 70, 70, 70, 70, 70, 
			70, 70, 70, 70, 70, 70, 70, 70, 
			70, 70, 70, 70, 70, 69, 69, 69, 
			69, 70, 69, 70, 70, 70, 70, 70, 
			70, 70, 70, 70, 70, 70, 70, 70, 
			70, 70, 70, 70, 70, 70, 70, 70, 
			70, 70, 70, 70, 70, 69, 69, 69, 
			69, 69, 70, 73, 72, 74, 73, 72, 
			76, 75, 75, 75, 75, 75, 75, 75, 
			75, 75, 75, 75, 75, 77, 77, 77, 
			77, 77, 77, 77, 77, 77, 77, 75, 
			75, 75, 75, 75, 75, 75, 77, 77, 
			77, 77, 77, 77, 77, 77, 77, 77, 
			77, 77, 77, 77, 77, 77, 77, 77, 
			77, 77, 77, 77, 77, 77, 77, 77, 
			75, 75, 75, 75, 75, 75, 77, 77, 
			77, 77, 77, 77, 77, 77, 77, 77, 
			77, 77, 77, 77, 77, 77, 77, 77, 
			77, 77, 77, 77, 77, 77, 77, 77, 
			75, 78, 78, 78, 78, 78, 78, 78, 
			78, 78, 78, 75, 75, 75, 75, 75, 
			75, 75, 75, 75, 75, 75, 75, 75, 
			75, 75, 75, 75, 75, 75, 75, 75, 
			75, 75, 75, 75, 75, 75, 75, 75, 
			75, 75, 75, 75, 75, 75, 75, 75, 
			75, 75, 75, 75, 75, 75, 75, 75, 
			75, 75, 75, 75, 75, 75, 75, 75, 
			75, 75, 75, 75, 75, 75, 75, 75, 
			75, 79, 75, 80, 80, 80, 80, 80, 
			80, 80, 80, 80, 80, 75, 81, 75, 
			82, 82, 82, 82, 82, 82, 82, 82, 
			82, 82, 75, 75, 75, 75, 75, 75, 
			75, 82, 82, 82, 82, 82, 82, 75, 
			75, 75, 75, 75, 75, 75, 75, 75, 
			75, 75, 75, 75, 75, 75, 75, 75, 
			75, 75, 75, 75, 75, 75, 75, 75, 
			75, 82, 82, 82, 82, 82, 82, 75, 
			83, 83, 83, 83, 83, 83, 83, 83, 
			83, 83, 75, 84, 75, 75, 75, 75, 
			75, 83, 83, 83, 83, 83, 83, 75, 
			75, 75, 75, 75, 75, 75, 75, 75, 
			75, 75, 75, 75, 75, 75, 75, 75, 
			75, 75, 75, 75, 75, 75, 75, 75, 
			75, 83, 83, 83, 83, 83, 83, 75, 
			85, 85, 85, 85, 85, 85, 85, 85, 
			85, 85, 75, 86, 75, 75, 75, 75, 
			75, 85, 85, 85, 85, 85, 85, 85, 
			85, 85, 85, 85, 85, 85, 85, 85, 
			85, 85, 85, 85, 85, 85, 85, 85, 
			85, 85, 85, 75, 75, 75, 75, 75, 
			75, 85, 85, 85, 85, 85, 85, 85, 
			85, 85, 85, 85, 85, 85, 85, 85, 
			85, 85, 85, 85, 85, 85, 85, 85, 
			85, 85, 85, 75, 88, 87, 87, 87, 
			87, 87, 87, 87, 87, 87, 87, 87, 
			87, 87, 87, 87, 87, 87, 87, 87, 
			87, 87, 89, 87, 91, 90, 90, 90, 
			90, 90, 90, 90, 90, 90, 90, 90, 
			90, 90, 90, 90, 90, 90, 90, 90, 
			90, 90, 92, 90, 94, 93, 93, 93, 
			93, 93, 93, 93, 93, 93, 93, 93, 
			93, 93, 93, 93, 93, 93, 93, 93, 
			93, 93, 95, 93, 97, 96, 96, 96, 
			96, 96, 96, 96, 96, 96, 96, 96, 
			96, 96, 96, 96, 96, 96, 96, 96, 
			96, 96, 98, 96, 100, 99, 99, 99, 
			99, 99, 99, 99, 99, 99, 99, 99, 
			99, 99, 99, 99, 99, 99, 99, 99, 
			99, 99, 101, 99, 103, 102, 102, 102, 
			102, 102, 102, 102, 102, 102, 102, 102, 
			102, 102, 102, 102, 102, 102, 102, 102, 
			102, 102, 104, 102, 106, 105, 105, 105, 
			105, 105, 105, 105, 105, 105, 105, 105, 
			105, 105, 105, 105, 105, 105, 105, 105, 
			105, 105, 107, 105, 109, 108, 108, 108, 
			108, 108, 108, 108, 108, 108, 108, 108, 
			108, 108, 108, 108, 108, 108, 108, 108, 
			108, 108, 110, 108, 112, 111, 111, 111, 
			111, 111, 111, 111, 111, 111, 111, 111, 
			111, 111, 111, 111, 111, 111, 111, 111, 
			111, 111, 113, 111, 42, 0
		]

		class << self
			attr_accessor :_markup_trans_targs
			private :_markup_trans_targs, :_markup_trans_targs=
		end
		self._markup_trans_targs = [
			2, 0, 15, 36, 38, 2, 3, 5, 
			51, 4, 3, 5, 51, 4, 3, 5, 
			6, 51, 7, 12, 8, 11, 10, 8, 
			9, 10, 3, 5, 51, 8, 9, 10, 
			3, 5, 51, 13, 14, 13, 14, 13, 
			14, 16, 0, 20, 27, 17, 18, 19, 
			52, 21, 22, 23, 24, 25, 26, 53, 
			28, 29, 30, 31, 32, 33, 34, 35, 
			54, 37, 37, 55, 39, 0, 39, 40, 
			40, 41, 56, 0, 43, 47, 44, 45, 
			44, 57, 46, 46, 57, 47, 57, 49, 
			50, 1, 49, 50, 1, 49, 50, 1, 
			49, 50, 1, 49, 50, 1, 49, 50, 
			1, 49, 50, 1, 49, 50, 1, 49, 
			50, 1
		]

		class << self
			attr_accessor :_markup_trans_actions
			private :_markup_trans_actions, :_markup_trans_actions=
		end
		self._markup_trans_actions = [
			2, 1, 0, 0, 0, 0, 3, 4, 
			3, 5, 0, 6, 0, 0, 7, 8, 
			9, 7, 0, 0, 10, 0, 11, 0, 
			12, 13, 14, 15, 14, 16, 17, 18, 
			19, 20, 19, 10, 11, 0, 13, 16, 
			18, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 2, 0, 9, 2, 24, 0, 25, 
			0, 26, 0, 27, 0, 28, 28, 0, 
			0, 29, 28, 0, 30, 0, 31, 32, 
			33, 34, 0, 13, 36, 16, 18, 38, 
			40, 41, 42, 44, 45, 46, 48, 49, 
			50, 52, 53, 54, 56, 57, 58, 60, 
			61, 62
		]

		class << self
			attr_accessor :_markup_eof_actions
			private :_markup_eof_actions, :_markup_eof_actions=
		end
		self._markup_eof_actions = [
			0, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 0, 
			0, 21, 21, 21, 0, 0, 0, 0, 
			0, 0, 22, 0, 0, 0, 0, 0, 
			0, 23, 23, 23, 1, 1, 24, 24, 
			24, 24, 27, 27, 27, 27, 27, 27, 
			0, 35, 37, 39, 43, 47, 51, 55, 
			59, 0
		]

		class << self
			attr_accessor :markup_start
		end
		self.markup_start = 48;
		class << self
			attr_accessor :markup_first_final
		end
		self.markup_first_final = 48;
		class << self
			attr_accessor :markup_error
		end
		self.markup_error = 0;

		class << self
			attr_accessor :markup_en_parse_entity
		end
		self.markup_en_parse_entity = 42;
		class << self
			attr_accessor :markup_en_main
		end
		self.markup_en_main = 48;


		# line 197 "lib/xrb/fallback/markup.rl"
		
		def self.parse_markup(buffer, delegate, entities)
			data = buffer.read
			bytes = data.bytes
			encoding = data.encoding
							
			p = 0
			# Must set pe here or it gets incorrectly set to data.length
			pe = eof = data.bytesize
			stack = []
							
			pcdata = nil
			characters_begin = characters_end = nil
			entity_begin = entity_end = nil
			identifier_begin = identifier_end = nil
			doctype_begin = doctype_end = nil
			comment_begin = comment_end = nil
			instruction_begin = instruction_end = nil
			cdata_begin = cdata_end = nil
			has_entities = has_value = false
							
							
			# line 442 "lib/xrb/fallback/markup.rb"
			begin
				p ||= 0
				pe ||= data.length
				cs = markup_start
				top = 0
			end

			# line 219 "lib/xrb/fallback/markup.rl"
							
			# line 452 "lib/xrb/fallback/markup.rb"
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
						_inds = _markup_index_offsets[cs]
						_slen = _markup_key_spans[cs]
						_wide = ( bytes[p])
						_trans = if (   _slen > 0 && 
								_markup_trans_keys[_keys] <= _wide && 
								_wide <= _markup_trans_keys[_keys + 1] 
											) then
							_markup_indicies[ _inds + _wide - _markup_trans_keys[_keys] ] 
						else 
							_markup_indicies[ _inds + _slen ]
						end
						cs = _markup_trans_targs[_trans]
						if _markup_trans_actions[_trans] != 0
							case _markup_trans_actions[_trans]
							when 2 then
								# line 7 "lib/xrb/fallback/markup.rl"
								begin

									identifier_begin = p
								end
							when 9 then
								# line 11 "lib/xrb/fallback/markup.rl"
								begin

									identifier_end = p
								end
							when 17 then
								# line 20 "lib/xrb/fallback/markup.rl"
								begin

								end
							when 16 then
								# line 32 "lib/xrb/fallback/markup.rl"
								begin

									characters_begin = p
								end
							when 27 then
								# line 42 "lib/xrb/fallback/markup.rl"
								begin

									raise ParseError.new("could not parse entity", buffer, p)
								end
							when 28 then
								# line 46 "lib/xrb/fallback/markup.rl"
								begin

									entity_begin = p
								end
							when 26 then
								# line 108 "lib/xrb/fallback/markup.rl"
								begin

								end
							when 24 then
								# line 115 "lib/xrb/fallback/markup.rl"
								begin

									raise ParseError.new("could not parse instruction", buffer, p)
								end
							when 6 then
								# line 128 "lib/xrb/fallback/markup.rl"
								begin

									self_closing = true
								end
							when 1 then
								# line 168 "lib/xrb/fallback/markup.rl"
								begin

									raise ParseError.new("could not parse tag", buffer, p)
								end
							when 18 then
								# line 10 "parsers/xrb/entities.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 42
										_goto_level = _again
										next
									end
								end
							when 25 then
								# line 11 "lib/xrb/fallback/markup.rl"
								begin

									identifier_end = p
								end
								# line 105 "lib/xrb/fallback/markup.rl"
								begin

								end
							when 3 then
								# line 11 "lib/xrb/fallback/markup.rl"
								begin

									identifier_end = p
								end
								# line 119 "lib/xrb/fallback/markup.rl"
								begin

									self_closing = false
								
									delegate.open_tag_begin(data.byteslice(identifier_begin...identifier_end), identifier_begin)
								end
							when 7 then
								# line 11 "lib/xrb/fallback/markup.rl"
								begin

									identifier_end = p
								end
								# line 145 "lib/xrb/fallback/markup.rl"
								begin

									if has_value
										pcdata = MarkupString.raw(pcdata) unless has_entities
										
										value = pcdata
									else
										value = true
									end
								
									delegate.attribute(data.byteslice(identifier_begin...identifier_end), value)
								end
							when 10 then
								# line 15 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = String.new(encoding: encoding)
									has_entities = false
								end
								# line 32 "lib/xrb/fallback/markup.rl"
								begin

									characters_begin = p
								end
							when 11 then
								# line 15 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = String.new(encoding: encoding)
									has_entities = false
								end
								# line 10 "parsers/xrb/entities.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 42
										_goto_level = _again
										next
									end
								end
							when 12 then
								# line 36 "lib/xrb/fallback/markup.rl"
								begin

									characters_end = p
								
									pcdata << data.byteslice(characters_begin...characters_end)
								end
								# line 20 "lib/xrb/fallback/markup.rl"
								begin

								end
							when 13 then
								# line 36 "lib/xrb/fallback/markup.rl"
								begin

									characters_end = p
								
									pcdata << data.byteslice(characters_begin...characters_end)
								end
								# line 10 "parsers/xrb/entities.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 42
										_goto_level = _again
										next
									end
								end
							when 31 then
								# line 50 "lib/xrb/fallback/markup.rl"
								begin

									entity_end = p
								
									name = data.byteslice(entity_begin...entity_end)
								
									has_entities = true
									pcdata << entities[name]
								end
								# line 8 "parsers/xrb/entities.rl"
								begin
									begin
										top -= 1
										cs = stack[top]
										_goto_level = _again
										next
									end
								end
							when 30 then
								# line 59 "lib/xrb/fallback/markup.rl"
								begin

									entity_end = p
								
									has_entities = true
									pcdata << data.byteslice(entity_begin...entity_end).to_i(16)
								end
								# line 8 "parsers/xrb/entities.rl"
								begin
									begin
										top -= 1
										cs = stack[top]
										_goto_level = _again
										next
									end
								end
							when 29 then
								# line 66 "lib/xrb/fallback/markup.rl"
								begin

									entity_end = p
								
									has_entities = true
									pcdata << data.byteslice(entity_begin...entity_end).to_i(10)
								end
								# line 8 "parsers/xrb/entities.rl"
								begin
									begin
										top -= 1
										cs = stack[top]
										_goto_level = _again
										next
									end
								end
							when 5 then
								# line 132 "lib/xrb/fallback/markup.rl"
								begin

									has_value = false
									pcdata = String.new(encoding: encoding)
								end
								# line 7 "lib/xrb/fallback/markup.rl"
								begin

									identifier_begin = p
								end
							when 14 then
								# line 137 "lib/xrb/fallback/markup.rl"
								begin

									has_value = true
								end
								# line 145 "lib/xrb/fallback/markup.rl"
								begin

									if has_value
										pcdata = MarkupString.raw(pcdata) unless has_entities
										
										value = pcdata
									else
										value = true
									end
								
									delegate.attribute(data.byteslice(identifier_begin...identifier_end), value)
								end
							when 19 then
								# line 141 "lib/xrb/fallback/markup.rl"
								begin

									has_value = true
								end
								# line 145 "lib/xrb/fallback/markup.rl"
								begin

									if has_value
										pcdata = MarkupString.raw(pcdata) unless has_entities
										
										value = pcdata
									else
										value = true
									end
								
									delegate.attribute(data.byteslice(identifier_begin...identifier_end), value)
								end
							when 4 then
								# line 11 "lib/xrb/fallback/markup.rl"
								begin

									identifier_end = p
								end
								# line 119 "lib/xrb/fallback/markup.rl"
								begin

									self_closing = false
								
									delegate.open_tag_begin(data.byteslice(identifier_begin...identifier_end), identifier_begin)
								end
								# line 128 "lib/xrb/fallback/markup.rl"
								begin

									self_closing = true
								end
							when 8 then
								# line 11 "lib/xrb/fallback/markup.rl"
								begin

									identifier_end = p
								end
								# line 145 "lib/xrb/fallback/markup.rl"
								begin

									if has_value
										pcdata = MarkupString.raw(pcdata) unless has_entities
										
										value = pcdata
									else
										value = true
									end
								
									delegate.attribute(data.byteslice(identifier_begin...identifier_end), value)
								end
								# line 128 "lib/xrb/fallback/markup.rl"
								begin

									self_closing = true
								end
							when 32 then
								# line 23 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 15 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = String.new(encoding: encoding)
									has_entities = false
								end
								# line 32 "lib/xrb/fallback/markup.rl"
								begin

									characters_begin = p
								end
							when 33 then
								# line 23 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 15 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = String.new(encoding: encoding)
									has_entities = false
								end
								# line 10 "parsers/xrb/entities.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 42
										_goto_level = _again
										next
									end
								end
							when 15 then
								# line 137 "lib/xrb/fallback/markup.rl"
								begin

									has_value = true
								end
								# line 145 "lib/xrb/fallback/markup.rl"
								begin

									if has_value
										pcdata = MarkupString.raw(pcdata) unless has_entities
										
										value = pcdata
									else
										value = true
									end
								
									delegate.attribute(data.byteslice(identifier_begin...identifier_end), value)
								end
								# line 128 "lib/xrb/fallback/markup.rl"
								begin

									self_closing = true
								end
							when 20 then
								# line 141 "lib/xrb/fallback/markup.rl"
								begin

									has_value = true
								end
								# line 145 "lib/xrb/fallback/markup.rl"
								begin

									if has_value
										pcdata = MarkupString.raw(pcdata) unless has_entities
										
										value = pcdata
									else
										value = true
									end
								
									delegate.attribute(data.byteslice(identifier_begin...identifier_end), value)
								end
								# line 128 "lib/xrb/fallback/markup.rl"
								begin

									self_closing = true
								end
							when 48 then
								# line 77 "lib/xrb/fallback/markup.rl"
								begin

									doctype_end = p
								
									delegate.doctype(data.byteslice(doctype_begin...doctype_end))
								end
								# line 23 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 15 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = String.new(encoding: encoding)
									has_entities = false
								end
								# line 32 "lib/xrb/fallback/markup.rl"
								begin

									characters_begin = p
								end
							when 49 then
								# line 77 "lib/xrb/fallback/markup.rl"
								begin

									doctype_end = p
								
									delegate.doctype(data.byteslice(doctype_begin...doctype_end))
								end
								# line 23 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 15 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = String.new(encoding: encoding)
									has_entities = false
								end
								# line 10 "parsers/xrb/entities.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 42
										_goto_level = _again
										next
									end
								end
							when 44 then
								# line 91 "lib/xrb/fallback/markup.rl"
								begin

									comment_end = p
								
									delegate.comment(data.byteslice(comment_begin...comment_end))
								end
								# line 23 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 15 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = String.new(encoding: encoding)
									has_entities = false
								end
								# line 32 "lib/xrb/fallback/markup.rl"
								begin

									characters_begin = p
								end
							when 45 then
								# line 91 "lib/xrb/fallback/markup.rl"
								begin

									comment_end = p
								
									delegate.comment(data.byteslice(comment_begin...comment_end))
								end
								# line 23 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 15 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = String.new(encoding: encoding)
									has_entities = false
								end
								# line 10 "parsers/xrb/entities.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 42
										_goto_level = _again
										next
									end
								end
							when 60 then
								# line 111 "lib/xrb/fallback/markup.rl"
								begin

									delegate.instruction(data.byteslice(instruction_begin, p-instruction_begin))
								end
								# line 23 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 15 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = String.new(encoding: encoding)
									has_entities = false
								end
								# line 32 "lib/xrb/fallback/markup.rl"
								begin

									characters_begin = p
								end
							when 61 then
								# line 111 "lib/xrb/fallback/markup.rl"
								begin

									delegate.instruction(data.byteslice(instruction_begin, p-instruction_begin))
								end
								# line 23 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 15 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = String.new(encoding: encoding)
									has_entities = false
								end
								# line 10 "parsers/xrb/entities.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 42
										_goto_level = _again
										next
									end
								end
							when 40 then
								# line 157 "lib/xrb/fallback/markup.rl"
								begin

									delegate.open_tag_end(self_closing)
								end
								# line 23 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 15 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = String.new(encoding: encoding)
									has_entities = false
								end
								# line 32 "lib/xrb/fallback/markup.rl"
								begin

									characters_begin = p
								end
							when 41 then
								# line 157 "lib/xrb/fallback/markup.rl"
								begin

									delegate.open_tag_end(self_closing)
								end
								# line 23 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 15 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = String.new(encoding: encoding)
									has_entities = false
								end
								# line 10 "parsers/xrb/entities.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 42
										_goto_level = _again
										next
									end
								end
							when 56 then
								# line 164 "lib/xrb/fallback/markup.rl"
								begin

									delegate.close_tag(data.byteslice(identifier_begin...identifier_end), identifier_begin)
								end
								# line 23 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 15 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = String.new(encoding: encoding)
									has_entities = false
								end
								# line 32 "lib/xrb/fallback/markup.rl"
								begin

									characters_begin = p
								end
							when 57 then
								# line 164 "lib/xrb/fallback/markup.rl"
								begin

									delegate.close_tag(data.byteslice(identifier_begin...identifier_end), identifier_begin)
								end
								# line 23 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 15 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = String.new(encoding: encoding)
									has_entities = false
								end
								# line 10 "parsers/xrb/entities.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 42
										_goto_level = _again
										next
									end
								end
							when 52 then
								# line 176 "lib/xrb/fallback/markup.rl"
								begin

									cdata_end = p
								
									delegate.cdata(data.byteslice(cdata_begin...cdata_end))
								end
								# line 23 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 15 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = String.new(encoding: encoding)
									has_entities = false
								end
								# line 32 "lib/xrb/fallback/markup.rl"
								begin

									characters_begin = p
								end
							when 53 then
								# line 176 "lib/xrb/fallback/markup.rl"
								begin

									cdata_end = p
								
									delegate.cdata(data.byteslice(cdata_begin...cdata_end))
								end
								# line 23 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 15 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = String.new(encoding: encoding)
									has_entities = false
								end
								# line 10 "parsers/xrb/entities.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 42
										_goto_level = _again
										next
									end
								end
							when 34 then
								# line 125 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 161 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 101 "lib/xrb/fallback/markup.rl"
								begin

									instruction_begin = p
								end
								# line 87 "lib/xrb/fallback/markup.rl"
								begin

									comment_begin = p
								end
								# line 73 "lib/xrb/fallback/markup.rl"
								begin

									doctype_begin = p
								end
								# line 172 "lib/xrb/fallback/markup.rl"
								begin

									cdata_begin = p
								end
							when 50 then
								# line 77 "lib/xrb/fallback/markup.rl"
								begin

									doctype_end = p
								
									delegate.doctype(data.byteslice(doctype_begin...doctype_end))
								end
								# line 125 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 161 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 101 "lib/xrb/fallback/markup.rl"
								begin

									instruction_begin = p
								end
								# line 87 "lib/xrb/fallback/markup.rl"
								begin

									comment_begin = p
								end
								# line 73 "lib/xrb/fallback/markup.rl"
								begin

									doctype_begin = p
								end
								# line 172 "lib/xrb/fallback/markup.rl"
								begin

									cdata_begin = p
								end
							when 46 then
								# line 91 "lib/xrb/fallback/markup.rl"
								begin

									comment_end = p
								
									delegate.comment(data.byteslice(comment_begin...comment_end))
								end
								# line 125 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 161 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 101 "lib/xrb/fallback/markup.rl"
								begin

									instruction_begin = p
								end
								# line 87 "lib/xrb/fallback/markup.rl"
								begin

									comment_begin = p
								end
								# line 73 "lib/xrb/fallback/markup.rl"
								begin

									doctype_begin = p
								end
								# line 172 "lib/xrb/fallback/markup.rl"
								begin

									cdata_begin = p
								end
							when 62 then
								# line 111 "lib/xrb/fallback/markup.rl"
								begin

									delegate.instruction(data.byteslice(instruction_begin, p-instruction_begin))
								end
								# line 125 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 161 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 101 "lib/xrb/fallback/markup.rl"
								begin

									instruction_begin = p
								end
								# line 87 "lib/xrb/fallback/markup.rl"
								begin

									comment_begin = p
								end
								# line 73 "lib/xrb/fallback/markup.rl"
								begin

									doctype_begin = p
								end
								# line 172 "lib/xrb/fallback/markup.rl"
								begin

									cdata_begin = p
								end
							when 42 then
								# line 157 "lib/xrb/fallback/markup.rl"
								begin

									delegate.open_tag_end(self_closing)
								end
								# line 125 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 161 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 101 "lib/xrb/fallback/markup.rl"
								begin

									instruction_begin = p
								end
								# line 87 "lib/xrb/fallback/markup.rl"
								begin

									comment_begin = p
								end
								# line 73 "lib/xrb/fallback/markup.rl"
								begin

									doctype_begin = p
								end
								# line 172 "lib/xrb/fallback/markup.rl"
								begin

									cdata_begin = p
								end
							when 58 then
								# line 164 "lib/xrb/fallback/markup.rl"
								begin

									delegate.close_tag(data.byteslice(identifier_begin...identifier_end), identifier_begin)
								end
								# line 125 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 161 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 101 "lib/xrb/fallback/markup.rl"
								begin

									instruction_begin = p
								end
								# line 87 "lib/xrb/fallback/markup.rl"
								begin

									comment_begin = p
								end
								# line 73 "lib/xrb/fallback/markup.rl"
								begin

									doctype_begin = p
								end
								# line 172 "lib/xrb/fallback/markup.rl"
								begin

									cdata_begin = p
								end
							when 54 then
								# line 176 "lib/xrb/fallback/markup.rl"
								begin

									cdata_end = p
								
									delegate.cdata(data.byteslice(cdata_begin...cdata_end))
								end
								# line 125 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 161 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 101 "lib/xrb/fallback/markup.rl"
								begin

									instruction_begin = p
								end
								# line 87 "lib/xrb/fallback/markup.rl"
								begin

									comment_begin = p
								end
								# line 73 "lib/xrb/fallback/markup.rl"
								begin

									doctype_begin = p
								end
								# line 172 "lib/xrb/fallback/markup.rl"
								begin

									cdata_begin = p
								end
							when 38 then
								# line 20 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 26 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = MarkupString.raw(pcdata) unless has_entities
								
									delegate.text(pcdata)
								end
								# line 125 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 161 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 101 "lib/xrb/fallback/markup.rl"
								begin

									instruction_begin = p
								end
								# line 87 "lib/xrb/fallback/markup.rl"
								begin

									comment_begin = p
								end
								# line 73 "lib/xrb/fallback/markup.rl"
								begin

									doctype_begin = p
								end
								# line 172 "lib/xrb/fallback/markup.rl"
								begin

									cdata_begin = p
								end
							when 36 then
								# line 36 "lib/xrb/fallback/markup.rl"
								begin

									characters_end = p
								
									pcdata << data.byteslice(characters_begin...characters_end)
								end
								# line 20 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 26 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = MarkupString.raw(pcdata) unless has_entities
								
									delegate.text(pcdata)
								end
								# line 125 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 161 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 101 "lib/xrb/fallback/markup.rl"
								begin

									instruction_begin = p
								end
								# line 87 "lib/xrb/fallback/markup.rl"
								begin

									comment_begin = p
								end
								# line 73 "lib/xrb/fallback/markup.rl"
								begin

									doctype_begin = p
								end
								# line 172 "lib/xrb/fallback/markup.rl"
								begin

									cdata_begin = p
								end
								# line 1512 "lib/xrb/fallback/markup.rb"
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
							case _markup_eof_actions[cs]
							when 27 then
								# line 42 "lib/xrb/fallback/markup.rl"
								begin

									raise ParseError.new("could not parse entity", buffer, p)
								end
							when 47 then
								# line 77 "lib/xrb/fallback/markup.rl"
								begin

									doctype_end = p
												
									delegate.doctype(data.byteslice(doctype_begin...doctype_end))
								end
							when 22 then
								# line 83 "lib/xrb/fallback/markup.rl"
								begin

									raise ParseError.new("could not parse doctype", buffer, p)
								end
							when 43 then
								# line 91 "lib/xrb/fallback/markup.rl"
								begin

									comment_end = p
												
									delegate.comment(data.byteslice(comment_begin...comment_end))
								end
							when 21 then
								# line 97 "lib/xrb/fallback/markup.rl"
								begin

									raise ParseError.new("could not parse comment", buffer, p)
								end
							when 59 then
								# line 111 "lib/xrb/fallback/markup.rl"
								begin

									delegate.instruction(data.byteslice(instruction_begin, p-instruction_begin))
								end
							when 24 then
								# line 115 "lib/xrb/fallback/markup.rl"
								begin

									raise ParseError.new("could not parse instruction", buffer, p)
								end
							when 39 then
								# line 157 "lib/xrb/fallback/markup.rl"
								begin

									delegate.open_tag_end(self_closing)
								end
							when 55 then
								# line 164 "lib/xrb/fallback/markup.rl"
								begin

									delegate.close_tag(data.byteslice(identifier_begin...identifier_end), identifier_begin)
								end
							when 1 then
								# line 168 "lib/xrb/fallback/markup.rl"
								begin

									raise ParseError.new("could not parse tag", buffer, p)
								end
							when 51 then
								# line 176 "lib/xrb/fallback/markup.rl"
								begin

									cdata_end = p
												
									delegate.cdata(data.byteslice(cdata_begin...cdata_end))
								end
							when 23 then
								# line 182 "lib/xrb/fallback/markup.rl"
								begin

									raise ParseError.new("could not parse cdata", buffer, p)
								end
							when 37 then
								# line 20 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 26 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = MarkupString.raw(pcdata) unless has_entities
												
									delegate.text(pcdata)
								end
							when 35 then
								# line 36 "lib/xrb/fallback/markup.rl"
								begin

									characters_end = p
												
									pcdata << data.byteslice(characters_begin...characters_end)
								end
								# line 20 "lib/xrb/fallback/markup.rl"
								begin

								end
								# line 26 "lib/xrb/fallback/markup.rl"
								begin

									pcdata = MarkupString.raw(pcdata) unless has_entities
												
									delegate.text(pcdata)
								end
								# line 1639 "lib/xrb/fallback/markup.rb"
							end
						end

					end
					if _goto_level <= _out
						break
					end
				end
			end

			# line 220 "lib/xrb/fallback/markup.rl"
							
			if p != eof
				raise ParseError.new("could not consume all input", buffer, p)
			end
							
			return nil
		end
	end
end
