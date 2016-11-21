# Copyright, 2012, by Samuel G. D. Williams. <http://www.codeotaku.com>
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
	# This is a sample delegate for capturing all events. It's only use is for testing.
	class ParserDelegate
		def initialize
			@events = []
		end
		
		attr :events
		
		def text(text)
			@events << [:text, text]
		end
		
		def cdata(data)
			@events << [:cdata, data]
		end
		
		def open_tag_begin(name)
			@events << [:open_tag_begin, name]
		end
		
		def attribute(name, value)
			@events << [:attribute, name, value]
		end
		
		def open_tag_end(self_closing)
			@events << [:open_tag_end, self_closing]
		end
		
		def close_tag(name)
			@events << [:close_tag, name]
		end
		
		def doctype(data)
			@events << [:doctype, data]
		end
		
		def comment(data)
			@events << [:comment, data]
		end
		
		def instruction(name, text)
			@events << [:instruction, name, text]
		end
	end
end
