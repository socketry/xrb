#!/usr/bin/env ruby

# Copyright (c) 2007, 2012 Samuel G. D. Williams. <http://www.oriontransfer.co.nz>
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

require 'pathname'
require 'test/unit'
require 'stringio'

require 'trenni/strings'

class TestStrings < Test::Unit::TestCase
	def test_to_html
		text = Trenni::Strings.to_html("<foobar>")
		assert_equal "&lt;foobar&gt;", text
		
		text = Trenni::Strings.to_html(%q{"I'd like to do this & that :p", she said.})
		assert_equal %q{&quot;I'd like to do this &amp; that :p&quot;, she said.}, text
	end

	def test_to_quoted_string
		text = Trenni::Strings.to_quoted_string(%Q{"Hello World"})
		assert_equal %q{"\"Hello World\""}, text
		
		text = Trenni::Strings.to_quoted_string(%Q{"Hello\r\nWorld"})
		assert_equal %q{"\"Hello\r\nWorld\""}, text
	end
		
	def test_to_attribute
		text = Trenni::Strings.to_attribute(:foo, 'bar')
		assert_equal %Q{foo="bar"}, text
		
		text = Trenni::Strings.to_simple_attribute(:foo, false)
		assert_equal %Q{foo}, text
		
		text = Trenni::Strings.to_simple_attribute(:foo, true)
		assert_equal %Q{foo="foo"}, text
	end
		
	def self.to_simple_attribute
		strict ? %Q{#{key}="#{key}"} : key.to_s
	end
		
	def test_to_title
		text = Trenni::Strings.to_title("foo bar")
		assert_equal "Foo Bar", text
	end

	def test_to_snake
		text = Trenni::Strings.to_snake("Happy::Go::Lucky")
		assert_equal "happy_go_lucky", text
	end
end
