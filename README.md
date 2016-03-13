# Trenni

Trenni is a templating system that evaluates textual strings containing Ruby
code. It compiles templates directly into native code which means that you
generally get the best possible performance.

In addition, Trenni includes an SGML/XML builder to assist with the generation
of pleasantly formatted markup.

[![Build Status](https://secure.travis-ci.org/ioquatix/trenni.svg)](http://travis-ci.org/ioquatix/trenni)
[![Code Climate](https://codeclimate.com/github/ioquatix/trenni.svg)](https://codeclimate.com/github/ioquatix/trenni)
[![Coverage Status](https://coveralls.io/repos/ioquatix/trenni/badge.svg)](https://coveralls.io/r/ioquatix/trenni)

## Motivation

Trenni was designed for [Utopia](https://github.com/ioquatix/utopia). When I originally looked at template engines, I was surprised by the level of complexity and the effort involved in processing a template to produce useful output. In particular, many template engines generate an AST and walk over it to generate output (e.g. ERB, at least at the time I last checked). This is exceedingly slow in Ruby.

At the time (around 2008?) I was playing around with [ramaze](https://github.com/Ramaze/ramaze) and found a template engine I really liked the design of, called [ezamar](https://github.com/manveru/ezamar). The template compilation process actually generates Ruby code which can then be compiled and executed efficiently. Another engine, by the same author, [nagoro](https://github.com/manveru/nagoro), also provided some inspiration.

More recently I was doing some investigation regarding using `eval` for executing the code. The problem is that it's [not possible to replace the binding](http://stackoverflow.com/questions/27391909/replace-evalcode-string-binding-with-lambda/27392437) of a `Proc` once it's created, so template engines that evaluate code in a given binding cannot use a compiled proc, they must parse the code every time. By using a `Proc` we can generate a Ruby function which *can* be compiled to a faster representation by the VM.

In addition, I wanted a simple parser and builder for HTML style markup. These are used heavily by Utopia for implementing it's tag based evaluation. The (event based) `Trenni::Parser` is designed so that some day it could be easily written in C. `Trenni::Builder` is a simple and efficient way to generate markup, it's not particularly notable, except that it doesn't use `method_missing` to [implement normal behaviour](https://github.com/sparklemotion/nokogiri/blob/b6679e928924529b56dcc0f3164224c040d14555/lib/nokogiri/xml/builder.rb#L355) which is [sort of slow](http://franck.verrot.fr/blog/2015/07/12/benchmarking-ruby-method-missing-and-define-method/).

## Installation

Add this line to your application's Gemfile:

	gem 'trenni'

And then execute:

	$ bundle

Or install it yourself as:

	$ gem install trenni

## Usage

### Templates

Trenni templates work essentially the same way as all other templating systems:

	buffer = Trenni::Buffer.new('<?r items.each do |item| ?>#{item}<?r end ?>')
	template = Trenni::Template.new(buffer)
		
	items = 1..4
		
	template.to_string(binding) # => "1234"
	
The code above demonstrate the only two constructs, `<?r expression ?>` and `#{output}`.

Trenni provides a slightly higher performance API using objects rather than bindings. If you provide an object instance, `instance_eval` would be used instead.

### Builder

Trenni can help construct XML/HTML using a simple DSL:

	Trenni::Builder.fragment do |builder|
		builder.inline 'p' do
			builder.tag 'strong' do
				builder.text 'Hello'
			end
			builder.text ' World'
		end
		builder.tag 'script', type: 'text/html' do
			builder.text 'console.log("Hello World")'
		end
	end
	# => "<p><strong>Hello</strong> World</p>\n<script type=\"text/html\">\n\tconsole.log(\"Hello World\")\n</script>"

### Integration

There is a [language-trenni](https://atom.io/packages/language-trenni) package for the [Atom text editor](https://atom.io). It provides syntax highlighting and integration when Trenni is used with the [utopia web framework](https://github.com/ioquatix/utopia).

[Trenni Formatters](https://github.com/ioquatix/trenni-formatters) is a separate gem that uses `Trenni::Builder` to generate HTML forms easily.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Released under the MIT license.

Copyright, 2012, 2016, by [Samuel G. D. Williams](http://www.codeotaku.com/samuel-williams).

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.