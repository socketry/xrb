#!/usr/bin/env ruby

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

require 'trenni/strings'

module Trenni::StringsSpec
	describe Trenni::Strings do
		it "should escape html sensitive characters" do
			text = Trenni::Strings.to_html("<foobar>")
			expect(text).to be == "&lt;foobar&gt;"
			
			text = Trenni::Strings.to_html(%q{"I'd like to do this & that :p", she said.})
			expect(text).to be == %q{&quot;I'd like to do this &amp; that :p&quot;, she said.}
		end
		
		it "should generate quoted strings" do
			text = Trenni::Strings.to_quoted_string(%Q{"Hello World"})
			expect(text).to be == %q{"\"Hello World\""}
		
			text = Trenni::Strings.to_quoted_string(%Q{"Hello\r\nWorld"})
			expect(text).to be == %q{"\"Hello\r\nWorld\""}
		end
		
		it "should generate quoted attributes" do
			text = Trenni::Strings.to_attribute(:foo, 'bar')
			expect(text).to be == %Q{foo="bar"}
		
			text = Trenni::Strings.to_simple_attribute(:foo, false)
			expect(text).to be == %Q{foo}
		
			text = Trenni::Strings.to_simple_attribute(:foo, true)
			expect(text).to be == %Q{foo="foo"}
		end
		
		it "should generate nice titles" do
			text = Trenni::Strings.to_title("foo bar")
			expect(text).to be == "Foo Bar"
		end
		
		it "should generate nice identifiers" do
			text = Trenni::Strings.to_snake("Happy::Go::Lucky")
			expect(text).to be == "happy_go_lucky"
		end
	end
end
