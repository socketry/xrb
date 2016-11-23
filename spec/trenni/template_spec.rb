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

require 'trenni/template'
require 'trenni/parsers'
require 'benchmark'

RSpec.describe Trenni::Template do
	let(:capture_template) {Trenni::Template.load_file File.expand_path('template_spec/capture.trenni', __dir__)}
	
	it "should be able to capture output" do
		expect(capture_template.to_string).to be == '"TEST TEST TEST\n"'
	end
	
	it "compiled template should match line numbers" do
		code_lines = capture_template.send(:code).lines
		
		expect(code_lines.count).to be == 4
		expect(code_lines[3]).to include("inspect")
	end
	
	let(:buffer_template) {Trenni::Template.load_file File.expand_path('template_spec/buffer.trenni', __dir__)}
	
	it "should be able to fetch output buffer" do
		expect(buffer_template.to_string).to be == 'test'
	end
	
	let(:nested_template) {Trenni::Template.load_file File.expand_path('template_spec/nested.trenni', __dir__)}
	
	it "should be able to handle nested interpolations" do
		expect(nested_template.to_string).to be == "Hello world!"
	end
	
	let(:items) {1..4}
	
	it "should process list of items" do
		buffer = Trenni::Buffer.new('<?r items.each do |item| ?>#{item}<?r end ?>')
		template = Trenni::Template.new(buffer)
		
		expect(template.to_string(self)).to be == "1234"
	end
	
	it "should have correct indentation" do
		buffer = Trenni::Buffer.new("\t<?r items.each do |item| ?>\n\t\#{item}\n\t<?r end ?>\n")
		template = Trenni::Template.new(buffer)
		
		expect(template.to_string(self)).to be == "\t1\n\t2\n\t3\n\t4\n"
	end
	
	let(:escaped_template) {Trenni::Template.load_file File.expand_path('template_spec/escaped.trenni', __dir__)}
	
	it "should have the same number of lines as input" do
		expect(escaped_template.send(:code).lines.count).to be == 2
	end
	
	it "should process escaped characters" do
		expect(escaped_template.to_string).to be == 
			"This\\nisn't one line.\n" +
			"\\tIndentation is the best."
	end
end

RSpec.shared_examples "template parser" do
	let(:delegate) {Trenni::ParserDelegate.new}
	
	it "should fail to parse" do
		buffer = Trenni::Buffer.new('<img src="#{poi_product.photo.thumbnail_url" />')
		
		expect{
			subject.parse_template(buffer, delegate)
		}.to raise_error(Trenni::ParseError)
	end
end

RSpec.describe Trenni::Fallback do
	it_behaves_like "template parser"
end
