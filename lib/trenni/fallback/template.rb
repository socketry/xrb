
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


# line 68 "template.rl"


require_relative '../parse_error'

module Trenni
	module Fallback
		
# line 33 "template.rb"
class << self
	attr_accessor :_template_trans_keys
	private :_template_trans_keys, :_template_trans_keys=
end
self._template_trans_keys = [
	0, 0, 10, 60, 123, 123, 
	63, 63, 123, 123, 63, 
	63, 63, 63, 114, 114, 
	9, 32, 9, 63, 63, 63, 
	62, 62, 9, 32, 123, 
	123, 63, 63, 0, 127, 
	0, 127, 63, 63, 62, 62, 
	0, 127, 9, 63, 63, 
	63, 62, 62, 34, 125, 
	34, 35, 35, 125, 35, 125, 
	34, 39, 35, 125, 35, 
	125, 34, 123, 34, 123, 
	39, 39, 34, 125, 34, 125, 
	34, 35, 35, 125, 35, 
	125, 34, 39, 35, 125, 
	35, 125, 34, 123, 34, 123, 
	39, 39, 34, 125, 9, 
	60, 10, 60, 10, 60, 
	9, 60, 9, 32, 0, 0, 
	34, 39, 34, 35, 39, 
	39, 0, 0, 34, 39, 
	34, 35, 39, 39, 0, 0, 
	0
]

class << self
	attr_accessor :_template_key_spans
	private :_template_key_spans, :_template_key_spans=
end
self._template_key_spans = [
	0, 51, 1, 1, 1, 1, 1, 1, 
	24, 55, 1, 1, 24, 1, 1, 128, 
	128, 1, 1, 128, 55, 1, 1, 92, 
	2, 91, 91, 6, 91, 91, 90, 90, 
	1, 92, 92, 2, 91, 91, 6, 91, 
	91, 90, 90, 1, 92, 52, 51, 51, 
	52, 24, 0, 6, 2, 1, 0, 6, 
	2, 1, 0
]

class << self
	attr_accessor :_template_index_offsets
	private :_template_index_offsets, :_template_index_offsets=
