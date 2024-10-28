# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2017-2024, by Samuel Williams.

require "benchmark/ips"
require "xrb/markup"

describe XRB::Markup do
	let(:code_string) {'javascript:if (foo < bar) {alert("Hello World")}'}
	let(:general_string) {"a" * code_string.size}
	
	it "should be fast to parse large documents" do
		Benchmark.ips do |x|
			x.report("CGI.escapeHTML(general_string)") do |times|
				while (times -= 1) >= 0
					CGI.escapeHTML(general_string)
				end
			end
			
			x.report("CGI.escapeHTML(code_string)") do |times|
				while (times -= 1) >= 0
					CGI.escapeHTML(code_string)
				end
			end
			
			x.report("XRB::Markup.escape_string(general_string)") do |times|
				while (times -= 1) >= 0
					XRB::Markup.escape_string(general_string)
				end
			end
			
			x.report("XRB::Markup.escape_string(code_string)") do |times|
				while (times -= 1) >= 0
					XRB::Markup.escape_string(code_string)
				end
			end
			
			x.compare!
		end
	end
end
