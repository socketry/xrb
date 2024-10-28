# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

require "benchmark/ips"
require "stringio"

describe "String\#<< vs Array\#<< vs StringIO" do
	it "should be fast to concatenate strings" do
		Benchmark.ips do |x|
			# These tests look at the cost of simply writing to a buffer.
			
			x.report("String\#<<") do |i|
				buffer = String.new
				
				while (i -= 1) > 0
					buffer << "String #{i}"
				end
			end
			
			x.report("Array\#<<") do |i|
				buffer = []
				
				while (i -= 1) > 0
					buffer << "String #{i}"
				end
				
				buffer.join
			end
			
			x.report("StringIO") do |i|
				buffer = StringIO.new
				
				while (i -= 1) > 0
					buffer << "String #{i}"
				end
			end
			
			x.compare!
		end
	end

	it "should be fast to concatenate strings several times" do
		# Adjust N to consider the cost of allocation vs the cost of appending.
		n = 5

		Benchmark.ips do |x|
			# These next two tests consider that multiple writes may be done per buffer allocation.
			
			x.report("String") do |i|
				i.times do
					buffer = String.new
					
					n.times do
						buffer << "String #{i}"
					end
				end
			end
			
			x.report("StringIO") do |i|
				i.times do
					buffer = StringIO.new
					
					n.times do
						buffer << "String #{i}"
					end
				end
			end
			
			x.compare!
		end
	end
end
