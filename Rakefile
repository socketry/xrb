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
	
	@entities = JSON.parse(open(url).read).delete_if{|string, _| !string.end_with? ';'}
end

task :update_entities => :fetch_entities do
	require 'trenni/template'
	
	paths = {
		'ext/trenni/entities.rl' => 'ext/trenni/entities.trenni',
		'lib/trenni/entities.rb' => 'lib/trenni/entities.trenni',
	}
	
	paths.each do |output_path, template_path|
		template = Trenni::Template.load_file(template_path)
		
		output = template.to_string(@entities)
		
		File.write(output_path, output)
	end
end

require "rake/extensiontask"

Rake::ExtensionTask.new "trenni" do |ext|
	ext.lib_dir = "lib/trenni/native"
end

task :generate_lexer do
	Dir.chdir("ext/trenni") do
		sh("ragel", "-C", "lexer.rl", "-G2")
		sh("ragel -Vp lexer.rl | dot -Tpdf -o lexer.pdf && open lexer.pdf")
	end
end

task :environment do
	$LOAD_PATH.unshift File.expand_path('lib', __dir__)
end

task :console => :environment do
	require 'pry'
	
	Pry.start
end