end
self._template_index_offsets = [
	0, 0, 52, 54, 56, 58, 60, 62, 
	64, 89, 145, 147, 149, 174, 176, 178, 
	307, 436, 438, 440, 569, 625, 627, 629, 
	722, 725, 817, 909, 916, 1008, 1100, 1191, 
	1282, 1284, 1377, 1470, 1473, 1565, 1657, 1664, 
	1756, 1848, 1939, 2030, 2032, 2125, 2178, 2230, 
	2282, 2335, 2360, 2361, 2368, 2371, 2373, 2374, 
	2381, 2384, 2386
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
	1, 1, 4, 1, 0, 1, 0, 1, 
	5, 6, 5, 6, 7, 6, 8, 5, 
	10, 10, 10, 10, 10, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 10, 
	5, 12, 12, 12, 12, 12, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	12, 11, 11, 11, 11, 11, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 13, 
	11, 15, 14, 16, 14, 16, 18, 16, 
	16, 16, 17, 17, 17, 17, 17, 17, 
	17, 17, 17, 17, 17, 17, 17, 17, 
	17, 17, 17, 17, 16, 17, 19, 6, 
	20, 6, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 21, 
	21, 22, 21, 21, 21, 21, 21, 21, 
	21, 21, 21, 21, 21, 22, 22, 22, 
	22, 22, 22, 21, 21, 21, 21, 21, 
	21, 21, 21, 21, 21, 21, 21, 21, 
	21, 21, 21, 21, 21, 21, 21, 21, 
	21, 21, 21, 21, 21, 22, 22, 22, 
	22, 21, 22, 21, 21, 21, 21, 21, 
	21, 21, 21, 21, 21, 21, 21, 21, 
	21, 21, 21, 21, 23, 21, 21, 21, 
	21, 21, 21, 21, 21, 22, 22, 22, 
	22, 22, 21, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 24, 24, 24, 24, 
	24, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 24, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	21, 21, 22, 21, 21, 21, 21, 21, 
	21, 21, 21, 21, 21, 21, 22, 22, 
	22, 22, 22, 22, 21, 21, 21, 21, 
	21, 21, 21, 21, 21, 21, 21, 21, 
	21, 21, 21, 21, 21, 21, 21, 21, 
	21, 21, 21, 21, 21, 21, 22, 22, 
	22, 22, 21, 22, 21, 21, 21, 21, 
	21, 21, 21, 21, 21, 21, 21, 21, 
	21, 21, 21, 21, 21, 21, 21, 21, 
	21, 21, 21, 21, 21, 21, 22, 22, 
	22, 22, 22, 21, 25, 24, 26, 24, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	22, 27, 27, 27, 27, 27, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	27, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 21, 21, 22, 
	21, 21, 21, 21, 21, 21, 21, 21, 
	21, 21, 21, 22, 22, 22, 22, 22, 
	22, 21, 21, 21, 21, 21, 21, 21, 
	21, 21, 21, 21, 21, 21, 21, 21, 
	21, 21, 21, 21, 21, 21, 21, 21, 
	21, 21, 21, 22, 22, 22, 22, 21, 
	22, 21, 21, 21, 21, 21, 21, 21, 
	21, 21, 21, 21, 21, 21, 21, 21, 
	21, 21, 21, 21, 21, 21, 21, 21, 
	21, 21, 21, 22, 22, 22, 22, 22, 
	21, 29, 29, 29, 29, 29, 28, 28, 
	28, 28, 28, 28, 28, 28, 28, 28, 
	28, 28, 28, 28, 28, 28, 28, 28, 
	29, 28, 28, 28, 28, 28, 28, 28, 
	28, 28, 28, 28, 28, 28, 28, 28, 
	28, 28, 28, 28, 28, 28, 28, 28, 
	28, 28, 28, 28, 28, 28, 28, 30, 
	28, 32, 31, 33, 31, 35, 34, 34, 
	34, 34, 36, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 34, 34, 
	34, 34, 34, 34, 34, 34, 37, 34, 
	38, 34, 39, 40, 35, 41, 39, 39, 
	39, 42, 39, 39, 39, 39, 39, 39, 
	39, 39, 39, 39, 39, 39, 39, 39, 
	39, 39, 39, 39, 39, 39, 39, 39, 
	39, 39, 39, 39, 39, 39, 39, 39, 
	39, 39, 39, 39, 39, 39, 39, 39, 
	39, 39, 39, 39, 39, 39, 39, 39, 
	39, 39, 39, 39, 39, 39, 39, 39, 
	39, 39, 39, 39, 39, 39, 39, 39, 
	39, 39, 39, 39, 39, 39, 39, 39, 
	39, 39, 39, 39, 39, 39, 39, 39, 
	39, 39, 39, 39, 39, 43, 39, 44, 
	39, 41, 39, 39, 39, 42, 39, 39, 
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
	39, 45, 39, 44, 39, 46, 47, 42, 
	42, 42, 46, 42, 48, 46, 46, 46, 
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
	46, 46, 46, 46, 49, 46, 50, 46, 
	48, 46, 46, 46, 46, 46, 46, 46, 
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
	51, 46, 50, 46, 46, 47, 42, 42, 
	42, 46, 42, 42, 42, 42, 42, 42, 
	42, 42, 42, 42, 42, 42, 42, 42, 
	42, 42, 42, 42, 42, 42, 42, 42, 
	42, 42, 42, 42, 42, 42, 42, 42, 
	42, 42, 42, 42, 42, 42, 42, 42, 
	42, 42, 42, 42, 42, 42, 42, 42, 
	42, 42, 42, 42, 42, 42, 42, 42, 
	42, 42, 42, 42, 42, 42, 42, 42, 
	42, 42, 42, 42, 42, 42, 42, 42, 
	42, 42, 42, 42, 42, 42, 42, 42, 
	42, 42, 42, 42, 42, 52, 42, 39, 
	40, 35, 35, 35, 35, 35, 35, 35, 
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
	53, 35, 54, 36, 42, 54, 54, 54, 
	54, 54, 54, 54, 54, 54, 54, 54, 
	54, 54, 54, 54, 54, 54, 54, 54, 
	54, 54, 54, 54, 54, 54, 54, 54, 
	54, 54, 54, 54, 54, 54, 54, 54, 
	54, 54, 54, 54, 54, 54, 54, 54, 
	54, 54, 54, 54, 54, 54, 54, 54, 
	54, 54, 54, 54, 54, 54, 54, 54, 
	54, 54, 54, 54, 54, 54, 54, 54, 
	54, 54, 54, 54, 54, 54, 54, 54, 
	54, 54, 54, 54, 54, 54, 54, 54, 
	54, 54, 54, 54, 54, 55, 54, 56, 
	54, 58, 57, 57, 57, 57, 59, 57, 
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
	57, 57, 60, 57, 61, 57, 62, 63, 
	58, 64, 62, 62, 62, 65, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 66, 62, 67, 62, 64, 62, 62, 
	62, 65, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 62, 62, 62, 
	62, 62, 62, 62, 62, 68, 62, 67, 
	62, 69, 70, 65, 65, 65, 69, 65, 
	71, 69, 69, 69, 69, 69, 69, 69, 
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
	72, 69, 73, 69, 71, 69, 69, 69, 
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
	69, 69, 69, 69, 74, 69, 73, 69, 
	69, 70, 65, 65, 65, 69, 65, 65, 
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
	65, 75, 65, 62, 63, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 76, 58, 77, 59, 
	65, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 78, 77, 79, 77, 80, 2, 80, 
	80, 80, 6, 6, 6, 6, 6, 6, 
	6, 6, 6, 6, 6, 6, 6, 6, 
	6, 6, 6, 6, 80, 6, 6, 81, 
	6, 6, 6, 6, 6, 6, 6, 6, 
	6, 6, 6, 6, 6, 6, 6, 6, 
	6, 6, 6, 6, 6, 6, 6, 6, 
	82, 6, 2, 6, 6, 6, 6, 6, 
	6, 6, 6, 6, 6, 6, 6, 6, 
	6, 6, 6, 6, 6, 6, 6, 6, 
	6, 6, 6, 84, 6, 6, 6, 6, 
	6, 6, 6, 6, 6, 6, 6, 6, 
	6, 6, 6, 6, 6, 6, 6, 6, 
	6, 6, 6, 6, 85, 6, 2, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 3, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	4, 1, 80, 2, 80, 80, 80, 6, 
	6, 6, 6, 6, 6, 6, 6, 6, 
	6, 6, 6, 6, 6, 6, 6, 6, 
	6, 80, 6, 6, 84, 6, 6, 6, 
	6, 6, 6, 6, 6, 6, 6, 6, 
	6, 6, 6, 6, 6, 6, 6, 6, 
	6, 6, 6, 6, 6, 87, 6, 16, 
	18, 16, 16, 16, 17, 17, 17, 17, 
	17, 17, 17, 17, 17, 17, 17, 17, 
	17, 17, 17, 17, 17, 17, 16, 17, 
	88, 46, 47, 42, 42, 42, 46, 42, 
	39, 40, 35, 54, 36, 89, 69, 70, 
	65, 65, 65, 69, 65, 62, 63, 58, 
	77, 59, 89, 0
]

