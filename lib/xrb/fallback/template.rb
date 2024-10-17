
# line 1 "lib/xrb/fallback/template.rl"
# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.


# line 51 "lib/xrb/fallback/template.rl"


require_relative '../error'

module XRB
	module Fallback
		
# line 16 "lib/xrb/fallback/template.rb"
class << self
	attr_accessor :_template_trans_keys
	private :_template_trans_keys, :_template_trans_keys=
end
self._template_trans_keys = [
	0, 0, 10, 60, 123, 123, 
	63, 63, 123, 123, 63, 
	63, 63, 63, 114, 114, 
	9, 32, 63, 63, 62, 62, 
	9, 32, 123, 123, 63, 
	63, 0, 127, 0, 127, 
	63, 63, 62, 62, 0, 127, 
	63, 63, 62, 62, 34, 
	125, 34, 35, 35, 125, 
	35, 125, 34, 39, 35, 125, 
	35, 125, 34, 123, 34, 
	123, 39, 39, 34, 125, 
	34, 125, 34, 35, 35, 125, 
	35, 125, 34, 39, 35, 
	125, 35, 125, 34, 123, 
	34, 123, 39, 39, 34, 125, 
	9, 60, 10, 60, 10, 
	60, 9, 60, 0, 0, 
	9, 32, 34, 39, 34, 35, 
	39, 39, 0, 0, 34, 
	39, 34, 35, 39, 39, 
	0, 0, 0
]

class << self
	attr_accessor :_template_key_spans
	private :_template_key_spans, :_template_key_spans=
end
self._template_key_spans = [
	0, 51, 1, 1, 1, 1, 1, 1, 
	24, 1, 1, 24, 1, 1, 128, 128, 
	1, 1, 128, 1, 1, 92, 2, 91, 
	91, 6, 91, 91, 90, 90, 1, 92, 
	92, 2, 91, 91, 6, 91, 91, 90, 
	90, 1, 92, 52, 51, 51, 52, 0, 
	24, 6, 2, 1, 0, 6, 2, 1, 
	0
]

class << self
	attr_accessor :_template_index_offsets
	private :_template_index_offsets, :_template_index_offsets=
