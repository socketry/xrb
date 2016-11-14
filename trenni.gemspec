# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trenni/version'

Gem::Specification.new do |spec|
	spec.name          = "trenni"
	spec.version       = Trenni::VERSION
	spec.authors       = ["Samuel Williams"]
	spec.email         = ["samuel.williams@oriontransfer.co.nz"]
	spec.description   = <<-EOF
	Trenni is a templating system that evaluates textual strings containing Ruby
	code. It compiles templates directly into native code which means that you
	generally get the best possible performance.

	In addition, Trenni includes an SGML/XML builder to assist with the generation
	of pleasantly formatted markup.
	EOF
	spec.summary       = %q{A fast native templating system that compiles directly to Ruby code.}
	spec.homepage      = "https://github.com/ioquatix/trenni"

	spec.files         = `git ls-files`.split($/)
	spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
	spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
	spec.require_paths = ["lib"]
	
	spec.required_ruby_version = '~> 2.1'
	
	spec.add_development_dependency "bundler", "~> 1.3"
	spec.add_development_dependency "rspec", "~> 3.4.0"
	spec.add_development_dependency "rake"
end
