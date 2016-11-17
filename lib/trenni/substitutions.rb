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

module Trenni
	class Substitutions
		def initialize(substitutions)
			@substitutions = substitutions
			@pattern = Regexp.union(patterns)
		end
		
		def patterns
			@substitutions.keys
		end
		
		attr :substitutions
		
		def gsub(string)
			string.gsub(@pattern){|match| @substitutions[match]}
		end
		
		def gsub!(string)
			string.gsub!(@pattern){|match| @substitutions[match]}
		end
	end
	
	class UnicodeEntities < Substitutions
		def initialize(substitutions)
		end
		
		def patterns
			super + [/&\#\d+;/, /&x[0-9a-fA-F]+;/]
		end
		
		def gsub(string)
			string.gsub(@pattern){|match| @substitutions[match]}
		end
		
		def gsub!(string)
			string.gsub!(@pattern){|match| @substitutions[match]}
		end
	end
end
