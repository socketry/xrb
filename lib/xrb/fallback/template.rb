
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
	0, 0, 34, 125, 34, 35, 
	35, 125, 35, 125, 34, 
	39, 35, 125, 35, 125, 
	34, 123, 34, 123, 39, 39, 
	34, 125, 34, 125, 34, 
	35, 35, 125, 35, 125, 
	34, 39, 35, 125, 35, 125, 
	34, 123, 34, 123, 39, 
	39, 34, 125, 9, 60, 
	10, 10, 9, 60, 10, 63, 
	10, 114, 9, 32, 10, 
	63, 10, 62, 9, 32, 
	10, 123, 10, 10, 10, 63, 
	0, 127, 0, 127, 10, 
	63, 10, 62, 0, 127, 
	10, 63, 10, 62, 34, 39, 
	34, 35, 39, 39, 0, 
	0, 34, 39, 34, 35, 
	39, 39, 0, 0, 0
]

class << self
	attr_accessor :_template_key_spans
	private :_template_key_spans, :_template_key_spans=
end
self._template_key_spans = [
	0, 92, 2, 91, 91, 6, 91, 91, 
	90, 90, 1, 92, 92, 2, 91, 91, 
	6, 91, 91, 90, 90, 1, 92, 52, 
	1, 52, 54, 105, 24, 54, 53, 24, 
	114, 1, 54, 128, 128, 54, 53, 128, 
	54, 53, 6, 2, 1, 0, 6, 2, 
	1, 0
]

class << self
	attr_accessor :_template_index_offsets
	private :_template_index_offsets, :_template_index_offsets=
end
self._template_index_offsets = [
	0, 0, 93, 96, 188, 280, 287, 379, 
	471, 562, 653, 655, 748, 841, 844, 936, 
	1028, 1035, 1127, 1219, 1310, 1401, 1403, 1496, 
	1549, 1551, 1604, 1659, 1765, 1790, 1845, 1899, 
	1924, 2039, 2041, 2096, 2225, 2354, 2409, 2463, 
	2592, 2647, 2701, 2708, 2711, 2713, 2714, 2721, 
	2724, 2726
]

class << self
	attr_accessor :_template_indicies
	private :_template_indicies, :_template_indicies=
end
self._template_indicies = [
	1, 0, 0, 0, 0, 2, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 3, 0, 4, 0, 5, 6, 1, 
	7, 5, 5, 5, 8, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	9, 5, 10, 5, 7, 5, 5, 5, 
	8, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 11, 5, 10, 5, 
	12, 13, 8, 8, 8, 12, 8, 14, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 15, 
	12, 16, 12, 14, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	12, 12, 12, 17, 12, 16, 12, 12, 
	13, 8, 8, 8, 12, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	8, 8, 8, 8, 8, 8, 8, 8, 
	18, 8, 5, 6, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 19, 1, 20, 2, 8, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 20, 20, 20, 20, 20, 
	21, 20, 22, 20, 24, 23, 23, 23, 
	23, 25, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 26, 23, 27, 
	23, 28, 29, 24, 30, 28, 28, 28, 
	31, 28, 28, 28, 28, 28, 28, 28, 
	28, 28, 28, 28, 28, 28, 28, 28, 
	28, 28, 28, 28, 28, 28, 28, 28, 
	28, 28, 28, 28, 28, 28, 28, 28, 
	28, 28, 28, 28, 28, 28, 28, 28, 
	28, 28, 28, 28, 28, 28, 28, 28, 
	28, 28, 28, 28, 28, 28, 28, 28, 
	28, 28, 28, 28, 28, 28, 28, 28, 
	28, 28, 28, 28, 28, 28, 28, 28, 
	28, 28, 28, 28, 28, 28, 28, 28, 
	28, 28, 28, 28, 32, 28, 33, 28, 
	30, 28, 28, 28, 31, 28, 28, 28, 
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
	34, 28, 33, 28, 35, 36, 31, 31, 
	31, 35, 31, 37, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 38, 35, 39, 35, 37, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 40, 
	35, 39, 35, 35, 36, 31, 31, 31, 
	35, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 41, 31, 28, 29, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 42, 
	24, 43, 25, 31, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 44, 43, 45, 43, 
	47, 48, 47, 47, 47, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 47, 
	46, 46, 49, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 50, 46, 48, 46, 47, 
	48, 47, 47, 47, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 47, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 53, 46, 48, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 54, 46, 48, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 55, 46, 56, 57, 56, 
	56, 56, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 56, 46, 59, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 60, 58, 59, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 61, 58, 61, 62, 61, 61, 61, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 61, 46, 48, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 63, 46, 66, 
	65, 48, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 67, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 48, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 68, 68, 46, 
	68, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 68, 46, 46, 46, 46, 46, 
	46, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 68, 46, 46, 46, 46, 68, 
	46, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 69, 68, 68, 68, 68, 68, 
	68, 68, 68, 46, 46, 46, 46, 46, 
	68, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 70, 71, 70, 70, 70, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 70, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 68, 68, 
	46, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 68, 68, 46, 46, 46, 46, 
	46, 46, 68, 68, 68, 68, 68, 68, 
	68, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 68, 68, 46, 46, 46, 46, 
	68, 46, 68, 68, 68, 68, 68, 68, 
	68, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 68, 68, 46, 46, 46, 46, 
	46, 68, 71, 70, 70, 70, 70, 70, 
	70, 70, 70, 70, 70, 70, 70, 70, 
	70, 70, 70, 70, 70, 70, 70, 70, 
	70, 70, 70, 70, 70, 70, 70, 70, 
	70, 70, 70, 70, 70, 70, 70, 70, 
	70, 70, 70, 70, 70, 70, 70, 70, 
	70, 70, 70, 70, 70, 70, 70, 72, 
	70, 71, 70, 70, 70, 70, 70, 70, 
	70, 70, 70, 70, 70, 70, 70, 70, 
	70, 70, 70, 70, 70, 70, 70, 70, 
	70, 70, 70, 70, 70, 70, 70, 70, 
	70, 70, 70, 70, 70, 70, 70, 70, 
	70, 70, 70, 70, 70, 70, 70, 70, 
	70, 70, 70, 70, 70, 73, 70, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	74, 75, 74, 74, 74, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 46, 46, 46, 74, 
	46, 46, 46, 46, 46, 46, 46, 46, 
	46, 46, 46, 46, 68, 68, 46, 68, 
	68, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 46, 46, 46, 46, 46, 46, 
	68, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 46, 46, 46, 46, 68, 46, 
	68, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 68, 68, 68, 68, 68, 68, 
	68, 68, 46, 46, 46, 46, 46, 68, 
	77, 76, 76, 76, 76, 76, 76, 76, 
	76, 76, 76, 76, 76, 76, 76, 76, 
	76, 76, 76, 76, 76, 76, 76, 76, 
	76, 76, 76, 76, 76, 76, 76, 76, 
	76, 76, 76, 76, 76, 76, 76, 76, 
	76, 76, 76, 76, 76, 76, 76, 76, 
	76, 76, 76, 76, 76, 78, 76, 77, 
	76, 76, 76, 76, 76, 76, 76, 76, 
	76, 76, 76, 76, 76, 76, 76, 76, 
	76, 76, 76, 76, 76, 76, 76, 76, 
	76, 76, 76, 76, 76, 76, 76, 76, 
	76, 76, 76, 76, 76, 76, 76, 76, 
	76, 76, 76, 76, 76, 76, 76, 76, 
	76, 76, 76, 79, 76, 12, 13, 8, 
	8, 8, 12, 8, 5, 6, 1, 20, 
	2, 80, 35, 36, 31, 31, 31, 35, 
	31, 28, 29, 24, 43, 25, 80, 0
]

