# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

def build
	ext_path = File.expand_path("ext", __dir__)
	
	Dir.chdir(ext_path) do
		system("ruby ./extconf.rb") unless File.exist?("Makefile")
		system("make")
	end
end

def clean
	ext_path = File.expand_path("ext", __dir__)
	
	Dir.chdir(ext_path) do
		system("make clean")
	end
end

def template(path)
	$LOAD_PATH << File.expand_path("ext", __dir__)
	
	require_relative "lib/xrb/template"
	
	template = XRB::Template.load_file(path)
	
	puts "-------------------------------------------------"
	puts template.code
end

def before_test
	self.build
end

# Update the project documentation with the new version number.
#
# @parameter version [String] The new version number.
def after_gem_release_version_increment(version)
	context["releases:update"].call(version)
	context["utopia:project:update"].call
end

# Create a GitHub release for the given tag.
#
# @parameter tag [String] The tag to create a release for.
def after_gem_release(tag:, **options)
	context["releases:github:release"].call(tag)
end
