# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

require 'benchmark/ips'

describe "String interpolation vs String\#<<" do
	it "should be fast to concatenate strings" do
		firstname = 'soundarapandian'
		middlename = 'rathinasamy'
		lastname = 'arumugam'
		
		Benchmark.ips do |x|
			x.report("String\#<<") do |i|
				buffer = String.new
				
				while (i -= 1) > 0
					buffer << 'Mr. ' << firstname << middlename << lastname << ' aka soundar'
				end
			end
			
			x.report("String interpolate") do |i|
				buffer = String.new
				
				while (i -= 1) > 0
					buffer << "Mr. #{firstname} #{middlename} #{lastname} aka soundar"
				end
			end
			
			x.compare!
		end
	end
end
