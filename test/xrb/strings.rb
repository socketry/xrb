#!/usr/bin/env ruby
# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2012-2024, by Samuel Williams.

require "xrb/strings"

describe XRB::Strings do
	it "should escape html sensitive characters" do
		text = XRB::Strings.to_html("<foobar>")
		expect(text).to be == "&lt;foobar&gt;"
		
		text = XRB::Strings.to_html(%q{"I'd like to do this & that :p", she said.})
		expect(text).to be == %q{&quot;I'd like to do this &amp; that :p&quot;, she said.}
	end
	
	it "should generate quoted strings" do
		text = XRB::Strings.to_quoted_string(%Q{"Hello World"})
		expect(text).to be == %q{"\"Hello World\""}
	
		text = XRB::Strings.to_quoted_string(%Q{"Hello\r\nWorld"})
		expect(text).to be == %q{"\"Hello\r\nWorld\""}
	end
	
	it "should generate quoted attributes" do
		text = XRB::Strings.to_attribute(:foo, "bar")
		expect(text).to be == %Q{foo="bar"}
	
		text = XRB::Strings.to_simple_attribute(:foo, false)
		expect(text).to be == %Q{foo}
	
		text = XRB::Strings.to_simple_attribute(:foo, true)
		expect(text).to be == %Q{foo="foo"}
	end
	
	it "should generate nice titles" do
		text = XRB::Strings.to_title("foo bar")
		expect(text).to be == "Foo Bar"
	end
	
	it "should generate nice identifiers" do
		text = XRB::Strings.to_snake("Happy::Go::Lucky")
		expect(text).to be == "happy_go_lucky"
	end
end
