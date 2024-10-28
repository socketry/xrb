# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

require "xrb/error"

describe XRB::Location do
	let(:location) {subject.new("Hello\nWorld\nFoo\nBar!", 7)}
	
	it "should know about line numbers" do
		expect(location.to_i).to be == 7
		expect(location.to_s).to be == "[2:1]"
		expect(location.line_text).to be == "World"
		
		expect(location.line_number).to be == 2
		expect(location.line_range.min).to be == 6
		expect(location.line_offset).to be == 1
	end
end
