#!/usr/bin/env rspec
# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

require 'xrb/template'
require 'xrb/parsers'

describe XRB::Template do
	let(:template_path) {File.expand_path('.corpus/error.xrb', __dir__)}
	let(:template) {XRB::Template.load_file template_path}
	let(:output) {template.to_string}
	
	it "should produce error on correct line" do
		expect{output}.to raise_exception(NameError) do |error|
			expect(error.backtrace.first).to be =~ /error.xrb:4:/
		end
	end
end
