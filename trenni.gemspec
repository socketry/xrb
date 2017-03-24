# -*- encoding: utf-8 -*-
require_relative 'lib/trenni/version'

Gem::Specification.new do |spec|
	spec.name          = "trenni"
	spec.platform      = Gem::Platform::RUBY
	spec.version       = Trenni::VERSION
	spec.authors       = ["Samuel Williams"]
	spec.email         = ["samuel.williams@oriontransfer.co.nz"]
	spec.description   = <<-EOF
	Trenni is a templating system built on top of SGML/XML. It uses efficient
	native parsers where possible and compiles templates into efficient Ruby.
	
	In addition, Trenni includes an SGML/XML builder to assist with the generation
	of pleasantly formatted markup which is compatible with the included parsers.
	EOF
	spec.summary       = %q{A fast native templating system that compiles directly to Ruby code.}
	spec.homepage      = "https://github.com/ioquatix/trenni"

	spec.files         = `git ls-files`.split($/)
	spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
	spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
	spec.require_paths = ["lib"]
	
	spec.required_ruby_version = '~> 2.1'
	
	spec.extensions = %w[ext/Rakefile]
	spec.add_dependency "rake-compiler"
	
	spec.add_development_dependency "bundler", "~> 1.3"
	spec.add_development_dependency "rspec", "~> 3.4"
	spec.add_development_dependency "rake"
end
