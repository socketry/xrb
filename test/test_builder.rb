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
require 'digest/md5'

require 'trenni'

class TestBuilder < Test::Unit::TestCase
	def test_tags
		output = StringIO.new
		
		builder = Trenni::Builder.new(:output => output)

		builder.instruct
		builder.tag('foo', 'bar' => 'baz') do
			builder.text("apples and oranges")
		end
		
		assert_equal "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<foo bar=\"baz\">apples and oranges</foo>", output.string
	end
	
	def test_html
		output = StringIO.new
		
		builder = Trenni::Builder.new(:output => output, :indent => "\t")
		builder.options(:indent => "\t") do
			builder.doctype
			builder.tag('html') do
				builder.tag('head') do
					builder.tag('title') do
						builder.text('Hello World')
					end
				end
				builder.tag('body') do
				end
			end
		end
		
		assert_equal "<!DOCTYPE html>\n<html>\n\t<head>\n\t\t<title>\n\t\t\tHello World\n\t\t</title>\n\t</head>\n\t<body>\n\n\t</body>\n</html>", output.string
	end
	
	def test_attributes
		# Non-strict output (e.g. HTML)
		text = Trenni::Builder.tag_attributes({:required => true})
		assert_equal " required", text
		
		# Strict output (e.g. XML)
		text = Trenni::Builder.tag_attributes({:required => true}, true)
		assert_equal " required=\"required\"", text
		
		text = Trenni::Builder.tag_attributes({:required => false})
		assert_equal "", text
		
		# Check the order is correct
		text = Trenni::Builder.tag_attributes([[:a, 10], [:b, 20]])
		assert_equal " a=\"10\" b=\"20\"", text
	end
end
