#!/usr/bin/env ruby

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

require 'trenni/parser'

module Trenni::ParserSpec
	class ParserDelegate
		def initialize
			@events = []
		end
		
		attr :events
		
		def method_missing(*args)
			@events << args
		end
		
		def begin_parse(scanner)
			# ignore this event
		end
	end
	
	describe Trenni::Parser do
		let(:delegate) {ParserDelegate.new}
		let(:parser) {Trenni::Parser.new(delegate)}
		
		it "should parse self-closing tags correctly" do
			parser.parse("<br/>")
			
			expect(delegate.events).to be == [
				[:begin_tag, "br", :opened],
				[:finish_tag, :opened, :closed],
			]
		end
		
		it "should parse doctype correctly" do
			parser.parse("<!DOCTYPE html>")
			
			expect(delegate.events).to be == [
				[:doctype, "html"]
			]
		end
		
		it "Should parse instruction correctly" do
			parser.parse("<?foo=bar?>")
			
			expect(delegate.events).to be == [
				[:instruction, "foo=bar"]
			]
		end
		
		it "should parse comment correctly" do
			parser.parse(%Q{<!--comment-->})
			
			expect(delegate.events).to be == [
				[:comment, "comment"]
			]
		end
		
		it "should parse markup correctly" do
			parser.parse(%Q{<foo bar="20" baz>Hello World</foo>})

			expected_events = [
				[:begin_tag, "foo", :opened],
				[:attribute, "bar", "20"],
				[:attribute, "baz", true],
				[:finish_tag, :opened, :opened],
				[:text, "Hello World"],
				[:begin_tag, "foo", :closed],
				[:finish_tag, :closed, :opened],
			]
		
			expect(delegate.events).to be == expected_events
		end
		
		it "should parse CDATA correctly" do
			parser.parse(%Q{<test><![CDATA[Hello World]]></test>})

			expected_events = [
				[:begin_tag, "test", :opened],
				[:finish_tag, :opened, :opened],
				[:cdata, "Hello World"],
				[:begin_tag, "test", :closed],
				[:finish_tag, :closed, :opened],
			]
		
			expect(delegate.events).to be == expected_events
		end
		
		it "should generate errors on incorrect input" do
			expect{parser.parse(%Q{<foo})}.to raise_error Trenni::Parser::ParseError
			
			expect{parser.parse(%Q{<foo bar=>})}.to raise_error Trenni::Parser::ParseError
			
			expect{parser.parse(%Q{<foo bar="" baz>})}.to_not raise_error
		end
		
		it "should know about line numbers" do
			data = %Q{Hello\nWorld\nFoo\nBar!}
		
			location = Trenni::Parser::Location.new(data, 7)
			
			expect(location.to_i).to be == 7
			expect(location.to_s).to be == ":2"
			expect(location.line_text).to be == "World"
			
			expect(location.line_number).to be == 2
			expect(location.line_range.min).to be == 6
			expect(location.line_offset).to be == 1
		end
		
		it "should know about line numbers when input contains multi-byte characters" do
			data = %Q{<p>\nこんにちは\nWorld\n<p}
			error = parser.parse(data) rescue $!
			
			expect(error).to be_kind_of Trenni::Parser::ParseError
			expect(error.location.line_number).to be == 4
		end
	end
end
