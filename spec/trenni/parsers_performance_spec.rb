
require 'benchmark/ips'
require 'trenni/parsers'
require 'trenni/entities'

require 'ruby-prof'

RSpec.shared_context "profile" do
	before(:all) do
		RubyProf.start
	end
	
	after(:all) do
		result = RubyProf.stop
		
		# Print a flat profile to text
		printer = RubyProf::FlatPrinter.new(result)
		printer.print(STDOUT)
	end
end

RSpec.xdescribe Trenni::Parsers do
	# include_context "profile"
	
	let(:xhtml_path) {File.expand_path('performance_spec/large.xhtml', __dir__)}
	let(:xhtml_buffer) {Trenni::FileBuffer.new(xhtml_path)}
	let(:entities) {Trenni::Entities::HTML5}
	
	it "should be fast to parse large documents" do
		Benchmark.ips do |x|
			x.report("Large Document") do |times|
				delegate = Trenni::ParserDelegate.new
				
				while (times -= 1) >= 0
					Trenni::Parsers.parse_markup(xhtml_buffer, delegate, entities)
					
					delegate.events.clear
				end
			end
			
			x.compare!
		end
	end
end