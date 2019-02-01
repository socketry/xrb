source 'https://rubygems.org'

# Specify your gem's dependencies in trenni.gemspec
gemspec

group :development do
	gem 'pry'
	gem "rake-compiler"
	gem "ruby-beautify"
end

group :test do
	gem 'ruby-prof', platforms: [:mri]
	gem "benchmark-ips"
	
	gem 'simplecov'
	gem 'coveralls', require: false
	
	# For comparisons:
	gem "nokogiri"
end
