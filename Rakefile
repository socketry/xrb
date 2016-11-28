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
	ext.lib_dir = "lib/trenni"
end

PARSERS_DIRECTORY = File.expand_path("parsers", __dir__)
FALLBACK_DIRECTORY = File.expand_path("lib/trenni/fallback", __dir__)
NATIVE_DIRECTORY = File.expand_path("ext/trenni", __dir__)

task :generate_fallback_parsers do
	Dir.chdir(FALLBACK_DIRECTORY) do
		Dir.glob("*.rl").each do |parser_path|
			sh("ragel", "-I", PARSERS_DIRECTORY, "-R", parser_path, "-F1")
		end
	end
end

task :generate_native_parsers do
	Dir.chdir(NATIVE_DIRECTORY) do
		Dir.glob("*.rl").each do |parser_path|
			sh("ragel", "-I", PARSERS_DIRECTORY, "-C", parser_path, "-G2")
		end
	end
end

task :generate_parsers => [:generate_native_parsers, :generate_fallback_parsers, :compile]

task :visualize_parsers do
	Dir.chdir(FALLBACK_DIRECTORY) do
		Dir.glob("*.rl").each do |parser_path|
			dot_path = parser_path + ".dot"
			sh("ragel", "-I", PARSERS_DIRECTORY, "-Vp", parser_path, "-o", dot_path)
			
			pdf_path = parser_path + ".pdf"
			sh("dot", "-Tpdf", "-o", pdf_path, dot_path)
			
			sh("open", pdf_path)
		end
	end
end

task :environment do
	$LOAD_PATH.unshift File.expand_path('lib', __dir__)
end

task :console => :environment do
	require 'pry'
	
	Pry.start
end
