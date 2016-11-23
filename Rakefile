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
	
	entites_json_path = File.expand_path("entities.json", __dir__)
	
	unless File.exist? entites_json_path
		url = "https://www.w3.org/TR/html5/entities.json"
		File.write(entites_json_path, open(url).read)
	end
	
	@entities = JSON.parse(File.read(entites_json_path)).delete_if{|string, _| !string.end_with? ';'}
end

task :update_entities => :fetch_entities do
	require 'trenni/template'
	
	paths = {
		'ext/trenni/entities.rl' => 'ext/trenni/entities.trenni',
		'lib/trenni/entities.rb' => 'lib/trenni/entities.trenni',
	}
	
	paths.each do |output_path, template_path|
		template = Trenni::Template.load_file(template_path)
		
		puts template.send(:code)
		
		#output = template.to_string(@entities)
		
		#File.write(output_path, output)
	end
end

require "rake/extensiontask"

Rake::ExtensionTask.new "trenni" do |ext|
	ext.lib_dir = "lib/trenni/native"
end

task :generate_fallback_parsers do
	parsers_directory = File.expand_path("parsers", __dir__)
	fallback_directory = File.expand_path("lib/trenni/fallback", __dir__)
	
	Dir.chdir(fallback_directory) do
		Dir.glob("*.rl").each do |parser_path|
			sh("ragel", "-I", parsers_directory, "-R", parser_path)
		end
	end
end

task :generate_lexer => :update_entities do
	
	
	Dir.chdir("ext/trenni") do
		# -G2 generates a slightly faster parser but it doens't compile when handling entities.
		sh("ragel", "-I", parsers_directory, "-C", "markup.rl", "-F1")
		sh("ragel", "-I", parsers_directory, "-C", "template.rl", "-F1")
	end
end

task :visualize_lexer do
	Dir.chdir("ext/trenni") do
		sh("ragel -Vp markup.rl -M main | dot -Tpdf -o markup.pdf && open lexer.pdf")
		sh("ragel -Vp template.rl -M main | dot -Tpdf -o template.pdf && open lexer.pdf")
	end
end

task :environment do
	$LOAD_PATH.unshift File.expand_path('lib', __dir__)
end

task :console => :environment do
	require 'pry'
	
	Pry.start
end
