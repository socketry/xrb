# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in trenni.gemspec
gemspec

group :test do
	gem 'ruby-prof', platforms: [:mri]
	gem "benchmark-ips"
	
	gem "rack"
	
	# For comparisons:
	gem "nokogiri"
end
