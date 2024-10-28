#!/usr/bin/env ruby
# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2012-2024, by Samuel Williams.

require "xrb/parsers"
require "xrb/entities"
require "xrb/template"
require "xrb/markup"
require "xrb/parse_delegate"

HTMLParsers = Sus::Shared("HTML Parsers") do
	let(:delegate) {XRB::ParseDelegate.new}
	let(:buffer) {XRB::Buffer(subject)}
	let(:parsers) {XRB::Parsers}
	let(:entities) {XRB::Entities::HTML5}
	let(:events) {parsers.parse_markup(buffer, delegate, entities); delegate.events}
end

ValidMarkup = Sus::Shared("valid markup") do
	include_context HTMLParsers
	
	it "should parse without error" do
		expect{events}.not.to raise_exception
	end
end

describe "<br/>" do
	include_context ValidMarkup
	
	it "should parse self-closing tag" do
		expect(events).to be == [
			[:open_tag_begin, "br", 1],
			[:open_tag_end, true],
		]
	end
end

describe "<!DOCTYPE html>" do
	include_context ValidMarkup
	
	it "should parse doctype" do
		expect(events).to be == [
			[:doctype, "<!DOCTYPE html>"]
		]
	end
end

describe "<?r foo=bar?>" do
	include_context ValidMarkup
	
	it "should parse instruction" do
		expect(events).to be == [
			[:instruction, "<?r foo=bar?>"]
		]
	end
end

describe %Q{<!--comment-->} do
	include_context ValidMarkup
	
	it "should parse comment" do
		expect(events).to be == [
			[:comment, "<!--comment-->"]
		]
	end
end

describe "<tag key=\"A&amp;B\" />" do
	include_context ValidMarkup
	
	it "should parse escaped attributes" do
		expect(events).to be == [
			[:open_tag_begin, "tag", 1],
			[:attribute, "key", "A&B"],
			[:open_tag_end, true],
		]
	end
end

describe "<foo bar=\"20\" baz>Hello World</foo>" do
	include_context ValidMarkup
	
	it "should parse tag with content" do
		expect(events).to be == [
			[:open_tag_begin, "foo", 1],
			[:attribute, "bar", "20"],
			[:attribute, "baz", true],
			[:open_tag_end, false],
			[:text, "Hello World"],
			[:close_tag, "foo", 31],
		]
	end
	
	it "should have same encoding" do
		expect(events[0][1].encoding).to be == subject.encoding
		expect(events[1][1].encoding).to be == subject.encoding
		expect(events[2][1].encoding).to be == subject.encoding
		expect(events[4][1].encoding).to be == subject.encoding
		expect(events[5][1].encoding).to be == subject.encoding
	end
	
	it "should track entities" do
		expect(events[1][2]).to be_a XRB::MarkupString
		expect(events[4][1]).to be_a XRB::MarkupString
	end
end

describe "<test><![CDATA[Hello World]]></test>" do
	include_context ValidMarkup
	
	it "should parse CDATA" do
		expect(events).to be == [
			[:open_tag_begin, "test", 1],
			[:open_tag_end, false],
			[:cdata, "<![CDATA[Hello World]]>"],
			[:close_tag, "test", 31],
		]
	end
end

describe "<foo bar=\"\" baz />" do
	include_context ValidMarkup
	
	it "should parse empty attributes" do
		expect(events).to be == [
			[:open_tag_begin, "foo", 1],
			[:attribute, "bar", ""],
			[:attribute, "baz", true],
			[:open_tag_end, true],
		]
	end
end

describe "<p attr=\"foo&amp;bar\">&quot;</p>" do
	include_context ValidMarkup
	
	let(:template_text) {%q{<p attr="#{events[1][2]}">#{events[3][1]}</p>}}
	let(:template_buffer) {XRB::Buffer(template_text)}
	let(:template) {XRB::Template.new(template_buffer)}
	
	it "should parse empty attributes" do
		expect(events).to be == [
			[:open_tag_begin, "p", 1],
			[:attribute, "attr", "foo&bar"],
			[:open_tag_end, false],
			[:text, "\""],
			[:close_tag, "p", 30]
		]
	end
	
	it "generates same output as input" do
		result = template.to_string(self)
		expect(result).to be == subject
	end
	
	it "should track entities" do
		expect(events[1][2]).not.to be_a XRB::MarkupString
		expect(events[3][1]).not.to be_a XRB::MarkupString
	end
end

ValidMarkupFile = Sus::Shared("valid markup file") do |base|
	include_context ValidMarkup
	
	let(:xhtml_path) {File.join(__dir__, base + ".xhtml")}
	let(:events_path) {File.join(__dir__, base + ".rb")}
	
	let(:buffer) {XRB::FileBuffer.new(xhtml_path)}
	let(:expected_events) {eval(File.read(events_path), nil, events_path)}
	
	def dump_events!
		File.open(events_path, "w+") do |output|
			output.puts "["
			events.each do |event|
				output.puts "\t#{event.inspect},"
			end
			output.puts "]"
		end
	end
	
	it "should match events" do
		#dump_events!
		
		expected_events.each_with_index do |event, index|
			expect(events[index]).to be == event
		end
	end
end

InvalidMarkup = Sus::Shared("invalid markup") do
	include_context HTMLParsers
	
	it "should fail to parse" do
		expect{events}.to raise_exception XRB::ParseError
	end
end

describe "<foo" do
	include_context InvalidMarkup
end

describe "<foo bar=>" do
	include_context InvalidMarkup
end

describe "<p>\nこんにちは World<p" do
	include_context InvalidMarkup

	let(:error) {events rescue $!}
	
	it "should fail on line 2" do
		expect(error.location.line_number).to be == 2
	end
	
	it "should fail at offset 23" do
		expect(error.location.line_offset).to be == 23
	end
end
