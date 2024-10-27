#!/usr/bin/env rspec
# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

require 'xrb'
require 'xrb/markup'

Model = Struct.new(:text)

describe XRB::MarkupString do
	with 'basic template' do
		let(:template) {XRB::Template.load('#{text}')}
		let(:html_text) {"<h1>Hello World</h1>"}
		
		it "should escape unsafe text" do
			model = Model.new(html_text)
			
			expect(template.to_string(model)).to be == "&lt;h1&gt;Hello World&lt;/h1&gt;"
		end
		
		let(:safe_html_text) {XRB::Builder.tag('h1', 'Hello World')}
		
		it "should not escape safe text" do
			model = Model.new(safe_html_text)
			
			expect(template.to_string(model)).to be == html_text
		end
	end
	
	it "should convert nil to empty string" do
		markup_string = XRB::MarkupString.new
		
		nil.append_markup(markup_string)
		
		expect(markup_string).to be(:empty?)
	end
	
	with '.raw' do
		it 'fails with a type error when given a non-string' do
			expect do
				XRB::MarkupString.raw(Object.new)
			end.to raise_exception(TypeError)
		end
		
		it 'can wrap a string' do
			string = XRB::MarkupString.raw("<h1>Hello World</h1>")
			
			expect(string).to be == "<h1>Hello World</h1>"
			expect(string).to be_a(XRB::Markup)
		end
	end
	
	with '.new' do
		it 'can escape a string' do
			expect(XRB::MarkupString.new("<h1>Hello World</h1>", true)).to be == "&lt;h1&gt;Hello World&lt;/h1&gt;"
		end
		
		it 'can wrap a string' do
			expect(XRB::MarkupString.new("<h1>Hello World</h1>", false)).to be == "<h1>Hello World</h1>"
		end
	end
	
	with '#html_safe?' do
		it 'can be used to safely append to an output buffer' do
			expect(XRB::MarkupString.new.html_safe?).to be_truthy
		end
	end
end
