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

require 'trenni/tag'

RSpec.describe Trenni::Tag.new("body", false, class: 'main') do
	it "should have name" do
		expect(subject.name).to be == "body"
	end
	
	it "should be open by default" do
		expect(subject).to_not be_self_closed
	end
	
	it "should have an attribute" do
		expect(subject.attributes).to include(:class)
		expect(subject[:class]).to be == 'main'
		expect(subject.to_s).to include('class="main"')
	end
end

RSpec.describe Trenni::Tag.new("button", true, 'onclick' => 'javascript:alert("Hello World")') do
	it "should have name" do
		expect(subject.name).to be == "button"
	end
	
	it "should have an attribute" do
		expect(subject.attributes).to include('onclick')
	end
	
	it "should generate valid string" do
		expect(subject.to_s).to be == '<button onclick="javascript:alert(&quot;Hello World&quot;)"/>'
	end
end

RSpec.describe Trenni::Tag.new("p", false, {}) do
	it "should include content" do
		expect(subject.to_s("Hello World")).to be == "<p>Hello World</p>"
	end
end
