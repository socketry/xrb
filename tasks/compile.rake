
require "rake/extensiontask"

spec_path = File.expand_path('../trenni.gemspec', Dir.pwd)
spec = Gem::Specification.load(spec_path)

unless RUBY_PLATFORM =~ /java/
	Rake::ExtensionTask.new("trenni", spec) do |ext|
		ext.lib_dir = "lib/trenni"
	end
else
	task :compile do
		puts "Nothing to compile for this platform."
	end
end
