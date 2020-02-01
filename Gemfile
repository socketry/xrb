# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in trenni.gemspec
gemspec

group :development do
	gem 'pry'
	gem "rake-compiler"
end

group :test do
	gem 'ruby-prof', platforms: [:mri]
	gem "benchmark-ips"
	
	gem 'covered'
	
	# For comparisons:
	gem "nokogiri"
end
