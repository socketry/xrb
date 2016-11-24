
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


# line 203 "markup.rl"


require_relative '../parse_error'

module Trenni
	module Fallback
		
# line 33 "markup.rb"
class << self
	attr_accessor :_markup_trans_keys
	private :_markup_trans_keys, :_markup_trans_keys=
end
self._markup_trans_keys = [
	0, 0, 0, 127, 0, 127, 
	0, 127, 0, 127, 62, 
	62, 34, 34, 34, 60, 
	34, 60, 9, 62, 34, 60, 
	9, 62, 45, 91, 45, 
	45, 45, 45, 45, 45, 
	45, 62, 79, 79, 67, 67, 
	84, 84, 89, 89, 80, 
	80, 69, 69, 62, 62, 
	67, 67, 68, 68, 65, 65, 
	84, 84, 65, 65, 91, 
	91, 93, 93, 93, 93, 
	62, 93, 0, 127, 0, 127, 
	0, 127, 0, 127, 9, 
	63, 63, 63, 62, 63, 
	35, 122, 48, 120, 48, 59, 
	48, 102, 48, 102, 48, 
	122, 38, 60, 38, 60, 
	38, 60, 38, 60, 38, 60, 
	38, 60, 38, 60, 38, 
	60, 38, 60, 0, 0, 
	0
]

class << self
	attr_accessor :_markup_key_spans
	private :_markup_key_spans, :_markup_key_spans=
end
self._markup_key_spans = [
	0, 128, 128, 128, 128, 1, 1, 27, 
	27, 54, 27, 54, 47, 1, 1, 1, 
	18, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	32, 128, 128, 128, 128, 55, 1, 2, 
	88, 73, 12, 55, 55, 75, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 0
]

class << self
	attr_accessor :_markup_index_offsets
	private :_markup_index_offsets, :_markup_index_offsets=
