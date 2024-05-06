#!/usr/bin/env rspec
# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2012-2024, by Samuel Williams.

require 'xrb/builder'

describe XRB::Builder do
	let(:builder) {subject.new}
	
	it "should produce valid html" do
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
		
		expect(builder.output).to be == <<~HTML.chomp
		<!doctype html>
		<html>
			<head>
				<title>Hello World</title>
			</head>
			<body>
			</body>
		</html>
		HTML
	end
	
	with '.fragment' do
		it "should use an existing builder" do
			result = XRB::Builder.fragment do |builder|
			end
			
			expect(result).not.to be_nil
		end
		
		it "should use an existing builder" do
			expect(XRB::Builder).to receive(:new)
			
			result = XRB::Builder.fragment(builder) do |builder|
			end
			
			expect(result).to be_nil
		end
	end
	
	with '#tag' do
		it "should format nested attributes" do
			builder.tag('div', data: {id: 10})
			
			expect(builder.output).to be == '<div data-id="10"/>'
		end
		
		it "should indent self-closing tag correctly" do
			builder = XRB::Builder.new
			
			builder.tag('foo') {builder.tag('bar')}
			
			expect(builder.output).to be == <<~XML.chomp
			<foo>
				<bar/>
			</foo>
			XML
		end
		
		it "should support compact attributes" do
			builder.tag :option, :required => true
			expect(builder.output).to be == %Q{<option required/>}
		end
		
		it "should output without changing escaped characters" do
			builder.tag "section", :'data-text' => 'foo\nbar'
			expect(builder.output).to be == '<section data-text="foo\nbar"/>'
		end
		
		it "should order array attributes as specified" do
			builder.tag :t, [[:a, 10], [:b, 20]]
			expect(builder.output).to be == %Q{<t a="10" b="20"/>}
		end
		
		it "should order hash attributes as specified" do
			builder.tag :t, :b => 20, :a => 10
			expect(builder.output).to be == %Q{<t b="20" a="10"/>}
		end
		
		it "shouldn't output attributes with nil value" do
			builder.tag :t, [[:a, 10], [:b, nil]]
			expect(builder.output).to be == %Q{<t a="10"/>}
		end
		
		it "should raise type error for invalid attributes" do
			expect do
				builder.tag :t, {a: [1, 2, 3, 4, 5]}
			end.to raise_exception(TypeError)
		end
	end
	
	with '#inline' do
		it "should produce inline html" do
			builder.inline("div") do
				builder.tag("strong") do
					builder.text("Hello")
				end
				
				builder.text "World!"
			end
			
			expect(builder.output).to be == "<div><strong>Hello</strong>World!</div>"
		end
		
		it "can inline fragments" do
			builder.inline! do
				builder.inline('a') do
					builder << "Hello"
				end
				
				builder.inline('a') do
					builder << "World"
				end
			end
			
			expect(builder.output).to be == "<a>Hello</a><a>World</a>"
		end
		
		it "escapes attributes and text correctly" do
			builder.inline :foo, :bar => %Q{"Hello World"} do
				builder.text %Q{if x < 10}
			end
			
			expect(builder.output).to be == %Q{<foo bar="&quot;Hello World&quot;">if x &lt; 10</foo>}
		end
	end
	
	with '#<<' do
		it 'can append text' do
			builder << 'text'
			expect(builder.output).to be == "text"
		end
		
		it "doesn't append nil" do
			builder << nil
			expect(builder.output).to be == ""
		end
	end
	
	with '#append' do
		it 'should be able to append nil' do
			expect{builder.append(nil)}.not.to raise_exception
		end
		
		it 'should append existing markup' do
			builder.tag("outer") do
				builder.append("<inner>\n\t<nested/>\n</inner>")
			end
			
			expect(builder.output).to be == <<~XML.chomp
			<outer>
				<inner>
					<nested/>
				</inner>
			</outer>
			XML
		end
	end
	
	with '#to_s' do
		it "generates html safe string" do
			# This test is specifically for Rails compatibility.
			fragment = XRB::Builder.fragment do |builder|
				builder.tag('div') do
					builder.text('Hello World')
				end
			end
			
			expect(fragment.to_s).to be(:html_safe?)
		end
	end
end
