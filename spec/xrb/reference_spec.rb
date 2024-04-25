#!/usr/bin/env ruby
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

require 'xrb/reference'

RSpec.describe XRB::Reference do
	describe XRB::Reference('path with spaces/image.jpg') do
		it "encodes whitespace" do
			expect(subject.to_s).to be == "path%20with%20spaces/image.jpg"
		end
	end
	
	describe XRB::Reference('path', array: [1, 2, 3]) do
		it "encodes array" do
			expect(subject.to_s).to be == "path?array[]=1&array[]=2&array[]=3"
		end
	end
	
	describe XRB::Reference('path_with_underscores/image.jpg') do
		it "doesn't touch underscores" do
			expect(subject.to_s).to be == "path_with_underscores/image.jpg"
		end
	end
	
	describe XRB::Reference('index', :'my name' => 'Bob Dole') do
		it "encodes query" do
			expect(subject.to_s).to be == "index?my%20name=Bob%20Dole"
		end
	end
	
	describe XRB::Reference('index#All Your Base') do
		it "encodes fragment" do
			expect(subject.to_s).to be == "index\#All%20Your%20Base"
		end
	end
	
	describe XRB::Reference('I/❤️/UNICODE', face: '😀') do
		it "encodes unicode" do
			expect(subject.to_s).to be == "I/%E2%9D%A4%EF%B8%8F/UNICODE?face=%F0%9F%98%80"
		end
	end
	
	it "can be an attribute" do
		tag = XRB::Tag.closed('img', src: XRB::Reference('image.jpg', x: 10))
		
		expect(tag.to_s).to be == '<img src="image.jpg?x=10"/>'
	end
	
	describe XRB::Reference("foo?bar=10&baz=20", yes: 'no') do
		it "can use existing query parameters" do
			expect(subject.to_s).to be == "foo?bar=10&baz=20&yes=no"
		end
	end
	
	describe XRB::Reference("foo?yes=yes", yes: 'no') do
		it "overrides existing parameters" do
			expect(subject.to_s).to be == "foo?yes=no"
		end
	end
	
	describe XRB::Reference('foo#frag') do
		it "can use existing fragment" do
			expect(subject.fragment).to be == "frag"
			expect(subject.to_s).to be == 'foo#frag'
		end
	end
end
