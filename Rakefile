require "bundler/gem_tasks"
require "rspec/core/rake_task"

# Load all rake tasks:
import(*Dir.glob('tasks/**/*.rake'))

RSpec::Core::RakeTask.new(:test)

task :environment do
	$LOAD_PATH.unshift File.expand_path('lib', __dir__)
end

task :console => :environment do
	require 'pry'
	
	Pry.start
end

task :default => :test
