# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2021-2024, by Samuel Williams.
# Copyright, 2024, by Pavel Rosický.

def build
	ext_path = File.expand_path("ext", __dir__)
	
	Dir.chdir(ext_path) do
		system("ruby ./extconf.rb")
		system("make")
	end
end

def clean
	ext_path = File.expand_path("ext", __dir__)
	
	Dir.chdir(ext_path) do
		system("make clean")
	end
end
