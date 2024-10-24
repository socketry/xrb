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