end
self._template_index_offsets = [
	0, 0, 52, 54, 56, 58, 60, 62, 
	64, 89, 91, 93, 118, 120, 122, 251, 
	380, 382, 384, 513, 515, 517, 610, 613, 
	705, 797, 804, 896, 988, 1079, 1170, 1172, 
	1265, 1358, 1361, 1453, 1545, 1552, 1644, 1736, 
	1827, 1918, 1920, 2013, 2066, 2118, 2170, 2223, 
	2224, 2249, 2256, 2259, 2261, 2262, 2269, 2272, 
	2274
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
	1, 1, 4, 1, 0, 5, 0, 5, 
	6, 7, 6, 7, 8, 7, 9, 6, 
	11, 11, 11, 11, 11, 6, 6, 6, 
	6, 6, 6, 6, 6, 6, 6, 6, 
	6, 6, 6, 6, 6, 6, 6, 11, 
	6, 13, 12, 14, 12, 14, 16, 14, 
	14, 14, 15, 15, 15, 15, 15, 15, 
	15, 15, 15, 15, 15, 15, 15, 15, 
	15, 15, 15, 15, 14, 15, 17, 7, 
	18, 7, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 19, 
	19, 20, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 20, 20, 20, 
	20, 20, 20, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 20, 20, 20, 
	20, 19, 20, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 21, 19, 19, 19, 
	19, 19, 19, 19, 19, 20, 20, 20, 
	20, 20, 19, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 22, 22, 22, 22, 
	22, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 22, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	19, 19, 20, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 20, 20, 
	20, 20, 20, 20, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 20, 20, 
	20, 20, 19, 20, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 20, 20, 
	20, 20, 20, 19, 23, 22, 24, 22, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 25, 25, 25, 25, 25, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	25, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 19, 19, 20, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 20, 20, 20, 20, 20, 
	20, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 20, 20, 20, 20, 19, 
	20, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 20, 20, 20, 20, 20, 
	19, 27, 26, 28, 26, 30, 29, 29, 
	29, 29, 31, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 32, 29, 
	33, 29, 34, 35, 30, 36, 34, 34, 
	34, 37, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 38, 34, 39, 
	34, 36, 34, 34, 34, 37, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 40, 34, 39, 34, 41, 42, 37, 
	37, 37, 41, 37, 43, 41, 41, 41, 
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
	41, 41, 41, 41, 44, 41, 45, 41, 
	43, 41, 41, 41, 41, 41, 41, 41, 
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
	46, 41, 45, 41, 41, 42, 37, 37, 
	37, 41, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 47, 37, 34, 
	35, 30, 30, 30, 30, 30, 30, 30, 
	30, 30, 30, 30, 30, 30, 30, 30, 
	30, 30, 30, 30, 30, 30, 30, 30, 
	30, 30, 30, 30, 30, 30, 30, 30, 
	30, 30, 30, 30, 30, 30, 30, 30, 
	30, 30, 30, 30, 30, 30, 30, 30, 
	30, 30, 30, 30, 30, 30, 30, 30, 
	30, 30, 30, 30, 30, 30, 30, 30, 
	30, 30, 30, 30, 30, 30, 30, 30, 
	30, 30, 30, 30, 30, 30, 30, 30, 
	30, 30, 30, 30, 30, 30, 30, 30, 
	48, 30, 49, 31, 37, 49, 49, 49, 
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
	49, 49, 49, 49, 49, 50, 49, 51, 
	49, 53, 52, 52, 52, 52, 54, 52, 
	52, 52, 52, 52, 52, 52, 52, 52, 
	52, 52, 52, 52, 52, 52, 52, 52, 
	52, 52, 52, 52, 52, 52, 52, 52, 
	52, 52, 52, 52, 52, 52, 52, 52, 
	52, 52, 52, 52, 52, 52, 52, 52, 
	52, 52, 52, 52, 52, 52, 52, 52, 
	52, 52, 52, 52, 52, 52, 52, 52, 
	52, 52, 52, 52, 52, 52, 52, 52, 
	52, 52, 52, 52, 52, 52, 52, 52, 
	52, 52, 52, 52, 52, 52, 52, 52, 
	52, 52, 55, 52, 56, 52, 57, 58, 
	53, 59, 57, 57, 57, 60, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 61, 57, 62, 57, 59, 57, 57, 
	57, 60, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 57, 57, 57, 
	57, 57, 57, 57, 57, 63, 57, 62, 
	57, 64, 65, 60, 60, 60, 64, 60, 
	66, 64, 64, 64, 64, 64, 64, 64, 
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
	67, 64, 68, 64, 66, 64, 64, 64, 
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
	64, 64, 64, 64, 69, 64, 68, 64, 
	64, 65, 60, 60, 60, 64, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 70, 60, 57, 58, 53, 53, 53, 
	53, 53, 53, 53, 53, 53, 53, 53, 
	53, 53, 53, 53, 53, 53, 53, 53, 
	53, 53, 53, 53, 53, 53, 53, 53, 
	53, 53, 53, 53, 53, 53, 53, 53, 
	53, 53, 53, 53, 53, 53, 53, 53, 
	53, 53, 53, 53, 53, 53, 53, 53, 
	53, 53, 53, 53, 53, 53, 53, 53, 
	53, 53, 53, 53, 53, 53, 53, 53, 
	53, 53, 53, 53, 53, 53, 53, 53, 
	53, 53, 53, 53, 53, 53, 53, 53, 
	53, 53, 53, 53, 71, 53, 72, 54, 
	60, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 73, 72, 74, 72, 76, 2, 76, 
	76, 76, 75, 75, 75, 75, 75, 75, 
	75, 75, 75, 75, 75, 75, 75, 75, 
	75, 75, 75, 75, 76, 75, 75, 77, 
	75, 75, 75, 75, 75, 75, 75, 75, 
	75, 75, 75, 75, 75, 75, 75, 75, 
	75, 75, 75, 75, 75, 75, 75, 75, 
	78, 75, 2, 75, 75, 75, 75, 75, 
	75, 75, 75, 75, 75, 75, 75, 75, 
	75, 75, 75, 75, 75, 75, 75, 75, 
	75, 75, 75, 80, 75, 75, 75, 75, 
	75, 75, 75, 75, 75, 75, 75, 75, 
	75, 75, 75, 75, 75, 75, 75, 75, 
	75, 75, 75, 75, 81, 75, 2, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 3, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	4, 1, 76, 2, 76, 76, 76, 75, 
	75, 75, 75, 75, 75, 75, 75, 75, 
	75, 75, 75, 75, 75, 75, 75, 75, 
	75, 76, 75, 75, 80, 75, 75, 75, 
	75, 75, 75, 75, 75, 75, 75, 75, 
	75, 75, 75, 75, 75, 75, 75, 75, 
	75, 75, 75, 75, 75, 83, 75, 84, 
	14, 16, 14, 14, 14, 85, 85, 85, 
	85, 85, 85, 85, 85, 85, 85, 85, 
	85, 85, 85, 85, 85, 85, 85, 14, 
	85, 41, 42, 37, 37, 37, 41, 37, 
	34, 35, 30, 49, 31, 86, 64, 65, 
	60, 60, 60, 64, 60, 57, 58, 53, 
	72, 54, 86, 0
]

