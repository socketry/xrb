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
require 'trenni/safe_string'

RSpec.describe Trenni::SafeString do
	let(:template) {Trenni::Template.load_file File.expand_path('template_spec/basic.trenni', __dir__), filter: Trenni::SafeString}
	
	let(:html_text) {"<h1>Hello World</h1>"}
	
	it "should escape unsafe text" do
		model = double(text: html_text)
		
		expect(template.to_string(model)).to be == "&lt;h1&gt;Hello World&lt;/h1&gt;"
	end
	
	let(:safe_html_text) {Trenni::SafeString.new(html_text)}
	
	it "should not escape safe text" do
		model = double(text: safe_html_text)
		
		expect(template.to_string(model)).to be == html_text
	end
end
