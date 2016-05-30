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
	describe 'Trenni::Builder#tag_attributes' do
		subject {Trenni::Builder.new}
		
		it "should format nested attributes" do
			expect(subject.tag_attributes(data: {id: 10})).to be == ' data-id="10"'
		end
	end
	
	describe 'Trenni::Builder#fragment' do
		let(:builder) {Trenni::Builder.new}
		
		it "should use an existing builder" do
			result = Trenni::Builder.fragment do |builder|
			end
			
			expect(result).to_not be == nil
		end
		
		it "should use an existing builder" do
			expect(Trenni::Builder).to receive(:new).and_call_original
			
			result = Trenni::Builder.fragment(builder) do |builder|
			end
			
			expect(result).to be == nil
		end
	end
	
	describe Trenni::Builder do
		it 'should be able to append nil' do
			expect{subject.append(nil)}.to_not raise_error
		end
		
		it 'should append existing markup' do
			subject.tag("outer") do
				subject.append("<inner>\n\t<nested/>\n</inner>")
			end
			
			expect(subject.output).to be == "<outer>\n\t<inner>\n\t\t<nested/>\n\t</inner>\n</outer>"
		end
		
		it "should produce valid xml output" do
			builder = Trenni::Builder.new(indent: false)
			
			builder.instruct
			builder.tag('foo', 'bar' => 'baz') do
				builder.text('apples and oranges')
				builder.tag('baz')
			end
			
			expect(builder.output).to be == "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<foo bar=\"baz\">apples and oranges<baz/></foo>"
		end
		
		it "should produce valid html" do
			builder = Trenni::Builder.new(indent: true)
			
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
			
			expect(builder.output).to be == "<!DOCTYPE html>\n<html>\n\t<head>\n\t\t<title>Hello World</title>\n\t</head>\n\t<body>\n\t</body>\n</html>"
		end
		
		it "should indent self-closing tag correctly" do
			builder = Trenni::Builder.new
			
			builder.tag('foo') { builder.tag('bar') }
			
			expect(builder.output).to be == "<foo>\n\t<bar/>\n</foo>"
		end
		
		it "should produce inline html" do
			builder = Trenni::Builder.new(:indent => true)
			
			builder.inline("div") do
				builder.tag("strong") do
					builder.text("Hello")
				end
				
				builder.text "World!"
			end
			
			expect(builder.output).to be == "<div><strong>Hello</strong>World!</div>"
		end
		
		it "escapes attributes and text correctly" do
			builder = Trenni::Builder.new(:escape => true)
			
			builder.inline :foo, :bar => %Q{"Hello World"} do
				builder.text %Q{if x < 10}
			end
			
			expect(builder.output).to be == %Q{<foo bar="&quot;Hello World&quot;">if x &lt; 10</foo>}
		end
		
		it "should support strict attributes" do
			builder = Trenni::Builder.new(:strict => true)
			
			builder.tag :option, :required => true
			
			expect(builder.output).to be == %Q{<option required="required"/>}
		end
		
		it "should support compact attributes" do
			builder = Trenni::Builder.new(:strict => false)
			
			builder.tag :option, :required => true
			
			expect(builder.output).to be == %Q{<option required/>}
		end
		
		it "should output without changing escaped characters" do
			builder = Trenni::Builder.new(:strict => false)
			
			builder.tag "section", :'data-text' => 'foo\nbar'
			
			expect(builder.output).to be == '<section data-text="foo\nbar"/>'
		end
		
		it "should order attributes as specified" do
			builder = Trenni::Builder.new(:strict => true)
			builder.tag :t, [[:a, 10], [:b, 20]]
			expect(builder.output).to be == %Q{<t a="10" b="20"/>}
			
			builder = Trenni::Builder.new(:strict => true)
			builder.tag :t, :b => 20, :a => 10
			expect(builder.output).to be == %Q{<t b="20" a="10"/>}
		end
	end
end