class << self
	attr_accessor :_template_trans_targs
	private :_template_trans_targs, :_template_trans_targs=
end
self._template_trans_targs = [
	45, 1, 47, 2, 3, 45, 46, 7, 
	8, 45, 9, 10, 9, 11, 10, 11, 
	12, 45, 49, 50, 15, 16, 0, 19, 
	17, 18, 45, 20, 21, 20, 22, 21, 
	22, 49, 23, 24, 32, 23, 54, 25, 
	31, 26, 27, 25, 52, 25, 28, 30, 
	29, 28, 51, 28, 27, 24, 33, 33, 
	53, 34, 35, 43, 34, 58, 36, 42, 
	37, 38, 36, 56, 36, 39, 41, 40, 
	39, 55, 39, 38, 35, 44, 44, 57, 
	48, 13, 14, 45, 4, 5, 45, 6, 
	45, 0
]

class << self
	attr_accessor :_template_trans_actions
	private :_template_trans_actions, :_template_trans_actions=
end
self._template_trans_actions = [
	1, 0, 2, 0, 0, 3, 2, 0, 
	0, 4, 0, 5, 5, 6, 0, 7, 
	0, 8, 9, 0, 0, 0, 10, 0, 
	0, 0, 11, 0, 5, 5, 6, 0, 
	7, 12, 0, 0, 0, 14, 15, 0, 
	0, 0, 0, 14, 15, 16, 0, 0, 
	0, 14, 15, 16, 17, 17, 0, 14, 
	15, 0, 0, 0, 14, 19, 0, 0, 
	0, 0, 14, 19, 16, 0, 0, 0, 
	14, 19, 16, 17, 17, 0, 14, 19, 
	21, 0, 0, 22, 0, 0, 23, 0, 
	24, 0
]

class << self
	attr_accessor :_template_to_state_actions
	private :_template_to_state_actions, :_template_to_state_actions=
end
self._template_to_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 13, 
	13, 13, 0, 13, 13, 0, 0, 0, 
	0, 13, 13, 13, 13, 0, 13, 13, 
	0, 0, 0, 0, 13, 13, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0
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
	0, 0, 0, 0, 0, 20, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0
]

class << self
	attr_accessor :_template_eof_actions
	private :_template_eof_actions, :_template_eof_actions=
end
self._template_eof_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 10, 
	10, 10, 10, 10, 10, 10, 10, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 18, 18, 18, 18, 18, 18, 
	18, 18, 18, 18, 18, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0
]

class << self
	attr_accessor :_template_eof_trans
	private :_template_eof_trans, :_template_eof_trans=
end
self._template_eof_trans = [
	0, 1, 1, 1, 6, 6, 6, 6, 
	10, 10, 10, 10, 18, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 84, 87, 
	84, 18, 89, 0, 0, 0, 0, 0, 
	0, 0, 0
]

