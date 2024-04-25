#!/usr/bin/env rspec
# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

require 'xrb'
require 'xrb/markup'

Model = Struct.new(:text)

describe XRB::MarkupString do
	with 'basic template' do
		let(:template) {XRB::MarkupTemplate.load_file File.expand_path('.corpus/basic.xrb', __dir__)}
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
		
		XRB::Markup.append(markup_string, nil)
		
		expect(markup_string).to be(:empty?)
	end
end