end
self._markup_index_offsets = [
	0, 0, 129, 258, 387, 516, 518, 520, 
	548, 576, 631, 659, 714, 762, 764, 766, 
	768, 787, 789, 791, 793, 795, 797, 799, 
	801, 803, 805, 807, 809, 811, 813, 815, 
	817, 850, 979, 1108, 1237, 1366, 1422, 1424, 
	1427, 1516, 1590, 1603, 1659, 1715, 1791, 1815, 
	1839, 1863, 1887, 1911, 1935, 1959, 1983, 2007
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
	20, 19, 19, 19, 21, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 1, 19, 23, 22, 22, 22, 
	24, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 1, 22, 
	25, 25, 25, 25, 25, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 25, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 26, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 27, 1, 29, 
	28, 28, 28, 30, 28, 28, 28, 28, 
	28, 28, 28, 28, 28, 28, 28, 28, 
	28, 28, 28, 28, 28, 28, 28, 28, 
	28, 1, 28, 31, 31, 31, 31, 31, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 31, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 32, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	33, 1, 34, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 36, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	37, 35, 38, 35, 39, 38, 40, 38, 
	40, 38, 38, 38, 38, 38, 38, 38, 
	38, 38, 38, 38, 38, 38, 38, 38, 
	38, 41, 38, 42, 35, 43, 35, 44, 
	35, 45, 35, 46, 35, 47, 35, 48, 
	47, 49, 35, 50, 35, 51, 35, 52, 
	35, 53, 35, 54, 35, 55, 54, 56, 
	54, 57, 54, 54, 54, 54, 54, 54, 
	54, 54, 54, 54, 54, 54, 54, 54, 
	54, 54, 54, 54, 54, 54, 54, 54, 
	54, 54, 54, 54, 54, 54, 54, 54, 
	56, 54, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 58, 
	58, 1, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 1, 1, 1, 
	1, 1, 1, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 1, 1, 1, 
	1, 58, 1, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 1, 1, 1, 
	1, 1, 58, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	59, 59, 1, 59, 59, 59, 59, 59, 
	59, 59, 59, 59, 59, 59, 1, 1, 
	1, 60, 1, 1, 59, 59, 59, 59, 
	59, 59, 59, 59, 59, 59, 59, 59, 
	59, 59, 59, 59, 59, 59, 59, 59, 
	59, 59, 59, 59, 59, 59, 1, 1, 
	1, 1, 59, 1, 59, 59, 59, 59, 
	59, 59, 59, 59, 59, 59, 59, 59, 
	59, 59, 59, 59, 59, 59, 59, 59, 
	59, 59, 59, 59, 59, 59, 1, 1, 
	1, 1, 1, 59, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 61, 61, 62, 61, 61, 61, 61, 
	61, 61, 61, 61, 61, 61, 61, 62, 
	62, 62, 62, 62, 62, 61, 61, 61, 
	61, 61, 61, 61, 61, 61, 61, 61, 
	61, 61, 61, 61, 61, 61, 61, 61, 
	61, 61, 61, 61, 61, 61, 61, 62, 
	62, 62, 62, 61, 62, 61, 61, 61, 
	61, 61, 61, 61, 61, 61, 61, 61, 
	61, 61, 61, 61, 61, 61, 61, 61, 
	61, 61, 61, 61, 61, 61, 61, 62, 
	62, 62, 62, 62, 61, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 64, 64, 
	64, 64, 64, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 64, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 63, 63, 62, 63, 63, 63, 
	63, 63, 63, 63, 63, 63, 63, 63, 
	62, 62, 62, 62, 62, 62, 63, 63, 
	63, 63, 63, 63, 63, 63, 63, 63, 
	63, 63, 63, 63, 63, 63, 63, 63, 
	63, 63, 63, 63, 63, 63, 63, 63, 
	62, 62, 62, 62, 63, 62, 63, 63, 
	63, 63, 63, 63, 63, 63, 63, 63, 
	63, 63, 63, 63, 63, 63, 63, 63, 
	63, 63, 63, 63, 63, 63, 63, 63, 
	62, 62, 62, 62, 62, 63, 66, 66, 
	66, 66, 66, 65, 65, 65, 65, 65, 
	65, 65, 65, 65, 65, 65, 65, 65, 
	65, 65, 65, 65, 65, 66, 65, 65, 
	65, 65, 65, 65, 65, 65, 65, 65, 
	65, 65, 65, 65, 65, 65, 65, 65, 
	65, 65, 65, 65, 65, 65, 65, 65, 
	65, 65, 65, 65, 67, 65, 69, 68, 
	70, 69, 68, 72, 71, 71, 71, 71, 
	71, 71, 71, 71, 71, 71, 71, 71, 
	73, 73, 73, 73, 73, 73, 73, 73, 
	73, 73, 71, 71, 71, 71, 71, 71, 
	71, 73, 73, 73, 73, 73, 73, 73, 
	73, 73, 73, 73, 73, 73, 73, 73, 
	73, 73, 73, 73, 73, 73, 73, 73, 
	73, 73, 73, 71, 71, 71, 71, 71, 
	71, 73, 73, 73, 73, 73, 73, 73, 
	73, 73, 73, 73, 73, 73, 73, 73, 
	73, 73, 73, 73, 73, 73, 73, 73, 
	73, 73, 73, 71, 74, 74, 74, 74, 
	74, 74, 74, 74, 74, 74, 71, 71, 
	71, 71, 71, 71, 71, 71, 71, 71, 
	71, 71, 71, 71, 71, 71, 71, 71, 
	71, 71, 71, 71, 71, 71, 71, 71, 
	71, 71, 71, 71, 71, 71, 71, 71, 
	71, 71, 71, 71, 71, 71, 71, 71, 
	71, 71, 71, 71, 71, 71, 71, 71, 
	71, 71, 71, 71, 71, 71, 71, 71, 
	71, 71, 71, 71, 75, 71, 76, 76, 
	76, 76, 76, 76, 76, 76, 76, 76, 
	71, 77, 71, 78, 78, 78, 78, 78, 
	78, 78, 78, 78, 78, 71, 71, 71, 
	71, 71, 71, 71, 78, 78, 78, 78, 
	78, 78, 71, 71, 71, 71, 71, 71, 
	71, 71, 71, 71, 71, 71, 71, 71, 
	71, 71, 71, 71, 71, 71, 71, 71, 
	71, 71, 71, 71, 78, 78, 78, 78, 
	78, 78, 71, 79, 79, 79, 79, 79, 
	79, 79, 79, 79, 79, 71, 80, 71, 
	71, 71, 71, 71, 79, 79, 79, 79, 
	79, 79, 71, 71, 71, 71, 71, 71, 
	71, 71, 71, 71, 71, 71, 71, 71, 
	71, 71, 71, 71, 71, 71, 71, 71, 
	71, 71, 71, 71, 79, 79, 79, 79, 
	79, 79, 71, 81, 81, 81, 81, 81, 
	81, 81, 81, 81, 81, 71, 82, 71, 
	71, 71, 71, 71, 81, 81, 81, 81, 
	81, 81, 81, 81, 81, 81, 81, 81, 
	81, 81, 81, 81, 81, 81, 81, 81, 
	81, 81, 81, 81, 81, 81, 71, 71, 
	71, 71, 71, 71, 81, 81, 81, 81, 
	81, 81, 81, 81, 81, 81, 81, 81, 
	81, 81, 81, 81, 81, 81, 81, 81, 
	81, 81, 81, 81, 81, 81, 71, 84, 
	83, 83, 83, 83, 83, 83, 83, 83, 
	83, 83, 83, 83, 83, 83, 83, 83, 
	83, 83, 83, 83, 83, 85, 83, 87, 
	86, 86, 86, 86, 86, 86, 86, 86, 
	86, 86, 86, 86, 86, 86, 86, 86, 
	86, 86, 86, 86, 86, 88, 86, 90, 
	89, 89, 89, 89, 89, 89, 89, 89, 
	89, 89, 89, 89, 89, 89, 89, 89, 
	89, 89, 89, 89, 89, 91, 89, 93, 
	92, 92, 92, 92, 92, 92, 92, 92, 
	92, 92, 92, 92, 92, 92, 92, 92, 
	92, 92, 92, 92, 92, 94, 92, 96, 
	95, 95, 95, 95, 95, 95, 95, 95, 
	95, 95, 95, 95, 95, 95, 95, 95, 
	95, 95, 95, 95, 95, 97, 95, 99, 
	98, 98, 98, 98, 98, 98, 98, 98, 
	98, 98, 98, 98, 98, 98, 98, 98, 
	98, 98, 98, 98, 98, 100, 98, 102, 
	101, 101, 101, 101, 101, 101, 101, 101, 
	101, 101, 101, 101, 101, 101, 101, 101, 
	101, 101, 101, 101, 101, 103, 101, 105, 
	104, 104, 104, 104, 104, 104, 104, 104, 
	104, 104, 104, 104, 104, 104, 104, 104, 
	104, 104, 104, 104, 104, 106, 104, 108, 
	107, 107, 107, 107, 107, 107, 107, 107, 
	107, 107, 107, 107, 107, 107, 107, 107, 
	107, 107, 107, 107, 107, 109, 107, 35, 
	0
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
	2, 1, 0, 0, 0, 0, 3, 4, 
	3, 5, 0, 6, 0, 0, 7, 8, 
	9, 7, 0, 10, 0, 11, 12, 13, 
	14, 15, 16, 15, 17, 18, 19, 20, 
	21, 20, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 2, 0, 9, 2, 25, 0, 
	9, 26, 26, 27, 0, 28, 0, 29, 
	0, 30, 30, 0, 0, 31, 30, 0, 
	32, 0, 33, 34, 35, 36, 12, 14, 
	38, 17, 19, 40, 42, 43, 44, 46, 
	47, 48, 50, 51, 52, 54, 55, 56, 
	58, 59, 60, 62, 63, 64
]

