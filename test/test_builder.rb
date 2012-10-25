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
		builder = Trenni::Builder.new(:indent => false)

		builder.instruct
		builder.tag('foo', 'bar' => 'baz') do
			builder.text("apples and oranges")
		end
		
		assert_equal "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<foo bar=\"baz\">apples and oranges</foo>", builder.output.string
	end
	
	def test_full_html
		builder = Trenni::Builder.new(:indent => true)
		
		builder.doctype
		builder.tag('html') do
			builder.tag('head') do
				builder.inline('title') do
					builder.text('Hello World')
				end
			end
			builder.tag('body') do
			end
		end
		
		assert_equal "<!DOCTYPE html>\n<html>\n\t<head>\n\t\t<title>Hello World</title>\n\t</head>\n\t<body>\n\t</body>\n</html>", builder.output.string
	end
	
	def test_inline_html
		builder = Trenni::Builder.new(:indent => true)
		
		builder.inline("div") do
			builder.tag("strong") do
				builder.text("Hello")
			end
			
			builder.text "World!"
		end
		
		assert_equal "<div><strong>Hello</strong>World!</div>", builder.output.string
	end
	
	def test_indentation
		builder = Trenni::Builder.new(:indent => "\t")
		
		puts builder.output.string
	end
	
	def test_escaping
		builder = Trenni::Builder.new(:escape => true)
		builder.inline :foo, :bar => %Q{"Hello World"} do
			builder.text %Q{if x < 10}
		end
		
		assert_equal %Q{<foo bar="&quot;Hello World&quot;">if x &lt; 10</foo>}, builder.output.string
	end
	
	def test_attributes_strict
		builder = Trenni::Builder.new(:strict => true)
		builder.tag :option, :required => true
		assert_equal %Q{<option required="required"/>}, builder.output.string
	end
	
	def test_attributes_compact
		builder = Trenni::Builder.new(:strict => false)
		builder.tag :option, :required => true
		assert_equal %Q{<option required/>}, builder.output.string
	end
	
	def test_attributes_order
		builder = Trenni::Builder.new(:strict => true)
		builder.tag :t, [[:a, 10], [:b, 20]]
		assert_equal %Q{<t a="10" b="20"/>}, builder.output.string
	end
end
