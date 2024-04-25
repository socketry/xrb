#!/usr/bin/env ruby
# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2017-2024, by Samuel Williams.

require 'xrb/uri'
require 'xrb/tag'

describe XRB::URI do
	describe XRB::URI('path with spaces/image.jpg') do
		it "encodes whitespace" do
			expect(subject.to_s).to be == "path%20with%20spaces/image.jpg"
		end
	end
	
	describe XRB::URI('path', array: [1, 2, 3]) do
		it "encodes array" do
			expect(subject.to_s).to be == "path?array[]=1&array[]=2&array[]=3"
		end
	end
	
	describe XRB::URI('path_with_underscores/image.jpg') do
		it "doesn't touch underscores" do
			expect(subject.to_s).to be == "path_with_underscores/image.jpg"
		end
	end
	
	describe XRB::URI('index', 'my name' => 'Bob Dole') do
		it "encodes query" do
			expect(subject.to_s).to be == "index?my%20name=Bob%20Dole"
		end
	end
	
	describe XRB::URI('index#All Your Base') do
		it "encodes fragment" do
			expect(subject.to_s).to be == "index\#All%20Your%20Base"
		end
	end
	
	describe XRB::URI('I/❤️/UNICODE', face: '😀') do
		it "encodes unicode" do
			expect(subject.to_s).to be == "I/%E2%9D%A4%EF%B8%8F/UNICODE?face=%F0%9F%98%80"
		end
	end
	
	it "can be an attribute" do
		tag = XRB::Tag.closed('img', src: XRB::URI('image.jpg', x: 10))
		
		expect(tag.to_s).to be == '<img src="image.jpg?x=10"/>'
	end
	
	describe XRB::URI("foo?bar=10&baz=20", yes: 'no') do
		it "can use existing query parameters" do
			expect(subject.to_s).to be == "foo?bar=10&baz=20&yes=no"
		end
	end
	
	describe XRB::URI('foo#frag') do
		it "can use existing fragment" do
			expect(subject.fragment).to be == "frag"
			expect(subject.to_s).to be == 'foo#frag'
		end
	end
end
