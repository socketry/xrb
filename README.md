# Trenni

Trenni is a templating system that evaluates textual strings containing Ruby
code. It compiles templates into native Ruby code including string 
interpolations which means that you generally get the best possible speed.
	
In addition, Trenni includes an SGML/XML builder to assist with the generation
of valid nicely formatted markup.

## Installation

Add this line to your application's Gemfile:

    gem 'trenni'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trenni

## Usage

Trenni templates work essentially the same way as all other templating systems:

	template = Trenni::Template.new('<?r items.each do |item| ?>#{item}<?r end ?>')
	
	items = 1..4
	
	assert_equal "1234", template.result(binding)

The code above demonstraights the only two constructs, `<?r expression ?>` and `#{output}`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
