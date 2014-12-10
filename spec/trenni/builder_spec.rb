#!/usr/bin/env rspec

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

require 'trenni'

module Trenni::BuilderSpec
	describe Trenni::Builder do
		it "should produce valid xml output" do
			builder = Trenni::Builder.new(:indent => false)
			
			builder.instruct
			builder.tag('foo', 'bar' => 'baz') do
				builder.text("apples and oranges")
			end
			
			expect(builder.output.string).to be == "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<foo bar=\"baz\">apples and oranges</foo>"
		end
		
		it "should produce valid html" do
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
			
			expect(builder.output.string).to be == "<!DOCTYPE html>\n<html>\n\t<head>\n\t\t<title>Hello World</title>\n\t</head>\n\t<body>\n\t</body>\n</html>"
		end
		
		it "should produce inline html" do
			builder = Trenni::Builder.new(:indent => true)
			
			builder.inline("div") do
				builder.tag("strong") do
					builder.text("Hello")
				end
				
				builder.text "World!"
			end
			
			expect(builder.output.string).to be == "<div><strong>Hello</strong>World!</div>"
		end
		
		it "escapes attributes and text correctly" do
			builder = Trenni::Builder.new(:escape => true)
			
			builder.inline :foo, :bar => %Q{"Hello World"} do
				builder.text %Q{if x < 10}
			end
			
			expect(builder.output.string).to be == %Q{<foo bar="&quot;Hello World&quot;">if x &lt; 10</foo>}
		end
		
		it "should support strict attributes" do
			builder = Trenni::Builder.new(:strict => true)
			
			builder.tag :option, :required => true
			
			expect(builder.output.string).to be == %Q{<option required="required"/>}
		end
		
		it "should support compact attributes" do
			builder = Trenni::Builder.new(:strict => false)
			
			builder.tag :option, :required => true
			
			expect(builder.output.string).to be == %Q{<option required/>}
		end
		
		it "should output without changing escaped characters" do
			builder = Trenni::Builder.new(:strict => false)
			
			builder.tag "section", :'data-text' => 'foo\nbar'
			
			expect(builder.output.string).to be == '<section data-text="foo\nbar"/>'
		end
		
		it "should order attributes as specified" do
			builder = Trenni::Builder.new(:strict => true)
			builder.tag :t, [[:a, 10], [:b, 20]]
			expect(builder.output.string).to be == %Q{<t a="10" b="20"/>}
			
			builder = Trenni::Builder.new(:strict => true)
			builder.tag :t, :b => 20, :a => 10
			expect(builder.output.string).to be == %Q{<t b="20" a="10"/>}
		end
	end
end
