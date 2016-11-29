
require 'benchmark/ips'
require 'trenni/parsers'
require 'trenni/entities'

require 'nokogiri'

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

RSpec.describe Trenni::Parsers do
	# include_context "profile"
	
	let(:xhtml_path) {File.expand_path('corpus/large.xhtml', __dir__)}
	let(:xhtml_buffer) {Trenni::FileBuffer.new(xhtml_path)}
	let(:entities) {Trenni::Entities::HTML5}
	
	it "should be fast to parse large documents" do
		Benchmark.ips do |x|
			x.report("Large Document (Trenni)") do |times|
				delegate = Trenni::ParseDelegate.new
				
				while (times -= 1) >= 0
					Trenni::Parsers.parse_markup(xhtml_buffer, delegate, entities)
					
					delegate.events.clear
				end
			end
			
			x.report("Large Document (Nokogiri)") do |times|
				delegate = Trenni::ParseDelegate.new
				parser = Nokogiri::HTML::SAX::Parser.new(delegate)
				
				while (times -= 1) >= 0
					parser.parse(xhtml_buffer.read)
					
					delegate.events.clear
				end
			end
			
			x.compare!
		end
	end
end