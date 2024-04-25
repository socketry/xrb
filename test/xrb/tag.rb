# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2017-2024, by Samuel Williams.

require 'xrb/tag'

describe XRB::Tag.new("body", false, class: 'main') do
	it "should have name" do
		expect(subject.name).to be == "body"
	end
	
	it "should be open by default" do
		expect(subject).not.to be(:self_closed?)
	end
	
	it "should have an attribute" do
		expect(subject.attributes).to be(:include?, :class)
		expect(subject[:class]).to be == 'main'
		expect(subject.to_s).to be(:include?, 'class="main"')
	end
end

describe XRB::Tag.new("button", true, 'onclick' => 'javascript:alert("Hello World")') do
	it "should have name" do
		expect(subject.name).to be == "button"
	end
	
	it "should have an attribute" do
		expect(subject.attributes).to be(:include?, 'onclick')
	end
	
	it "should generate valid string" do
		expect(subject.to_s).to be == '<button onclick="javascript:alert(&quot;Hello World&quot;)"/>'
	end
end

describe XRB::Tag.new("p", false, {}) do
	it "should include content" do
		expect(subject.to_s("Hello World")).to be == "<p>Hello World</p>"
	end
end

describe "namespace:name" do
	it "should have namespace" do
		expect(XRB::Tag.split(subject)).to be == ['namespace', 'name']
	end
end

describe "name" do
	it "should not have namespace" do
		expect(XRB::Tag.split(subject)).to be == [nil, 'name']
	end
end
