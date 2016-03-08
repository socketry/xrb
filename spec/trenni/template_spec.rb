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
require 'benchmark'

# require 'ruby-prof'

module Trenni::TemplateSpec
	describe Trenni::Template do
		let(:capture_template) {Trenni::Template.load_file File.expand_path('template_spec/capture.trenni', __dir__)}
		
		it "should be able to capture output" do
			expect(capture_template.to_string.strip).to be == 'TEST TEST TEST'
		end
		
		let(:buffer_template) {Trenni::Template.load_file File.expand_path('template_spec/buffer.trenni', __dir__)}
		
		it "should be able to fetch output buffer" do
			expect(buffer_template.to_string).to be == 'test'
		end
		
		let(:nested_template) {Trenni::Template.load_file File.expand_path('template_spec/nested.trenni', __dir__)}
		
		it "should be able to handle nested interpolations" do
			expect(nested_template.to_string).to be == "Hello world!"
		end
		
		it "should process list of items" do
			template = Trenni::Template.new('<?r items.each do |item| ?>#{item}<?r end ?>')
			
			items = 1..4
			
			expect(template.to_string(binding)).to be == "1234"
		end
		
		let(:large_template) {Trenni::Template.load_file File.expand_path('template_spec/large.trenni', __dir__)}

		it "should have better performance using instance" do
			n = 1_000
			
			#RubyProf.start
			
			object_time = Benchmark.realtime{n.times{large_template.to_string(self)}}
			binding_time = Benchmark.realtime{n.times{large_template.to_string(binding)}}
			
			#result = RubyProf.stop
			
			# Print a flat profile to text
			#printer = RubyProf::FlatPrinter.new(result)
			#printer.print(STDOUT)
			
			expect(object_time).to be < binding_time
		end
		
		let(:escaped_template) {Trenni::Template.load_file File.expand_path('template_spec/escaped.trenni', __dir__)}
		
		it "should process escaped characters" do
			expect(escaped_template.to_string).to be == 
				"This\\nisn't one line.\n" +
				"\\tIndentation is the best."
		end
	end
end