class << self
	attr_accessor :_template_trans_targs
	private :_template_trans_targs, :_template_trans_targs=
end
self._template_trans_targs = [
	43, 1, 45, 2, 3, 1, 43, 44, 
	7, 8, 43, 9, 9, 10, 11, 43, 
	43, 47, 14, 15, 0, 18, 16, 17, 
	43, 19, 19, 20, 48, 21, 22, 30, 
	21, 52, 23, 29, 24, 25, 23, 50, 
	23, 26, 28, 27, 26, 49, 26, 25, 
	22, 31, 31, 51, 32, 33, 41, 32, 
	56, 34, 40, 35, 36, 34, 54, 34, 
	37, 39, 38, 37, 53, 37, 36, 33, 
	42, 42, 55, 44, 46, 12, 13, 43, 
	4, 5, 43, 6, 43, 43, 0
]

class << self
	attr_accessor :_template_trans_actions
	private :_template_trans_actions, :_template_trans_actions=
end
self._template_trans_actions = [
	1, 0, 2, 0, 0, 3, 4, 5, 
	0, 0, 6, 7, 0, 8, 0, 9, 
	10, 0, 0, 0, 11, 0, 0, 0, 
	12, 7, 0, 8, 13, 0, 0, 0, 
	15, 16, 0, 0, 0, 0, 15, 16, 
	17, 0, 0, 0, 15, 16, 17, 18, 
	18, 0, 15, 16, 0, 0, 0, 15, 
	20, 0, 0, 0, 0, 15, 20, 17, 
	0, 0, 0, 15, 20, 17, 18, 18, 
	0, 15, 20, 2, 22, 0, 0, 23, 
	0, 0, 24, 0, 25, 26, 0
]

class << self
	attr_accessor :_template_to_state_actions
	private :_template_to_state_actions, :_template_to_state_actions=
end
self._template_to_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 14, 14, 14, 
	0, 14, 14, 0, 0, 0, 0, 14, 
	14, 14, 14, 0, 14, 14, 0, 0, 
	0, 0, 14, 14, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0
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
	0, 0, 0, 21, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0
]

class << self
	attr_accessor :_template_eof_actions
	private :_template_eof_actions, :_template_eof_actions=
end
self._template_eof_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 11, 11, 
	11, 11, 11, 11, 11, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0
]

class << self
	attr_accessor :_template_eof_trans
	private :_template_eof_trans, :_template_eof_trans=
end
self._template_eof_trans = [
	0, 1, 1, 1, 7, 7, 7, 7, 
	11, 11, 11, 16, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 80, 83, 80, 85, 
	86, 0, 0, 0, 0, 0, 0, 0, 
	0
]

class << self
	attr_accessor :template_start
end
self.template_start = 43;
class << self
	attr_accessor :template_first_final
end
self.template_first_final = 43;
class << self
	attr_accessor :template_error
end
self.template_error = 0;

class << self
	attr_accessor :template_en_parse_nested_expression
end
self.template_en_parse_nested_expression = 21;
class << self
	attr_accessor :template_en_parse_expression
end
self.template_en_parse_expression = 32;
class << self
	attr_accessor :template_en_main
end
self.template_en_main = 43;


# line 58 "lib/xrb/fallback/template.rl"
		
		def self.parse_template(buffer, delegate)
			data = buffer.read
			bytes = data.bytes
			
			p = 0
			pe = eof = data.bytesize
			stack = []
			
			expression_begin = expression_end = nil
			instruction_begin = instruction_end = nil
			
			
# line 505 "lib/xrb/fallback/template.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = template_start
	top = 0
	ts = nil
	te = nil
	act = 0
end

# line 71 "lib/xrb/fallback/template.rl"
			
# line 518 "lib/xrb/fallback/template.rb"
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
	when 21 then
# line 1 "NONE"
		begin
ts = p
		end
# line 546 "lib/xrb/fallback/template.rb"
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
	when 7 then
# line 7 "lib/xrb/fallback/template.rl"
		begin

		instruction_begin = p
			end
	when 8 then
# line 11 "lib/xrb/fallback/template.rl"
		begin

		instruction_end = p
			end
	when 11 then
# line 23 "lib/xrb/fallback/template.rl"
		begin

		raise ParseError.new("failed to parse instruction", buffer, p)
			end
	when 18 then
