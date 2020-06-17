#!/usr/bin/env rspec
# frozen_string_literal: true

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

require 'trenni/builder'

RSpec.describe Trenni::Builder do
	it "should produce valid html" do
		subject.doctype
		subject.tag('html') do
			subject.tag('head') do
				subject.inline('title') do
					subject.text('Hello World')
				end
			end
			subject.tag('body') do
			end
		end
		
		expect(subject.output).to be == <<~HTML.chomp
		<!DOCTYPE html>
		<html>
			<head>
				<title>Hello World</title>
			</head>
			<body>
			</body>
		</html>
		HTML
	end
	
	describe '.fragment' do
		it "should use an existing builder" do
			result = Trenni::Builder.fragment do |builder|
			end
			
			expect(result).to_not be_nil
		end
		
		it "should use an existing builder" do
			expect(Trenni::Builder).to receive(:new).and_call_original
			
			result = Trenni::Builder.fragment(subject) do |builder|
			end
			
			expect(result).to be_nil
		end
	end
	
	describe '#tag' do
		it "should format nested attributes" do
			subject.tag('div', data: {id: 10})
			
			expect(subject.output).to be == '<div data-id="10"/>'
		end
		
		it "should indent self-closing tag correctly" do
			builder = Trenni::Builder.new
			
			builder.tag('foo') {builder.tag('bar')}
			
			expect(builder.output).to be == <<~HTML.chomp
			<foo>
				<bar/>
			</foo>
			HTML
		end
		
		it "should support compact attributes" do
			subject.tag :option, :required => true
			expect(subject.output).to be == %Q{<option required/>}
		end
		
		it "should output without changing escaped characters" do
			subject.tag "section", :'data-text' => 'foo\nbar'
			expect(subject.output).to be == '<section data-text="foo\nbar"/>'
		end
		
		it "should order array attributes as specified" do
			subject.tag :t, [[:a, 10], [:b, 20]]
			expect(subject.output).to be == %Q{<t a="10" b="20"/>}
		end
		
		it "should order hash attributes as specified" do
			subject.tag :t, :b => 20, :a => 10
			expect(subject.output).to be == %Q{<t b="20" a="10"/>}
		end
		
		it "shouldn't output attributes with nil value" do
			subject.tag :t, [[:a, 10], [:b, nil]]
			expect(subject.output).to be == %Q{<t a="10"/>}
		end
	end
	
	describe '#inline' do
		it "should produce inline html" do
			subject.inline("div") do
				subject.tag("strong") do
					subject.text("Hello")
				end
				
				subject.text "World!"
			end
			
			expect(subject.output).to be == "<div><strong>Hello</strong>World!</div>"
		end
		
		it "can inline fragments" do
			subject.inline! do
				subject.inline('a') do
					subject << "Hello"
				end
				
				subject.inline('a') do
					subject << "World"
				end
			end
			
			expect(subject.output).to be == "<a>Hello</a><a>World</a>"
		end
		
		it "escapes attributes and text correctly" do
			subject.inline :foo, :bar => %Q{"Hello World"} do
				subject.text %Q{if x < 10}
			end
			
			expect(subject.output).to be == %Q{<foo bar="&quot;Hello World&quot;">if x &lt; 10</foo>}
		end
	end
	
	describe '#<<' do
		it 'can append text' do
			subject << 'text'
			expect(subject.output).to be == "text"
		end
		
		it "doesn't append nil" do
			subject << nil
			expect(subject.output).to be == ""
		end
	end
	
	describe '#append' do
		it 'should be able to append nil' do
			expect{subject.append(nil)}.to_not raise_error
		end
		
		it 'should append existing markup' do
			subject.tag("outer") do
				subject.append("<inner>\n\t<nested/>\n</inner>")
			end
			
			expect(subject.output).to be == <<~HTML.chomp
			<outer>
				<inner>
					<nested/>
				</inner>
			</outer>
			HTML
		end
	end
end
