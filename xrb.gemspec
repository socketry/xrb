# frozen_string_literal: true

require_relative "lib/xrb/version"

Gem::Specification.new do |spec|
	spec.name = "xrb"
	spec.version = XRB::VERSION
	
	spec.summary = "A fast native templating system that compiles directly to Ruby code."
	spec.authors = ["Samuel Williams", "Adam Daniels", "Cyril Roelandt"]
	spec.license = "MIT"
	
	spec.cert_chain  = ['release.cert']
	spec.signing_key = File.expand_path('~/.gem/release.pem')
	
	spec.homepage = "https://github.com/ioquatix/xrb"
	
	spec.metadata = {
		"documentation_uri" => "https://socketry.github.io/xrb/",
		"funding_uri" => "https://github.com/sponsors/ioquatix",
		"source_code_uri" => "https://github.com/ioquatix/xrb.git",
	}
	
	spec.files = Dir.glob(['{bake,ext,lib,parsers}/**/*', '*.md'], File::FNM_DOTMATCH, base: __dir__)
	spec.require_paths = ['lib']
	
	spec.extensions = ["ext/xrb/extconf.rb"]
	
	spec.required_ruby_version = ">= 3.1"
end
