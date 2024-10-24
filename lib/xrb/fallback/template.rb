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
			9, 32, 9, 63, 10, 63, 
			10, 123, 10, 63, 10, 
			114, 9, 60, 9, 63, 
			10, 62, 9, 63, 63, 63, 
			62, 62, 10, 63, 10, 
			123, 10, 63, 10, 114, 
			9, 63, 10, 62, 34, 125, 
			34, 35, 35, 125, 35, 
			125, 34, 39, 35, 125, 
			35, 125, 34, 123, 34, 123, 
			39, 39, 34, 125, 34, 
			125, 34, 125, 34, 35, 
			35, 125, 35, 125, 34, 39, 
			35, 125, 35, 125, 34, 
			123, 34, 123, 39, 39, 
			34, 125, 9, 60, 10, 60, 
			10, 60, 10, 123, 10, 
			63, 10, 114, 9, 60, 
			9, 60, 10, 63, 10, 114, 
			9, 60, 9, 63, 10, 
			63, 10, 123, 10, 63, 
			10, 114, 9, 60, 9, 32, 
			10, 63, 9, 60, 34, 
			39, 34, 35, 39, 39, 
			0, 0, 34, 39, 34, 35, 
			39, 39, 0, 0, 0
		]

		class << self
			attr_accessor :_template_key_spans
			private :_template_key_spans, :_template_key_spans=
		end
		self._template_key_spans = [
			0, 51, 114, 54, 105, 52, 1, 1, 
			24, 55, 54, 114, 54, 105, 52, 55, 
			53, 55, 1, 1, 54, 114, 54, 105, 
			55, 53, 92, 2, 91, 91, 6, 91, 
			91, 90, 90, 1, 92, 92, 92, 2, 
			91, 91, 6, 91, 91, 90, 90, 1, 
			92, 52, 51, 51, 114, 54, 105, 52, 
			52, 54, 105, 52, 55, 54, 114, 54, 
			105, 52, 24, 54, 52, 6, 2, 1, 
			0, 6, 2, 1, 0
		]

		class << self
			attr_accessor :_template_index_offsets
			private :_template_index_offsets, :_template_index_offsets=
		end
		self._template_index_offsets = [
			0, 0, 52, 167, 222, 328, 381, 383, 
			385, 410, 466, 521, 636, 691, 797, 850, 
			906, 960, 1016, 1018, 1020, 1075, 1190, 1245, 
			1351, 1407, 1461, 1554, 1557, 1649, 1741, 1748, 
			1840, 1932, 2023, 2114, 2116, 2209, 2302, 2395, 
			2398, 2490, 2582, 2589, 2681, 2773, 2864, 2955, 
			2957, 3050, 3103, 3155, 3207, 3322, 3377, 3483, 
			3536, 3589, 3644, 3750, 3803, 3859, 3914, 4029, 
			4084, 4190, 4243, 4268, 4323, 4376, 4383, 4386, 
			4388, 4389, 4396, 4399, 4401
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
			0, 2, 0, 0, 0, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 0, 
			1, 1, 3, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 4, 1, 9, 8, 10, 
			8, 10, 11, 10, 10, 10, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			10, 0, 13, 13, 13, 13, 13, 8, 
			8, 8, 8, 8, 8, 8, 8, 8, 
			8, 8, 8, 8, 8, 8, 8, 8, 
			8, 13, 8, 8, 8, 8, 8, 8, 
			8, 8, 8, 8, 8, 8, 8, 8, 
			8, 8, 8, 8, 8, 8, 8, 8, 
			8, 8, 8, 8, 8, 8, 8, 8, 
			9, 8, 16, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 17, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 18, 15, 15, 19, 
			15, 16, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 17, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 18, 15, 15, 19, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 8, 15, 16, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 17, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 18, 15, 
			15, 20, 15, 16, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 17, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 18, 15, 21, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 22, 15, 21, 23, 21, 
			21, 21, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 21, 1, 1, 3, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			4, 1, 8, 16, 8, 8, 8, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 8, 15, 15, 17, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 18, 15, 15, 
			19, 15, 16, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 17, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 18, 15, 21, 15, 
			25, 25, 25, 25, 25, 24, 24, 24, 
			24, 24, 24, 24, 24, 24, 24, 24, 
			24, 24, 24, 24, 24, 24, 24, 25, 
			24, 24, 24, 24, 24, 24, 24, 24, 
			24, 24, 24, 24, 24, 24, 24, 24, 
			24, 24, 24, 24, 24, 24, 24, 24, 
			24, 24, 24, 24, 24, 24, 26, 24, 
			26, 24, 27, 24, 29, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 30, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 31, 28, 
			28, 32, 28, 29, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 30, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 31, 28, 28, 
			32, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 24, 28, 29, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 30, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			31, 28, 28, 33, 28, 29, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 30, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 31, 
			28, 34, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 35, 28, 24, 
			29, 24, 24, 24, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 24, 28, 
			28, 30, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 31, 28, 28, 32, 28, 29, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			30, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 31, 28, 34, 28, 37, 36, 36, 
			36, 36, 38, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 36, 36, 
			36, 36, 36, 36, 36, 36, 39, 36, 
			40, 36, 41, 42, 37, 43, 41, 41, 
			41, 44, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 45, 41, 46, 
			41, 43, 41, 41, 41, 44, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 41, 41, 41, 41, 41, 41, 41, 
			41, 47, 41, 46, 41, 48, 49, 44, 
			44, 44, 48, 44, 50, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 51, 48, 52, 48, 
			50, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			48, 48, 48, 48, 48, 48, 48, 48, 
			53, 48, 52, 48, 48, 49, 44, 44, 
			44, 48, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 44, 44, 44, 
			44, 44, 44, 44, 44, 54, 44, 41, 
			42, 37, 37, 37, 37, 37, 37, 37, 
			37, 37, 37, 37, 37, 37, 37, 37, 
			37, 37, 37, 37, 37, 37, 37, 37, 
			37, 37, 37, 37, 37, 37, 37, 37, 
			37, 37, 37, 37, 37, 37, 37, 37, 
			37, 37, 37, 37, 37, 37, 37, 37, 
			37, 37, 37, 37, 37, 37, 37, 37, 
			37, 37, 37, 37, 37, 37, 37, 37, 
			37, 37, 37, 37, 37, 37, 37, 37, 
			37, 37, 37, 37, 37, 37, 37, 37, 
			37, 37, 37, 37, 37, 37, 37, 37, 
			55, 37, 56, 38, 44, 56, 56, 56, 
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
			56, 56, 56, 56, 56, 57, 56, 58, 
			56, 60, 59, 59, 59, 59, 61, 59, 
			59, 59, 59, 59, 59, 59, 59, 59, 
			59, 59, 59, 59, 59, 59, 59, 59, 
			59, 59, 59, 59, 59, 59, 59, 59, 
			59, 59, 59, 59, 59, 59, 59, 59, 
			59, 59, 59, 59, 59, 59, 59, 59, 
			59, 59, 59, 59, 59, 59, 59, 59, 
			59, 59, 59, 59, 59, 59, 59, 59, 
			59, 59, 59, 59, 59, 59, 59, 59, 
			59, 59, 59, 59, 59, 59, 59, 59, 
			59, 59, 59, 59, 59, 59, 59, 59, 
			59, 59, 62, 59, 63, 59, 65, 64, 
			64, 64, 64, 66, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 64, 
			64, 64, 64, 64, 64, 64, 64, 67, 
			64, 68, 64, 69, 70, 65, 71, 69, 
			69, 69, 72, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 73, 69, 
			74, 69, 71, 69, 69, 69, 72, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 69, 69, 69, 69, 69, 69, 
			69, 69, 75, 69, 74, 69, 76, 77, 
			72, 72, 72, 76, 72, 78, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 79, 76, 80, 
			76, 78, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 76, 76, 76, 76, 76, 76, 76, 
			76, 81, 76, 80, 76, 76, 77, 72, 
			72, 72, 76, 72, 72, 72, 72, 72, 
			72, 72, 72, 72, 72, 72, 72, 72, 
			72, 72, 72, 72, 72, 72, 72, 72, 
			72, 72, 72, 72, 72, 72, 72, 72, 
			72, 72, 72, 72, 72, 72, 72, 72, 
			72, 72, 72, 72, 72, 72, 72, 72, 
			72, 72, 72, 72, 72, 72, 72, 72, 
			72, 72, 72, 72, 72, 72, 72, 72, 
			72, 72, 72, 72, 72, 72, 72, 72, 
			72, 72, 72, 72, 72, 72, 72, 72, 
			72, 72, 72, 72, 72, 72, 82, 72, 
			69, 70, 65, 65, 65, 65, 65, 65, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 65, 65, 65, 65, 65, 65, 65, 
			65, 83, 65, 84, 66, 72, 84, 84, 
			84, 84, 84, 84, 84, 84, 84, 84, 
			84, 84, 84, 84, 84, 84, 84, 84, 
			84, 84, 84, 84, 84, 84, 84, 84, 
			84, 84, 84, 84, 84, 84, 84, 84, 
			84, 84, 84, 84, 84, 84, 84, 84, 
			84, 84, 84, 84, 84, 84, 84, 84, 
			84, 84, 84, 84, 84, 84, 84, 84, 
			84, 84, 84, 84, 84, 84, 84, 84, 
			84, 84, 84, 84, 84, 84, 84, 84, 
			84, 84, 84, 84, 84, 84, 84, 84, 
			84, 84, 84, 84, 84, 84, 85, 84, 
			86, 84, 88, 2, 88, 88, 88, 87, 
			87, 87, 87, 87, 87, 87, 87, 87, 
			87, 87, 87, 87, 87, 87, 87, 87, 
			87, 88, 87, 87, 89, 87, 87, 87, 
			87, 87, 87, 87, 87, 87, 87, 87, 
			87, 87, 87, 87, 87, 87, 87, 87, 
			87, 87, 87, 87, 87, 90, 87, 93, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			94, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 95, 92, 2, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 3, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 4, 1, 93, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			94, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 95, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			96, 92, 93, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 94, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 95, 92, 92, 97, 
			92, 93, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 94, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 95, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 98, 92, 96, 99, 96, 96, 96, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 96, 92, 92, 94, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 95, 92, 
			100, 93, 100, 100, 100, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 100, 
			92, 92, 94, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 101, 92, 93, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 94, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 95, 
			92, 92, 102, 92, 93, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 94, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 95, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 103, 92, 104, 105, 
			104, 104, 104, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 104, 92, 92, 
			94, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 95, 92, 13, 13, 13, 13, 13, 
			8, 8, 8, 8, 8, 8, 8, 8, 
			8, 8, 8, 8, 8, 8, 8, 8, 
			8, 8, 13, 8, 8, 8, 8, 8, 
			8, 8, 8, 8, 8, 8, 8, 8, 
			8, 8, 8, 8, 8, 8, 8, 8, 
			8, 8, 8, 8, 8, 8, 8, 8, 
			8, 9, 8, 16, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 17, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 15, 15, 15, 15, 18, 15, 15, 
			19, 15, 93, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 94, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 95, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 108, 92, 93, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 94, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 95, 
			92, 92, 109, 92, 93, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 94, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 95, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 110, 92, 111, 112, 
			111, 111, 111, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 111, 92, 92, 
			94, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 92, 92, 92, 92, 92, 92, 92, 
			92, 95, 92, 10, 11, 10, 10, 10, 
			113, 113, 113, 113, 113, 113, 113, 113, 
			113, 113, 113, 113, 113, 113, 113, 113, 
			113, 113, 10, 113, 29, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 30, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 28, 28, 
			28, 28, 28, 28, 28, 28, 31, 28, 
			28, 32, 28, 21, 23, 21, 21, 21, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 21, 1, 1, 3, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 1, 1, 
			1, 1, 1, 1, 1, 1, 4, 1, 
			48, 49, 44, 44, 44, 48, 44, 41, 
			42, 37, 56, 38, 114, 76, 77, 72, 
			72, 72, 76, 72, 69, 70, 65, 84, 
			66, 114, 0
		]

		class << self
			attr_accessor :_template_trans_targs
			private :_template_trans_targs, :_template_trans_targs=
		end
		self._template_trans_targs = [
			49, 1, 51, 2, 3, 4, 5, 49, 
			6, 7, 8, 49, 49, 9, 49, 10, 
			61, 11, 12, 16, 13, 14, 15, 51, 
			18, 17, 19, 66, 20, 67, 21, 22, 
			25, 23, 68, 24, 26, 27, 35, 26, 
			72, 28, 34, 29, 30, 28, 70, 28, 
			31, 33, 32, 31, 69, 31, 30, 27, 
			36, 36, 71, 38, 39, 47, 38, 76, 
			38, 39, 47, 38, 76, 40, 46, 41, 
			42, 40, 74, 40, 43, 45, 44, 43, 
			73, 43, 42, 39, 48, 48, 75, 50, 
			56, 62, 63, 49, 50, 51, 52, 53, 
			49, 54, 55, 51, 56, 57, 58, 59, 
			60, 61, 49, 49, 49, 64, 65, 17, 
			67, 49, 0
		]

		class << self
			attr_accessor :_template_trans_actions
			private :_template_trans_actions, :_template_trans_actions=
		end
		self._template_trans_actions = [
			1, 0, 2, 0, 0, 0, 0, 3, 
			0, 4, 0, 5, 6, 0, 7, 0, 
			2, 0, 0, 4, 4, 0, 0, 8, 
			0, 0, 4, 9, 0, 2, 0, 0, 
			4, 4, 9, 0, 0, 0, 0, 11, 
			12, 0, 0, 0, 0, 11, 12, 13, 
			0, 0, 0, 11, 12, 13, 14, 14, 
			0, 11, 12, 16, 16, 16, 17, 18, 
			0, 0, 0, 11, 19, 0, 0, 0, 
			0, 11, 19, 13, 0, 0, 0, 11, 
			19, 13, 14, 14, 0, 11, 19, 21, 
			21, 21, 21, 22, 0, 23, 24, 24, 
			25, 0, 0, 26, 0, 24, 0, 0, 
			27, 28, 29, 30, 31, 0, 32, 33, 
			34, 35, 0
		]

		class << self
			attr_accessor :_template_to_state_actions
			private :_template_to_state_actions, :_template_to_state_actions=
		end
		self._template_to_state_actions = [
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 10, 10, 10, 0, 10, 10, 
			0, 0, 0, 0, 10, 10, 10, 10, 
			10, 0, 10, 10, 0, 0, 0, 0, 
			10, 10, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0
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
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 20, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0
		]

		class << self
			attr_accessor :_template_eof_actions
			private :_template_eof_actions, :_template_eof_actions=
		end
		self._template_eof_actions = [
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 15, 15, 15, 
			15, 15, 15, 15, 15, 15, 15, 15, 
			15, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0
		]

		class << self
			attr_accessor :_template_eof_trans
			private :_template_eof_trans, :_template_eof_trans=
		end
		self._template_eof_trans = [
			0, 1, 1, 1, 1, 1, 8, 8, 
			1, 13, 15, 15, 15, 15, 1, 15, 
			15, 13, 8, 8, 15, 15, 15, 15, 
			15, 15, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 92, 1, 92, 92, 92, 92, 
			92, 92, 92, 92, 107, 108, 92, 92, 
			92, 92, 114, 108, 114, 0, 0, 0, 
			0, 0, 0, 0, 0
		]

		class << self
			attr_accessor :template_start
		end
		self.template_start = 49;
		class << self
			attr_accessor :template_first_final
		end
		self.template_first_final = 49;
		class << self
			attr_accessor :template_error
		end
		self.template_error = 0;

		class << self
			attr_accessor :template_en_parse_nested_expression
		end
		self.template_en_parse_nested_expression = 26;
		class << self
			attr_accessor :template_en_parse_expression
		end
		self.template_en_parse_expression = 37;
		class << self
			attr_accessor :template_en_main
		end
		self.template_en_main = 49;


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
							
							
			# line 803 "lib/xrb/fallback/template.rb"
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
							
			# line 816 "lib/xrb/fallback/template.rb"
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
						when 20 then
							# line 1 "NONE"
							begin
								ts = p
							end
							# line 844 "lib/xrb/fallback/template.rb"
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
							when 16 then
								# line 27 "lib/xrb/fallback/template.rl"
								begin

									expression_begin = p
								end
							when 21 then
								# line 43 "lib/xrb/fallback/template.rl"
								begin

									text_begin = p
								
									delimiter_begin = nil
									delimiter_end = nil
								end
							when 14 then
								# line 14 "parsers/xrb/template.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 26
										_goto_level = _again
										next
									end
								end
							when 11 then
								# line 18 "parsers/xrb/template.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 26
										_goto_level = _again
										next
									end
								end
							when 12 then
								# line 20 "parsers/xrb/template.rl"
								begin
									begin
										top -= 1
										cs = stack[top]
										_goto_level = _again
										next
									end
								end
							when 5 then
								# line 19 "lib/xrb/fallback/template.rl"
								begin
									te = p+1
									begin 
										delegate.instruction(data.byteslice(instruction_begin...instruction_end), "\n")
									end
								end
							when 30 then
								# line 72 "lib/xrb/fallback/template.rl"
								begin
									te = p
									p = p - 1; begin 
										delegate.text(data.byteslice(ts...te))
									end
								end
							when 35 then
								# line 15 "lib/xrb/fallback/template.rl"
								begin
									te = p
									p = p - 1; begin 
										delegate.instruction(data.byteslice(instruction_begin...instruction_end))
									end
								end
							when 29 then
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
								# line 1 "NONE"
								begin
									case act
									when 1 then
										begin begin p = ((te))-1; end

																delegate.instruction(data.byteslice(instruction_begin...instruction_end), "\n")
										end
									when 2 then
										begin begin p = ((te))-1; end

																delegate.text(data.byteslice(ts...te))
										end
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
							when 7 then
								# line 23 "lib/xrb/fallback/template.rl"
								begin

									raise ParseError.new("failed to parse instruction", buffer, p)
								end
								# line 72 "lib/xrb/fallback/template.rl"
								begin
									begin p = ((te))-1; end
									begin 
										delegate.text(data.byteslice(ts...te))
									end
								end
							when 6 then
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
							when 3 then
								# line 23 "lib/xrb/fallback/template.rl"
								begin

									raise ParseError.new("failed to parse instruction", buffer, p)
								end
								# line 1 "NONE"
								begin
									case act
									when 1 then
										begin begin p = ((te))-1; end

																delegate.instruction(data.byteslice(instruction_begin...instruction_end), "\n")
										end
									when 2 then
										begin begin p = ((te))-1; end

																delegate.text(data.byteslice(ts...te))
										end
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
							when 17 then
								# line 27 "lib/xrb/fallback/template.rl"
								begin

									expression_begin = p
								end
								# line 18 "parsers/xrb/template.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 26
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
							when 25 then
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
							when 13 then
								# line 14 "parsers/xrb/template.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 26
										_goto_level = _again
										next
									end
								end
								# line 18 "parsers/xrb/template.rl"
								begin
									begin
										stack[top] = cs
										top+= 1
										cs = 26
										_goto_level = _again
										next
									end
								end
							when 8 then
								# line 1 "NONE"
								begin
									te = p+1
								end
								# line 19 "lib/xrb/fallback/template.rl"
								begin
						act = 1;		end
							when 2 then
								# line 1 "NONE"
								begin
									te = p+1
								end
								# line 72 "lib/xrb/fallback/template.rl"
								begin
						act = 2;		end
							when 9 then
								# line 1 "NONE"
								begin
									te = p+1
								end
								# line 15 "lib/xrb/fallback/template.rl"
								begin
						act = 4;		end
							when 32 then
								# line 1 "NONE"
								begin
									te = p+1
								end
								# line 62 "lib/xrb/fallback/template.rl"
								begin
						act = 5;		end
							when 33 then
								# line 7 "lib/xrb/fallback/template.rl"
								begin

									instruction_begin = p
								end
								# line 50 "lib/xrb/fallback/template.rl"
								begin

									text_end = p
								end
								# line 54 "lib/xrb/fallback/template.rl"
								begin

									delimiter_begin = p
								end
							when 19 then
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
							when 26 then
								# line 1 "NONE"
								begin
									te = p+1
								end
								# line 72 "lib/xrb/fallback/template.rl"
								begin
						act = 2;		end
								# line 58 "lib/xrb/fallback/template.rl"
								begin

									delimiter_end = p
								end
							when 31 then
								# line 52 "parsers/xrb/template.rl"
								begin
									te = p+1
									begin 	begin
										stack[top] = cs
										top+= 1
										cs = 37
										_goto_level = _again
										next
									end
									end
								end
								# line 50 "lib/xrb/fallback/template.rl"
								begin

									text_end = p
								end
								# line 54 "lib/xrb/fallback/template.rl"
								begin

									delimiter_begin = p
								end
							when 18 then
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
							when 28 then
								# line 1 "NONE"
								begin
									te = p+1
								end
								# line 7 "lib/xrb/fallback/template.rl"
								begin

									instruction_begin = p
								end
								# line 72 "lib/xrb/fallback/template.rl"
								begin
						act = 2;		end
								# line 58 "lib/xrb/fallback/template.rl"
								begin

									delimiter_end = p
								end
							when 23 then
								# line 1 "NONE"
								begin
									te = p+1
								end
								# line 72 "lib/xrb/fallback/template.rl"
								begin
						act = 2;		end
								# line 50 "lib/xrb/fallback/template.rl"
								begin

									text_end = p
								end
								# line 54 "lib/xrb/fallback/template.rl"
								begin

									delimiter_begin = p
								end
							when 34 then
								# line 1 "NONE"
								begin
									te = p+1
								end
								# line 7 "lib/xrb/fallback/template.rl"
								begin

									instruction_begin = p
								end
								# line 72 "lib/xrb/fallback/template.rl"
								begin
						act = 2;		end
								# line 50 "lib/xrb/fallback/template.rl"
								begin

									text_end = p
								end
								# line 54 "lib/xrb/fallback/template.rl"
								begin

									delimiter_begin = p
								end
								# line 1352 "lib/xrb/fallback/template.rb"
							end
						end
					end
					if _goto_level <= _again
						case _template_to_state_actions[cs] 
						when 10 then
							# line 1 "NONE"
							begin
					ts = nil;		end
							# line 1362 "lib/xrb/fallback/template.rb"
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
							when 15 then
								# line 39 "lib/xrb/fallback/template.rl"
								begin

									raise ParseError.new("failed to parse expression", buffer, p)
								end
								# line 1389 "lib/xrb/fallback/template.rb"
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
