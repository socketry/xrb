# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

group :test do
	gem 'ruby-prof', platforms: [:mri]
	gem "benchmark-ips"
	
	gem "rack"
	
	# For comparisons:
	gem "nokogiri"
end

group :maintenance, optional: true do
	gem "bake-gem"
	gem "bake-modernize"
end
