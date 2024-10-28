#!/usr/bin/env rspec
# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

require "xrb/template"
require "xrb/parsers"

describe XRB::Template do
	let(:template_path) {File.expand_path(".corpus/error.xrb", __dir__)}
	let(:template) {XRB::Template.load_file template_path}
	
	it "should produce error on correct line" do
		expect{template.to_string}.to raise_exception(NameError) do |error|
			expect(error.backtrace.first).to be =~ /error.xrb:4:/
		end
	end
	
	it "should close the output with the error" do
		close_write_error = nil
		
		output = StringIO.new
		mock(output) do |mock|
			mock.replace(:close_write) do |error|
				close_write_error = error
			end
		end
		
		expect do
			template.to_proc.call(output)
		end.to raise_exception(NameError)
		
		expect(close_write_error).to be_a(NameError)
	end
end
