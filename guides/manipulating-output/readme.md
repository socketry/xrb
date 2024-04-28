# Capturing Output

This guide explains how to capture intermediate output during template rendering.

## Core Concepts

- {ruby XRB::Builder} is used to construct safe and efficient Markup output, and handles tag generation, indentation and escaping.
- {ruby XRB::Builder.fragment} saves a block which can then be lazily applied to the output buffer to generate content.
- {ruby XRB::Template.capture} replaces the output buffer temporarily in order to capture the output of a block.

## Fragments

The {ruby XRB::Builder.fragment} lazily captures a block which generates output using a builder. There are two main execution modes - the simplest one is rendering the fragment to a string. However, the more common use case is to apply the fragment to an existing template as it is being rendered.

### Rendering Fragments to Strings

Fragments are lazily evaluated when required. You can force the evaluation of a fragment by calling the `to_s` method. This will construct a builder and apply the block to it, returning the resulting string.

``` ruby
require 'xrb'

fragment = XRB::Builder.fragment do |builder|
  builder.inline 'p' do
    builder.tag 'strong' do
      builder.text 'Hello'
    end
    builder.text ' World'
  end
end

puts fragment.to_s
# => "<p><strong>Hello</strong> World</p>"
```

### Applying Fragments to Templates

Fragments can be applied to a template by using the `>>` operator. This will apply the fragment to the current output buffer of the given block, allowing you to generate content in a more flexible way.

``` ruby
require 'xrb'

buffer = XRB::Buffer(<<~'XRB')
<?r
def bold(&block)
	# Construct a fragment which generates a strong tag around the block:
	XRB::Builder.fragment do |builder|
		builder.inline_tag 'strong' do
			# Yield to the block to generate the content inside the strong tag:
			yield
		end
		# Apply the fragment to the current output buffer:
	end >> block
end

bold do ?>Hello World<?r end ?>
XRB

template = XRB::Template.new(buffer)
puts template.to_string
# => "<strong>Hello World</strong>"
```

## Captures

The {ruby XRB::Template.capture} method captures the output of a block, and returns it as a string. This requires temporarily replacing the output buffer with a new one, which is then used to capture the output of the block. Fragments are more efficient because they apply to the existing output buffer, so you should avoid captures unless you need to modify the actual generated output (as opposed to just appending it).

``` ruby
require 'xrb'

buffer = XRB::Buffer(<<~'XRB')
<?r
def reverse(&block)
	XRB::Builder.fragment do |builder|
		builder.text XRB::Template.capture(&block).reverse
	end >> block
end

reverse do ?>
Hello World
<?r end ?>
XRB

template = XRB::Template.new(buffer)
puts template.to_string
# => "\ndlroW olleH"
```
