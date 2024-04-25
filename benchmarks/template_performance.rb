# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

require 'benchmark/ips'
require 'xrb/parsers'
require 'xrb/template'
require 'erb'

class Model
	def name
		"Bob Dole"
	end
	
	def reverse(&block)
		XRB::Template.capture(&block).reverse
	end
end

describe XRB::Template do
	# let(:large_template) {XRB::Template.load_file File.expand_path('template_spec/large.xrb', __dir__)}
	#
	# it "should have better performance using instance" do
	# 	n = 1_000
	# 	
	# 	#RubyProf.start
	# 	
	# 	object_time = Benchmark.realtime{n.times{large_template.to_string(self)}}
	# 	binding_time = Benchmark.realtime{n.times{large_template.to_string(binding)}}
	# 	
	# 	#result = RubyProf.stop
	# 	
	# 	# Print a flat profile to text
	# 	#printer = RubyProf::FlatPrinter.new(result)
	# 	#printer.print(STDOUT)
	# 	
	# 	expect(object_time).to be < binding_time
	# end
	
	let(:interpolations_path) {File.expand_path('.corpus/interpolations.xrb', __dir__)}
	
	it "should be fast for lots of interpolations" do
		xrb_template = XRB::MarkupTemplate.new(XRB::Buffer.load_file(interpolations_path))
		model = Model.new
		
		Benchmark.ips do |x|
			x.report("XRB") do |times|
				i = 0
				
				while i < times
					xrb_template.to_string(model)
					
					i += 1
				end
			end
		end
	end
	
	it "should be fast for basic templates" do
		xrb_template = XRB::Template.new(XRB::Buffer.load('Hi, #{name}!'))
		model = Model.new
		model_binding = model.instance_eval{binding}
		
		erb_template = ERB.new("Hi, <%= name %>!")
		
		# There IS a measuarble difference:
		Benchmark.ips do |x|
			x.report("XRB (object)") do |times|
				i = 0
				
				while i < times
					xrb_template.to_string(model)
					
					i += 1
				end
			end
			
			# x.report("XRB (binding)") do |times|
			# 	i = 0
			# 	
			# 	while i < times
			# 		xrb_template.to_string(model_binding)
			# 		
			# 		i += 1
			# 	end
			# end
			
			x.report("ERB (binding)") do |times|
				i = 0
				
				while i < times
					erb_template.result(model_binding)
					
					i += 1
				end
			end
			
			x.compare!
		end
	end
	
	it "should be fast with capture" do
		xrb_template = XRB::Template.new(XRB::Buffer.load('Hi, <?r reverse do ?>#{name}!<?r end ?>'))
		model = Model.new
		
		# There IS a measuarble difference:
		Benchmark.ips do |x|
			x.report("XRB") do |times|
				i = 0
				
				while i < times
					xrb_template.to_string(model)
					
					i += 1
				end
			end
			
			x.compare!
		end
	end
end
