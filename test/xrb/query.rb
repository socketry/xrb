# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2020-2024, by Samuel Williams.

require "xrb/query"

describe XRB::Query do
	def parse(string)
		subject.parse(XRB::Buffer.new(string))
	end
	
	it "can parse query string with integer key" do
		expect(parse "q[0]=0").to be == {q: {0 => "0"}}
	end
	
	it "can parse query string with mixed integer/string key" do
		expect(parse "q[2d]=3d").to be == {q: {:'2d' => "3d"}}
	end
	
	it "can parse query string appending items to array" do
		expect(parse "q[]=a&q[]=b").to be == {q: ["a", "b"]}
	end
	
	it "can decode encoded keys" do
		expect(parse "hello+world=true").to be == {:"hello world" => "true"}
	end
	
	it "can decode encoded values" do
		expect(parse "message=hello+world").to be == {message: "hello world"}
	end
end
