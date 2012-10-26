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

require 'pathname'
require 'test/unit'
require 'stringio'
require 'digest/md5'

require 'trenni/parser'

class TestParser < Test::Unit::TestCase
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
	
	def test_markup
		delegate = ParserDelegate.new
		scanner = Trenni::Parser.new(delegate)

		scanner.parse(%Q{<foo bar="20" baz>Hello World</foo>})

		expected_events = [
			[:begin_tag, "foo", :opened],
			[:attribute, "bar", "20"],
			[:attribute, "baz", true],
			[:finish_tag, :opened, :opened],
			[:text, "Hello World"],
			[:begin_tag, "foo", :closed],
			[:finish_tag, :closed, :opened],
		]
		
		assert_equal expected_events, delegate.events
	end
	
	def test_cdata
		delegate = ParserDelegate.new
		scanner = Trenni::Parser.new(delegate)

		scanner.parse(%Q{<test><![CDATA[Hello World]]></test>})

		expected_events = [
			[:begin_tag, "test", :opened],
			[:finish_tag, :opened, :opened],
			[:cdata, "Hello World"],
			[:begin_tag, "test", :closed],
			[:finish_tag, :closed, :opened],
		]
		
		assert_equal expected_events, delegate.events
	end
	
	def test_errors
		delegate = ParserDelegate.new
		scanner = Trenni::Parser.new(delegate)

		assert_raise Trenni::Parser::ParseError do
			scanner.parse(%Q{<foo})
		end
		
		assert_raise Trenni::Parser::ParseError do
			scanner.parse(%Q{<foo bar=>})
		end
		
		assert_nothing_raised Trenni::Parser::ParseError do
			scanner.parse(%Q{<foo bar="" baz>})
		end
	end
	
	def test_line_at_offset
		data = %Q{Hello\nWorld\nFoo\nBar!}
		
		line = Trenni::Parser.line_at_offset(data, 7)
		
		assert_equal "World", line[:text]
		assert_equal 2, line[:line_number]
		assert_equal 6, line[:line_offset]
		assert_equal 1, line[:character_offset]
	end
end