class << self
	attr_accessor :_markup_eof_actions
	private :_markup_eof_actions, :_markup_eof_actions=
end
self._markup_eof_actions = [
	0, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 0, 0, 22, 22, 
	22, 0, 0, 0, 0, 0, 0, 23, 
	0, 0, 0, 0, 0, 0, 24, 24, 
	24, 1, 1, 25, 25, 25, 25, 25, 
	29, 29, 29, 29, 29, 29, 0, 37, 
	39, 41, 45, 49, 53, 57, 61, 0
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


# line 210 "markup.rl"
		
		def self.parse_markup(buffer, delegate, entities)
			data = buffer.read
			bytes = data.bytes
			
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
			instruction_text_begin = instruction_text_end = nil
			cdata_begin = cdata_end = nil
			has_value = false
			
			
# line 451 "markup.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = markup_start
	top = 0
end

# line 231 "markup.rl"
			
# line 461 "markup.rb"
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
# line 24 "markup.rl"
		begin

		identifier_begin = p
			end
	when 9 then
# line 28 "markup.rl"
		begin

		identifier_end = p
			end
	when 18 then
# line 36 "markup.rl"
		begin

			end
	when 17 then
# line 39 "markup.rl"
		begin

		characters_begin = p
			end
	when 29 then
# line 49 "markup.rl"
		begin

		raise ParseError.new("could not parse entity", buffer, p)
			end
	when 30 then
# line 53 "markup.rl"
		begin

		entity_begin = p
			end
	when 26 then
# line 108 "markup.rl"
		begin

		instruction_text_begin = p
			end
	when 28 then
# line 112 "markup.rl"
		begin

		instruction_text_end = p
			end
	when 25 then
# line 123 "markup.rl"
		begin

		raise ParseError.new("could not parse instruction", buffer, p)
			end
	when 6 then
# line 136 "markup.rl"
		begin

		self_closing = true
			end
	when 1 then
# line 174 "markup.rl"
		begin

		raise ParseError.new("could not parse tag", buffer, p)
			end
	when 19 then
# line 10 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 40
		_goto_level = _again
		next
	end
		end
	when 3 then
# line 28 "markup.rl"
		begin

		identifier_end = p
			end
# line 127 "markup.rl"
		begin

		self_closing = false
		
		delegate.open_tag_begin(data.byteslice(identifier_begin...identifier_end))
			end
	when 7 then
# line 28 "markup.rl"
		begin

		identifier_end = p
			end
# line 153 "markup.rl"
		begin

		if has_value
			value = pcdata
		else
			value = true
		end
		
		delegate.attribute(data.byteslice(identifier_begin...identifier_end), value)
			end
	when 10 then
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
# line 39 "markup.rl"
		begin

		characters_begin = p
			end
	when 11 then
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
# line 10 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 40
		_goto_level = _again
		next
	end
		end
	when 13 then
# line 43 "markup.rl"
		begin

		characters_end = p
		
		pcdata << data.byteslice(characters_begin...characters_end)
			end
# line 36 "markup.rl"
		begin

			end
	when 12 then
# line 43 "markup.rl"
		begin

		characters_end = p
		
		pcdata << data.byteslice(characters_begin...characters_end)
			end
# line 39 "markup.rl"
		begin

		characters_begin = p
			end
	when 14 then
# line 43 "markup.rl"
		begin

		characters_end = p
		
		pcdata << data.byteslice(characters_begin...characters_end)
			end
# line 10 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 40
		_goto_level = _again
		next
	end
		end
	when 33 then
# line 57 "markup.rl"
		begin

		entity_end = p
		
		name = data.byteslice(entity_begin...entity_end)
		
		pcdata << entities[name]
			end
# line 8 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
		begin
	begin
		top -= 1
		cs = stack[top]
		_goto_level = _again
		next
	end
		end
	when 32 then
# line 65 "markup.rl"
		begin

		entity_end = p
		
		pcdata << data.byteslice(entity_begin...entity_end).to_i(16)
			end
# line 8 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
		begin
	begin
		top -= 1
		cs = stack[top]
		_goto_level = _again
		next
	end
		end
	when 31 then
# line 71 "markup.rl"
		begin

		entity_end = p
		
		pcdata << data.byteslice(entity_begin...entity_end).to_i(10)
			end
# line 8 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
		begin
	begin
		top -= 1
		cs = stack[top]
		_goto_level = _again
		next
	end
		end
	when 27 then
# line 108 "markup.rl"
		begin

		instruction_text_begin = p
			end
# line 112 "markup.rl"
		begin

		instruction_text_end = p
			end
	when 5 then
# line 140 "markup.rl"
		begin

		has_value = false
		pcdata = ""
			end
# line 24 "markup.rl"
		begin

		identifier_begin = p
			end
	when 15 then
# line 145 "markup.rl"
		begin

		has_value = true
			end
# line 153 "markup.rl"
		begin

		if has_value
			value = pcdata
		else
			value = true
		end
		
		delegate.attribute(data.byteslice(identifier_begin...identifier_end), value)
			end
	when 20 then
# line 149 "markup.rl"
		begin

		has_value = true
			end
# line 153 "markup.rl"
		begin

		if has_value
			value = pcdata
		else
			value = true
		end
		
		delegate.attribute(data.byteslice(identifier_begin...identifier_end), value)
			end
	when 4 then
# line 28 "markup.rl"
		begin

		identifier_end = p
			end
# line 127 "markup.rl"
		begin

		self_closing = false
		
		delegate.open_tag_begin(data.byteslice(identifier_begin...identifier_end))
			end
# line 136 "markup.rl"
		begin

		self_closing = true
			end
	when 8 then
# line 28 "markup.rl"
		begin

		identifier_end = p
			end
# line 153 "markup.rl"
		begin

		if has_value
			value = pcdata
		else
			value = true
		end
		
		delegate.attribute(data.byteslice(identifier_begin...identifier_end), value)
			end
# line 136 "markup.rl"
		begin

		self_closing = true
			end
	when 16 then
# line 145 "markup.rl"
		begin

		has_value = true
			end
# line 153 "markup.rl"
		begin

		if has_value
			value = pcdata
		else
			value = true
		end
		
		delegate.attribute(data.byteslice(identifier_begin...identifier_end), value)
			end
# line 136 "markup.rl"
		begin

		self_closing = true
			end
	when 21 then
# line 149 "markup.rl"
		begin

		has_value = true
			end
# line 153 "markup.rl"
		begin

		if has_value
			value = pcdata
		else
			value = true
		end
		
		delegate.attribute(data.byteslice(identifier_begin...identifier_end), value)
			end
# line 136 "markup.rl"
		begin

		self_closing = true
			end
	when 34 then
# line 192 "markup.rl"
		begin

			end
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
# line 39 "markup.rl"
		begin

		characters_begin = p
			end
	when 35 then
# line 192 "markup.rl"
		begin

			end
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
# line 10 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 40
		_goto_level = _again
		next
	end
		end
	when 50 then
# line 81 "markup.rl"
		begin

		doctype_end = p
		
		delegate.doctype(data.byteslice(doctype_begin...doctype_end))
			end
# line 192 "markup.rl"
		begin

			end
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
# line 39 "markup.rl"
		begin

		characters_begin = p
			end
	when 51 then
# line 81 "markup.rl"
		begin

		doctype_end = p
		
		delegate.doctype(data.byteslice(doctype_begin...doctype_end))
			end
# line 192 "markup.rl"
		begin

			end
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
# line 10 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 40
		_goto_level = _again
		next
	end
		end
	when 46 then
# line 95 "markup.rl"
		begin

		comment_end = p
		
		delegate.comment(data.byteslice(comment_begin...comment_end))
			end
# line 192 "markup.rl"
		begin

			end
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
# line 39 "markup.rl"
		begin

		characters_begin = p
			end
	when 47 then
# line 95 "markup.rl"
		begin

		comment_end = p
		
		delegate.comment(data.byteslice(comment_begin...comment_end))
			end
# line 192 "markup.rl"
		begin

			end
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
# line 10 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 40
		_goto_level = _again
		next
	end
		end
	when 62 then
# line 116 "markup.rl"
		begin

		delegate.instruction(
			data.byteslice(identifier_begin...identifier_end),
			data.byteslice(instruction_text_begin...instruction_text_end)
		)
			end
# line 192 "markup.rl"
		begin

			end
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
# line 39 "markup.rl"
		begin

		characters_begin = p
			end
	when 63 then
# line 116 "markup.rl"
		begin

		delegate.instruction(
			data.byteslice(identifier_begin...identifier_end),
			data.byteslice(instruction_text_begin...instruction_text_end)
		)
			end
# line 192 "markup.rl"
		begin

			end
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
# line 10 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 40
		_goto_level = _again
		next
	end
		end
	when 42 then
# line 163 "markup.rl"
		begin

		delegate.open_tag_end(self_closing)
			end
# line 192 "markup.rl"
		begin

			end
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
# line 39 "markup.rl"
		begin

		characters_begin = p
			end
	when 43 then
# line 163 "markup.rl"
		begin

		delegate.open_tag_end(self_closing)
			end
# line 192 "markup.rl"
		begin

			end
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
# line 10 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 40
		_goto_level = _again
		next
	end
		end
	when 58 then
# line 170 "markup.rl"
		begin

		delegate.close_tag(data.byteslice(identifier_begin...identifier_end))
			end
# line 192 "markup.rl"
		begin

			end
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
# line 39 "markup.rl"
		begin

		characters_begin = p
			end
	when 59 then
# line 170 "markup.rl"
		begin

		delegate.close_tag(data.byteslice(identifier_begin...identifier_end))
			end
# line 192 "markup.rl"
		begin

			end
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
# line 10 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 40
		_goto_level = _again
		next
	end
		end
	when 54 then
# line 182 "markup.rl"
		begin

		cdata_end = p
		
		delegate.cdata(data.byteslice(cdata_begin...cdata_end))
			end
# line 192 "markup.rl"
		begin

			end
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
# line 39 "markup.rl"
		begin

		characters_begin = p
			end
	when 55 then
# line 182 "markup.rl"
		begin

		cdata_end = p
		
		delegate.cdata(data.byteslice(cdata_begin...cdata_end))
			end
# line 192 "markup.rl"
		begin

			end
# line 32 "markup.rl"
		begin

		pcdata = ""
			end
# line 10 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/entities.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 40
		_goto_level = _again
		next
	end
		end
	when 36 then
# line 133 "markup.rl"
		begin

			end
# line 167 "markup.rl"
		begin

			end
# line 105 "markup.rl"
		begin

			end
# line 91 "markup.rl"
		begin

		comment_begin = p
			end
# line 77 "markup.rl"
		begin

		doctype_begin = p
			end
# line 178 "markup.rl"
		begin

		cdata_begin = p
			end
	when 52 then
# line 81 "markup.rl"
		begin

		doctype_end = p
		
		delegate.doctype(data.byteslice(doctype_begin...doctype_end))
			end
# line 133 "markup.rl"
		begin

			end
# line 167 "markup.rl"
		begin

			end
# line 105 "markup.rl"
		begin

			end
# line 91 "markup.rl"
		begin

		comment_begin = p
			end
# line 77 "markup.rl"
		begin

		doctype_begin = p
			end
# line 178 "markup.rl"
		begin

		cdata_begin = p
			end
	when 48 then
# line 95 "markup.rl"
		begin

		comment_end = p
		
		delegate.comment(data.byteslice(comment_begin...comment_end))
			end
# line 133 "markup.rl"
		begin

			end
# line 167 "markup.rl"
		begin

			end
# line 105 "markup.rl"
		begin

			end
# line 91 "markup.rl"
		begin

		comment_begin = p
			end
# line 77 "markup.rl"
		begin

		doctype_begin = p
			end
# line 178 "markup.rl"
		begin

		cdata_begin = p
			end
	when 64 then
# line 116 "markup.rl"
		begin

		delegate.instruction(
			data.byteslice(identifier_begin...identifier_end),
			data.byteslice(instruction_text_begin...instruction_text_end)
		)
			end
# line 133 "markup.rl"
		begin

			end
# line 167 "markup.rl"
		begin

			end
# line 105 "markup.rl"
		begin

			end
# line 91 "markup.rl"
		begin

		comment_begin = p
			end
# line 77 "markup.rl"
		begin

		doctype_begin = p
			end
# line 178 "markup.rl"
		begin

		cdata_begin = p
			end
	when 44 then
# line 163 "markup.rl"
		begin

		delegate.open_tag_end(self_closing)
			end
# line 133 "markup.rl"
		begin

			end
# line 167 "markup.rl"
		begin

			end
# line 105 "markup.rl"
		begin

			end
# line 91 "markup.rl"
		begin

		comment_begin = p
			end
# line 77 "markup.rl"
		begin

		doctype_begin = p
			end
# line 178 "markup.rl"
		begin

		cdata_begin = p
			end
	when 60 then
# line 170 "markup.rl"
		begin

		delegate.close_tag(data.byteslice(identifier_begin...identifier_end))
			end
# line 133 "markup.rl"
		begin

			end
# line 167 "markup.rl"
		begin

			end
# line 105 "markup.rl"
		begin

			end
# line 91 "markup.rl"
		begin

		comment_begin = p
			end
# line 77 "markup.rl"
		begin

		doctype_begin = p
			end
# line 178 "markup.rl"
		begin

		cdata_begin = p
			end
	when 56 then
# line 182 "markup.rl"
		begin

		cdata_end = p
		
		delegate.cdata(data.byteslice(cdata_begin...cdata_end))
			end
# line 133 "markup.rl"
		begin

			end
# line 167 "markup.rl"
		begin

			end
# line 105 "markup.rl"
		begin

			end
# line 91 "markup.rl"
		begin

		comment_begin = p
			end
# line 77 "markup.rl"
		begin

		doctype_begin = p
			end
# line 178 "markup.rl"
		begin

		cdata_begin = p
			end
	when 40 then
# line 36 "markup.rl"
		begin

			end
# line 195 "markup.rl"
		begin

		delegate.text(pcdata)
			end
# line 133 "markup.rl"
		begin

			end
# line 167 "markup.rl"
		begin

			end
# line 105 "markup.rl"
		begin

			end
# line 91 "markup.rl"
		begin

		comment_begin = p
			end
# line 77 "markup.rl"
		begin

		doctype_begin = p
			end
# line 178 "markup.rl"
		begin

		cdata_begin = p
			end
	when 38 then
# line 43 "markup.rl"
		begin

		characters_end = p
		
		pcdata << data.byteslice(characters_begin...characters_end)
			end
# line 36 "markup.rl"
		begin

			end
# line 195 "markup.rl"
		begin

		delegate.text(pcdata)
			end
# line 133 "markup.rl"
		begin

			end
# line 167 "markup.rl"
		begin

			end
# line 105 "markup.rl"
		begin

			end
# line 91 "markup.rl"
		begin

		comment_begin = p
			end
# line 77 "markup.rl"
		begin

		doctype_begin = p
			end
# line 178 "markup.rl"
		begin

		cdata_begin = p
			end
# line 1507 "markup.rb"
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
	when 29 then
# line 49 "markup.rl"
		begin

		raise ParseError.new("could not parse entity", buffer, p)
			end
	when 49 then
# line 81 "markup.rl"
		begin

		doctype_end = p
		
		delegate.doctype(data.byteslice(doctype_begin...doctype_end))
			end
	when 23 then
# line 87 "markup.rl"
		begin

		raise ParseError.new("could not parse doctype", buffer, p)
			end
	when 45 then
# line 95 "markup.rl"
		begin

		comment_end = p
		
		delegate.comment(data.byteslice(comment_begin...comment_end))
			end
	when 22 then
# line 101 "markup.rl"
		begin

		raise ParseError.new("could not parse comment", buffer, p)
			end
	when 61 then
# line 116 "markup.rl"
		begin

		delegate.instruction(
			data.byteslice(identifier_begin...identifier_end),
			data.byteslice(instruction_text_begin...instruction_text_end)
		)
			end
	when 25 then
# line 123 "markup.rl"
		begin

		raise ParseError.new("could not parse instruction", buffer, p)
			end
	when 41 then
# line 163 "markup.rl"
		begin

		delegate.open_tag_end(self_closing)
			end
	when 57 then
# line 170 "markup.rl"
		begin

		delegate.close_tag(data.byteslice(identifier_begin...identifier_end))
			end
	when 1 then
# line 174 "markup.rl"
		begin

		raise ParseError.new("could not parse tag", buffer, p)
			end
	when 53 then
# line 182 "markup.rl"
		begin

		cdata_end = p
		
		delegate.cdata(data.byteslice(cdata_begin...cdata_end))
			end
	when 24 then
# line 188 "markup.rl"
		begin

		raise ParseError.new("could not parse cdata", buffer, p)
			end
	when 39 then
# line 36 "markup.rl"
		begin

			end
# line 195 "markup.rl"
		begin

		delegate.text(pcdata)
			end
	when 37 then
# line 43 "markup.rl"
		begin

		characters_end = p
		
		pcdata << data.byteslice(characters_begin...characters_end)
			end
# line 36 "markup.rl"
		begin

			end
# line 195 "markup.rl"
		begin

		delegate.text(pcdata)
			end
# line 1633 "markup.rb"
	  end
	end

	end
	if _goto_level <= _out
		break
	end
end
	end

# line 232 "markup.rl"
			
			if p != eof
				raise ParseError.new("could not consume all input", buffer, p)
			end
			
			return nil
		end
	end
end
