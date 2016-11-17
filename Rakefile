require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec) do |task|
	begin
		require('simplecov/version')
		task.rspec_opts = %w{--require simplecov} if ENV['COVERAGE']
	rescue LoadError
	end
end

task :default => :spec

task :fetch_entities do
	require 'open-uri'
	require 'json'
	
	url = "https://www.w3.org/TR/html5/entities.json"
	
	entities = JSON.parse(open(url).read)
	map = {}
	
	puts "{"
	entities.each do |string, metadata|
		map[string] = metadata['characters']
		puts "\t#{string.dump} => #{metadata['characters'].dump}, \# #{metadata['characters'].inspect}"
	end
	puts "}"
end