class << self
	attr_accessor :template_start
end
self.template_start = 45;
class << self
	attr_accessor :template_first_final
end
self.template_first_final = 45;
class << self
	attr_accessor :template_error
end
self.template_error = 0;

class << self
	attr_accessor :template_en_parse_nested_expression
end
self.template_en_parse_nested_expression = 23;
class << self
	attr_accessor :template_en_parse_expression
end
self.template_en_parse_expression = 34;
class << self
	attr_accessor :template_en_main
end
self.template_en_main = 45;


# line 75 "template.rl"
		
		def self.parse_template(buffer, delegate)
			data = buffer.read
			bytes = data.bytes
			
			p = 0
			pe = eof = data.bytesize
			stack = []
			
			expression_begin = expression_end = nil
			instruction_begin = instruction_end = nil
			
			
# line 539 "template.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = template_start
	top = 0
	ts = nil
	te = nil
	act = 0
end

# line 88 "template.rl"
			
# line 552 "template.rb"
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
# line 580 "template.rb"
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
	when 5 then
# line 24 "template.rl"
		begin

		instruction_begin = p
			end
	when 7 then
# line 28 "template.rl"
		begin

		instruction_end = p
			end
	when 10 then
# line 40 "template.rl"
		begin

		raise ParseError.new("failed to parse instruction", buffer, p)
			end
	when 17 then
# line 13 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 23
		_goto_level = _again
		next
	end
		end
	when 14 then
# line 17 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 23
		_goto_level = _again
		next
	end
		end
	when 15 then
# line 20 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
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
	when 11 then
# line 60 "template.rl"
		begin
te = p+1
 begin 
		delegate.text(data.byteslice(ts...te))
	 end
		end
	when 23 then
# line 60 "template.rl"
		begin
te = p
p = p - 1; begin 
		delegate.text(data.byteslice(ts...te))
	 end
		end
	when 22 then
# line 60 "template.rl"
		begin
te = p
p = p - 1; begin 
		delegate.text(data.byteslice(ts...te))
	 end
		end
	when 1 then
# line 60 "template.rl"
		begin
 begin p = ((te))-1; end
 begin 
		delegate.text(data.byteslice(ts...te))
	 end
		end
	when 3 then
# line 60 "template.rl"
		begin
 begin p = ((te))-1; end
 begin 
		delegate.text(data.byteslice(ts...te))
	 end
		end
	when 8 then
# line 1 "NONE"
		begin
	case act
	when 1 then
	begin begin p = ((te))-1; end

		delegate.instruction(data.byteslice(instruction_begin...instruction_end), "\n")
	end
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
# line 24 "template.rl"
		begin

		instruction_begin = p
			end
# line 28 "template.rl"
		begin

		instruction_end = p
			end
	when 4 then
# line 40 "template.rl"
		begin

		raise ParseError.new("failed to parse instruction", buffer, p)
			end
# line 60 "template.rl"
		begin
 begin p = ((te))-1; end
 begin 
		delegate.text(data.byteslice(ts...te))
	 end
		end
	when 24 then
# line 44 "template.rl"
		begin

		expression_begin = p
			end
# line 53 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
		begin
te = p
p = p - 1; begin cs = 34; end
		end
	when 16 then
# line 13 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 23
		_goto_level = _again
		next
	end
		end
# line 17 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
		begin
	begin
		stack[top] = cs
		top+= 1
		cs = 23
		_goto_level = _again
		next
	end
		end
	when 9 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 36 "template.rl"
		begin
act = 1;		end
	when 12 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 32 "template.rl"
		begin
act = 3;		end
	when 21 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 60 "template.rl"
		begin
act = 6;		end
	when 19 then
# line 48 "template.rl"
		begin

		expression_end = p
			end
# line 52 "template.rl"
		begin

		delegate.expression(data.byteslice(expression_begin...expression_end))
			end
# line 21 "/Users/samuel/Documents/Programming/ioquatix/trenni/parsers/trenni/template.rl"
		begin
cs = 45;		end
# line 809 "template.rb"
	end
	end
	end
	if _goto_level <= _again
	case _template_to_state_actions[cs] 
	when 13 then
# line 1 "NONE"
		begin
ts = nil;		end
# line 819 "template.rb"
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
	when 10 then
# line 40 "template.rl"
		begin

		raise ParseError.new("failed to parse instruction", buffer, p)
			end
	when 18 then
# line 56 "template.rl"
		begin

		raise ParseError.new("failed to parse expression", buffer, p)
			end
# line 852 "template.rb"
	  end
	end

	end
	if _goto_level <= _out
		break
	end
end
	end

# line 89 "template.rl"
			
			if p != eof
				raise ParseError.new("could not consume all input", buffer, p)
			end
			
			return nil
		end
	end
end
