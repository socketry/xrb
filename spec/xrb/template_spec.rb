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

require 'xrb/template'
require 'xrb/parsers'
require 'benchmark'

RSpec.describe XRB::Template do
	context 'large.xhtml' do
		let(:template_path) {File.expand_path('corpus/large.xhtml', __dir__)}
		let(:template) {XRB::Template.load_file template_path}
		let(:output) {template.to_string}
		
		it "should parse xhtml template and produce identical output" do
			expect{output}.to_not raise_error
			expect(output).to be == File.read(template_path)
		end
	end
	
	context 'lines.xrb' do
		let(:template_path) {File.expand_path('template_spec/lines.xrb', __dir__)}
		let(:template) {XRB::Template.load_file template_path}
		let(:code) {template.send(:code)}
		
		it "should parse xhtml template and produce identical output" do
			expect(code.lines[0]).to match(/apple/)
			expect(code.lines[5]).to match(/banana/)
		end
	end
	
	context 'builder.xrb' do
		let(:template_path) {File.expand_path('template_spec/builder.xrb', __dir__)}
		let(:template) {XRB::Template.load_file template_path}
		let(:code) {template.send(:code)}
		
		it "should capture and output the contents of the block" do
			expect(template.to_string).to be == 'Hello World!'
		end
	end
	
	context 'capture.xrb' do
		let(:capture_template) {XRB::Template.load_file File.expand_path('template_spec/capture.xrb', __dir__)}
		
		it "should be able to capture output" do
			expect(capture_template.to_string).to be == '"TEST TEST TEST\n"'
		end
		
		it "compiled template should match line numbers" do
			code_lines = capture_template.send(:code).lines
			
			expect(code_lines.count).to be == 4
			expect(code_lines[3]).to include("inspect")
		end
	end
	
	context 'buffer.xrb' do
		let(:buffer_template) {XRB::Template.load_file File.expand_path('template_spec/buffer.xrb', __dir__)}
		
		it "should be able to fetch output buffer" do
			expect(buffer_template.to_string).to be == 'test'
		end
	end
	
	context 'nested.xrb' do
		let(:nested_template) {XRB::Template.load_file File.expand_path('template_spec/nested.xrb', __dir__)}
		
		it "should be able to handle nested interpolations" do
			expect(nested_template.to_string).to be == "Hello world!"
		end
	end
	
	context 'items' do
		let(:items) {1..4}
		
		it "should process list of items" do
			buffer = XRB::Buffer.new('<?r items.each do |item| ?>#{item}<?r end ?>')
			template = XRB::Template.new(buffer)
			
			expect(template.to_string(self)).to be == "1234"
		end
		
		it "should have correct indentation" do
			buffer = XRB::Buffer.new("\t<?r items.each do |item| ?>\n\t\#{item}\n\t<?r end ?>\n")
			template = XRB::Template.new(buffer)
			
			expect(template.to_string(self)).to be == "\t1\n\t2\n\t3\n\t4\n"
		end
	end
	
	context 'escaped.xrb' do
		let(:escaped_template) {XRB::Template.load_file File.expand_path('template_spec/escaped.xrb', __dir__)}
		
		it "should have the same number of lines as input" do
			expect(escaped_template.send(:code).lines.count).to be == 2
		end
		
		it "should process escaped characters" do
			expect(escaped_template.to_string).to be ==
				"This\\nisn't one line.\n" +
				"\\tIndentation is the best."
		end
	end
	
	context 'scope' do
		it "should use default top-level binding if none provided" do
			buffer = XRB::Buffer.new('#{Module.nesting.inspect}')
			template = XRB::Template.new(buffer)
			
			expect(template.to_string(self)).to be == "[XRB]"
		end
	end
end

RSpec.shared_examples "template parser" do
	let(:delegate) {XRB::ParseDelegate.new}
	
	it "should fail to parse incomplete expression" do
		buffer = XRB::Buffer.new('<img src="#{poi_product.photo.thumbnail_url" />')
		
		expect{
			subject.parse_template(buffer, delegate)
		}.to raise_error(XRB::ParseError)
	end
	
	it "should fail to parse incomplete instruction" do
		buffer = XRB::Buffer.new('<?r foo')
		
		expect{
			subject.parse_template(buffer, delegate)
		}.to raise_error(XRB::ParseError)
	end
end

if defined? XRB::Fallback
	RSpec.describe XRB::Fallback do
		it_behaves_like "template parser"
	end
end

if defined? XRB::Native
	RSpec.describe XRB::Native do
		it_behaves_like "template parser"
	end
end
