
if ENV['COVERAGE']
	begin
		require 'simplecov'
		
		SimpleCov.start do
			add_filter "/spec/"
		end
		
		if ENV['TRAVIS']
			require 'coveralls'
			Coveralls.wear!
		end
	rescue LoadError
		warn "Could not load simplecov: #{$!}"
	end
end

require "bundler/setup"
require "trenni"

begin
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
rescue LoadError
	RSpec.shared_context "profile" do
		before(:all) do
			puts "Profiling not supported on this platform."
		end
	end
end

RSpec.configure do |config|
	# Enable flags like --only-failures and --next-failure
	config.example_status_persistence_file_path = ".rspec_status"

	config.expect_with :rspec do |c|
		c.syntax = :expect
	end
end
