# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trenni/version'

Gem::Specification.new do |gem|
	gem.name          = "trenni"
	gem.version       = Trenni::VERSION
	gem.authors       = ["Samuel Williams"]
	gem.email         = ["samuel.williams@oriontransfer.co.nz"]
	gem.description   = <<-EOF
	Trenni is a templating system that evaluates textual strings containing Ruby
	code. It compiles templates into native Ruby code including string 
	interpolations which means that you generally get the best possible speed.
	
	In addition, Trenni includes an SGML/XML builder to assist with the generation
	of valid nicely formatted markup.
	EOF
	gem.summary       = %q{A fast native templating system that compiles directly to Ruby code.}
	gem.homepage      = "https://github.com/ioquatix/trenni"

	gem.files         = `git ls-files`.split($/)
	gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
	gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
	gem.require_paths = ["lib"]
end
