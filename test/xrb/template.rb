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

describe XRB::Template do
	with 'large.xhtml' do
		let(:template_path) {File.expand_path('.corpus/large.xhtml', __dir__)}
		let(:template) {XRB::Template.load_file template_path}
		let(:output) {template.to_string}
		
		it "should parse xhtml template and produce identical output" do
			expect{output}.not.to raise_exception
			expect(output).to be == File.read(template_path)
		end
	end
	
	with 'lines.xrb' do
		let(:template_path) {File.expand_path('.corpus//lines.xrb', __dir__)}
		let(:template) {XRB::Template.load_file template_path}
		let(:code) {template.send(:code)}
		
		it "should parse xhtml template and produce identical output" do
			expect(code.lines[0]).to be =~ /apple/
			expect(code.lines[5]).to be =~ /banana/
		end
	end
	
	with 'builder.xrb' do
		let(:template_path) {File.expand_path('.corpus//builder.xrb', __dir__)}
		let(:template) {XRB::Template.load_file template_path}
		let(:code) {template.send(:code)}
		
		it "should capture and output the contents of the block" do
			expect(template.to_string).to be == 'Hello World!'
		end
	end
	
	with 'capture.xrb' do
		let(:capture_template) {XRB::Template.load_file File.expand_path('.corpus//capture.xrb', __dir__)}
		
		it "should be able to capture output" do
			expect(capture_template.to_string).to be == '"TEST TEST TEST\n"'
		end
		
		it "compiled template should match line numbers" do
			code_lines = capture_template.send(:code).lines
			
			expect(code_lines.count).to be == 4
			expect(code_lines[3]).to be(:include?, "inspect")
		end
	end
	
	with 'buffer.xrb' do
		let(:buffer_template) {XRB::Template.load_file File.expand_path('.corpus//buffer.xrb', __dir__)}
		
		it "should be able to fetch output buffer" do
			expect(buffer_template.to_string).to be == 'test'
		end
	end
	
	with 'nested.xrb' do
		let(:nested_template) {XRB::Template.load_file File.expand_path('.corpus//nested.xrb', __dir__)}
		
		it "should be able to handle nested interpolations" do
			expect(nested_template.to_string).to be == "Hello world!"
		end
	end
	
	with 'items' do
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
	
	with 'escaped.xrb' do
		let(:escaped_template) {XRB::Template.load_file File.expand_path('.corpus//escaped.xrb', __dir__)}
		
		it "should have the same number of lines as input" do
			expect(escaped_template.send(:code).lines.count).to be == 2
		end
		
		it "should process escaped characters" do
			expect(escaped_template.to_string).to be ==
				"This\\nisn't one line.\n" +
				"\\tIndentation is the best."
		end
	end
	
	with 'scope' do
		it "should use default top-level binding if none provided" do
			buffer = XRB::Buffer.new('#{Module.nesting.inspect}')
			template = XRB::Template.new(buffer)
			
			expect(template.to_string(self)).to be == "[XRB]"
		end
	end
end

ATemplateParser = Sus::Shared("template parser") do
	let(:delegate) {XRB::ParseDelegate.new}
	
	it "should fail to parse incomplete expression" do
		buffer = XRB::Buffer.new('<img src="#{poi_product.photo.thumbnail_url" />')
		
		expect{
			subject.parse_template(buffer, delegate)
		}.to raise_exception(XRB::ParseError)
	end
	
	it "should fail to parse incomplete instruction" do
		buffer = XRB::Buffer.new('<?r foo')
		
		expect{
			subject.parse_template(buffer, delegate)
		}.to raise_exception(XRB::ParseError)
	end
end

if defined? XRB::Fallback
	describe XRB::Fallback do
		it_behaves_like ATemplateParser
	end
end

if defined? XRB::Native
	describe XRB::Native do
		it_behaves_like ATemplateParser
	end
end
