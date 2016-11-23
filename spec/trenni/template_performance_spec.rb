
require 'benchmark/ips'
require 'trenni/parsers'
require 'trenni/template'
require 'erb'

# require 'ruby-prof'

RSpec.describe Trenni::Template do
	class Model
		def name
			"Bob Dole"
		end
		
		def reverse(&block)
			Trenni::Template.capture(&block).reverse
		end
	end
	
	# let(:large_template) {Trenni::Template.load_file File.expand_path('template_spec/large.trenni', __dir__)}
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
	
	
	it "should be fast for basic templates" do
		trenni_template = Trenni::Template.new(Trenni::Buffer.load('Hi, #{name}!'))
		model = Model.new
		model_binding = model.instance_eval{binding}
		
		erb_template = ERB.new("Hi, <%= name %>!")
		
		# There IS a measuarble difference:
		Benchmark.ips do |x|
			x.report("Trenni (object)") do |times|
				i = 0
				
				while i < times
					trenni_template.to_string(model)
					
					i += 1
				end
			end
			
			# x.report("Trenni (binding)") do |times|
			# 	i = 0
			# 	
			# 	while i < times
			# 		trenni_template.to_string(model_binding)
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
		trenni_template = Trenni::Template.new(Trenni::Buffer.load('Hi, <?r reverse do ?>#{name}!<?r end ?>'))
		model = Model.new
		
		# There IS a measuarble difference:
		Benchmark.ips do |x|
			x.report("Trenni") do |times|
				i = 0
				
				while i < times
					trenni_template.to_string(model)
					
					i += 1
				end
			end
			
			x.compare!
		end
	end
end