class << self
	attr_accessor :_template_trans_targs
	private :_template_trans_targs, :_template_trans_targs=
end
self._template_trans_targs = [
	1, 2, 10, 1, 45, 3, 9, 4, 
	5, 3, 43, 3, 6, 8, 7, 6, 
	42, 6, 5, 2, 11, 11, 44, 12, 
	13, 21, 12, 49, 14, 20, 15, 16, 
	14, 47, 14, 17, 19, 18, 17, 46, 
	17, 16, 13, 22, 22, 48, 24, 25, 
	24, 32, 34, 23, 23, 26, 27, 28, 
	29, 29, 29, 29, 30, 31, 24, 33, 
	23, 24, 24, 35, 36, 39, 37, 37, 
	38, 24, 40, 40, 40, 40, 41, 31, 
	0
]

class << self
	attr_accessor :_template_trans_actions
	private :_template_trans_actions, :_template_trans_actions=
end
self._template_trans_actions = [
	0, 0, 0, 2, 3, 0, 0, 0, 
	0, 2, 3, 4, 0, 0, 0, 2, 
	3, 4, 5, 5, 0, 2, 3, 0, 
	0, 0, 2, 7, 0, 0, 0, 0, 
	2, 7, 4, 0, 0, 0, 2, 7, 
	4, 5, 5, 0, 2, 7, 9, 0, 
	10, 0, 0, 11, 12, 0, 0, 0, 
	13, 14, 9, 10, 15, 9, 16, 0, 
	17, 18, 19, 0, 0, 0, 9, 10, 
	0, 20, 13, 14, 9, 10, 15, 21, 
	0
]

class << self
	attr_accessor :_template_to_state_actions
	private :_template_to_state_actions, :_template_to_state_actions=
end
self._template_to_state_actions = [
	0, 1, 1, 1, 0, 1, 1, 0, 
	0, 0, 0, 1, 1, 1, 1, 0, 
	1, 1, 0, 0, 0, 0, 1, 1, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0
]

class << self
	attr_accessor :_template_from_state_actions
	private :_template_from_state_actions, :_template_from_state_actions=
end
self._template_from_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 8, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0
]

class << self
	attr_accessor :_template_eof_actions
	private :_template_eof_actions, :_template_eof_actions=
