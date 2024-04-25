# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

require 'benchmark/ips'

describe "block.call vs yield with block vs yield" do
	def do_call(&block)
		block.call
	end
	
	def do_yield(&block)
		yield
	end
	
	def do_yield_without_block
		yield
	end
	
	it "should be fast to call a block" do
		firstname = 'soundarapandian'
		middlename = 'rathinasamy'
		lastname = 'arumugam'
		
		existing_block = proc{}
		
		Benchmark.ips do |x|
			x.report("block.call") do |i|
				buffer = String.new
				
				while (i -= 1) > 0
					do_call(&existing_block)
				end
			end
			
			x.report("yield with block") do |i|
				buffer = String.new
				
				while (i -= 1) > 0
					do_yield(&existing_block)
				end
			end
			
			x.report("yield") do |i|
				buffer = String.new
				
				while (i -= 1) > 0
					do_yield_without_block(&existing_block)
				end
			end
			
			x.compare!
		end
	end
end