# line 13 "parsers/xrb/template.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 21
		_goto_level = _again
		next
	end
		end
	when 15 then
# line 17 "parsers/xrb/template.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 21
		_goto_level = _again
		next
	end
		end
	when 16 then
# line 20 "parsers/xrb/template.rl"
		begin
	begin
		top -= 1
		cs = stack[top]
		_goto_level = _again
		next
	end
		end
	when 3 then
# line 23 "parsers/xrb/template.rl"
		begin

		fprintf(stderr, "backtrack p=%s te=%s\n", p, te);
		p -= 1;
		te -= 1;
			end
	when 2 then
# line 1 "NONE"
		begin
te = p+1
		end
	when 10 then
# line 19 "lib/xrb/fallback/template.rl"
		begin
te = p+1
 begin 
		delegate.instruction(data.byteslice(instruction_begin...instruction_end), "\n")
	 end
		end
	when 12 then
# line 43 "lib/xrb/fallback/template.rl"
		begin
te = p+1
 begin 
		delegate.text(data.byteslice(ts...te))
	 end
		end
	when 24 then
# line 43 "lib/xrb/fallback/template.rl"
		begin
te = p
p = p - 1; begin 
		delegate.text(data.byteslice(ts...te))
	 end
		end
	when 26 then
# line 15 "lib/xrb/fallback/template.rl"
		begin
te = p
p = p - 1; begin 
		delegate.instruction(data.byteslice(instruction_begin...instruction_end))
	 end
		end
	when 23 then
# line 43 "lib/xrb/fallback/template.rl"
		begin
te = p
p = p - 1; begin 
		delegate.text(data.byteslice(ts...te))
	 end
		end
	when 1 then
# line 43 "lib/xrb/fallback/template.rl"
		begin
 begin p = ((te))-1; end
 begin 
		delegate.text(data.byteslice(ts...te))
	 end
		end
	when 4 then
# line 43 "lib/xrb/fallback/template.rl"
		begin
 begin p = ((te))-1; end
 begin 
		delegate.text(data.byteslice(ts...te))
	 end
		end
	when 9 then
# line 1 "NONE"
		begin
	case act
	when 3 then
	begin begin p = ((te))-1; end

		delegate.instruction(data.byteslice(instruction_begin...instruction_end))
	end
	when 6 then
	begin begin p = ((te))-1; end

		delegate.text(data.byteslice(ts...te))
	end
end 
			end
	when 6 then
# line 23 "lib/xrb/fallback/template.rl"
		begin

		raise ParseError.new("failed to parse instruction", buffer, p)
			end
# line 43 "lib/xrb/fallback/template.rl"
		begin
 begin p = ((te))-1; end
 begin 
		delegate.text(data.byteslice(ts...te))
	 end
		end
	when 25 then
# line 27 "lib/xrb/fallback/template.rl"
		begin

		expression_begin = p
			end
# line 62 "parsers/xrb/template.rl"
		begin
te = p
p = p - 1; begin cs = 32; end
		end
	when 17 then
# line 13 "parsers/xrb/template.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 21
		_goto_level = _again
		next
	end
		end
# line 17 "parsers/xrb/template.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 21
		_goto_level = _again
		next
	end
		end
	when 5 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 23 "parsers/xrb/template.rl"
		begin

		fprintf(stderr, "backtrack p=%s te=%s\n", p, te);
		p -= 1;
		te -= 1;
			end
	when 13 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 15 "lib/xrb/fallback/template.rl"
		begin
act = 3;		end
	when 22 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 43 "lib/xrb/fallback/template.rl"
		begin
act = 6;		end
	when 20 then
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
cs = 43;		end
# line 787 "lib/xrb/fallback/template.rb"
	end
	end
	end
	if _goto_level <= _again
	case _template_to_state_actions[cs] 
	when 14 then
# line 1 "NONE"
		begin
ts = nil;		end
# line 797 "lib/xrb/fallback/template.rb"
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
	when 11 then
# line 23 "lib/xrb/fallback/template.rl"
		begin

		raise ParseError.new("failed to parse instruction", buffer, p)
			end
	when 19 then
# line 39 "lib/xrb/fallback/template.rl"
		begin

		raise ParseError.new("failed to parse expression", buffer, p)
			end
# line 830 "lib/xrb/fallback/template.rb"
	  end
	end

	end
	if _goto_level <= _out
		break
	end
end
	end

# line 72 "lib/xrb/fallback/template.rl"
			
			if p != eof
				raise ParseError.new("could not consume all input", buffer, p)
			end
			
			return nil
		end
	end
end