end
self._template_eof_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 6, 6, 6, 6, 
	6, 6, 6, 6, 6, 6, 6, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0
]

class << self
	attr_accessor :_template_eof_trans
	private :_template_eof_trans, :_template_eof_trans=
end
self._template_eof_trans = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	52, 53, 53, 53, 53, 52, 53, 52, 
	53, 65, 53, 53, 53, 52, 53, 53, 
	52, 53, 0, 0, 0, 0, 0, 0, 
	0, 0
]

class << self
	attr_accessor :template_start
end
self.template_start = 23;
class << self
	attr_accessor :template_first_final
end
self.template_first_final = 23;
class << self
	attr_accessor :template_error
end
self.template_error = 0;

class << self
	attr_accessor :template_en_parse_nested_expression
end
self.template_en_parse_nested_expression = 1;
class << self
	attr_accessor :template_en_parse_expression
end
self.template_en_parse_expression = 12;
class << self
	attr_accessor :template_en_main
end
self.template_en_main = 23;


# line 58 "lib/xrb/fallback/template.rl"
		
		def self.parse_template(buffer, delegate)
			data = buffer.read
			bytes = data.bytes
			
			p = 0
			pe = eof = data.bytesize
			stack = []
			
			expression_begin = expression_end = nil
			instruction_begin = instruction_end = nil
			
			
# line 552 "lib/xrb/fallback/template.rb"
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
			
# line 565 "lib/xrb/fallback/template.rb"
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
	when 8 then
# line 1 "NONE"
		begin
ts = p
		end
# line 593 "lib/xrb/fallback/template.rb"
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
	when 15 then
# line 11 "lib/xrb/fallback/template.rl"
		begin

		instruction_end = p
			end
	when 5 then
# line 13 "parsers/xrb/template.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 1
		_goto_level = _again
		next
	end
		end
	when 2 then
# line 17 "parsers/xrb/template.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 1
		_goto_level = _again
		next
	end
		end
	when 3 then
# line 20 "parsers/xrb/template.rl"
		begin
	begin
		top -= 1
		cs = stack[top]
		_goto_level = _again
		next
	end
		end
	when 12 then
# line 43 "lib/xrb/fallback/template.rl"
		begin
te = p
p = p - 1; begin 
		delegate.text(data.byteslice(ts...te))
	 end
		end
	when 11 then
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
	when 3 then
	begin begin p = ((te))-1; end

		delegate.instruction(data.byteslice(instruction_begin...instruction_end))
	end
	when 5 then
	begin begin p = ((te))-1; end

		delegate.text(data.byteslice(ts...te))
	end
	when 6 then
	begin begin p = ((te))-1; end

		delegate.text(data.byteslice(ts...te))
	end
end 
			end
	when 17 then
# line 27 "lib/xrb/fallback/template.rl"
		begin

		expression_begin = p
			end
# line 53 "parsers/xrb/template.rl"
		begin
te = p
p = p - 1; begin cs = 12; end
		end
	when 4 then
# line 13 "parsers/xrb/template.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 1
		_goto_level = _again
		next
	end
		end
# line 17 "parsers/xrb/template.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 1
		_goto_level = _again
		next
	end
		end
	when 16 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 19 "lib/xrb/fallback/template.rl"
		begin
act = 1;		end
	when 10 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 43 "lib/xrb/fallback/template.rl"
		begin
act = 2;		end
	when 21 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 15 "lib/xrb/fallback/template.rl"
		begin
act = 3;		end
	when 20 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 43 "lib/xrb/fallback/template.rl"
		begin
act = 5;		end
	when 9 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 43 "lib/xrb/fallback/template.rl"
		begin
act = 6;		end
	when 7 then
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
cs = 23;		end
	when 14 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 7 "lib/xrb/fallback/template.rl"
		begin

		instruction_begin = p
			end
# line 43 "lib/xrb/fallback/template.rl"
		begin
act = 2;		end
	when 13 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 7 "lib/xrb/fallback/template.rl"
		begin

		instruction_begin = p
			end
# line 43 "lib/xrb/fallback/template.rl"
		begin
act = 6;		end
	when 18 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 27 "lib/xrb/fallback/template.rl"
		begin

		expression_begin = p
			end
# line 43 "lib/xrb/fallback/template.rl"
		begin
act = 6;		end
	when 19 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 43 "lib/xrb/fallback/template.rl"
		begin
act = 2;		end
# line 27 "lib/xrb/fallback/template.rl"
		begin

		expression_begin = p
			end
# line 827 "lib/xrb/fallback/template.rb"
	end
	end
	end
	if _goto_level <= _again
	case _template_to_state_actions[cs] 
	when 1 then
# line 1 "NONE"
		begin
ts = nil;		end
# line 837 "lib/xrb/fallback/template.rb"
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
	when 6 then
# line 39 "lib/xrb/fallback/template.rl"
		begin

		raise ParseError.new("failed to parse expression", buffer, p)
			end
# line 864 "lib/xrb/fallback/template.rb"
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
