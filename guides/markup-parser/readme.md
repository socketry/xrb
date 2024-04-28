# Markup Parser

This guide explains how to parse and manipulate Markup using the XRB templating system.

## Core Concepts

- {ruby XRB::Parsers} are used to parse Markup, query strings, and templates, based on [ragel](http://www.colm.net/open-source/ragel/).
- The "Markup" syntax is designed to be compatible with XML, HTML5 and fragments of those languages, and is used to generate safe and efficient Markup output.
- Templates generate textual output which generally conforms to the Markup syntax, and can be used in your application or processed further.

### Parsing Markup

The markup parser takes a string buffer and a delegate object, and calls methods on the delegate object as it encounters different parts of the markup. The delegate object can be used to accumulate events or pass them on somewhere else.

``` ruby
require 'xrb'

# Custom entities, or could use XRB::Entities::HTML5
entities = {'amp' => '&', 'lt' => '<', 'gt' => '>', 'quot' => '"'}

class MyDelegate
	# Called when encountering an open tag: `<` name
	def open_tag_begin(name, offset)
		puts "open_tag_begin: #{name}"
	end
	
	# Called when encountering an attribute after open_tag_begin
	def attribute(key, value)
		puts "attribute: #{key} = #{value}"
	end
	
	# Called when encountering the end of the opening tag.
	def open_tag_end(self_closing)
		puts "open_tag_end: #{self_closing}"
	end
	
	# Called when encountering the closing tag: '</' name '>'
	def close_tag(name, offset)
		puts "close_tag: #{name}"
	end
	
	# Called with the full doctype: '<!doctype html>'
	def doctype(string)
		puts "doctype: #{string}"
	end
	
	# Called with the full comment: '<!-- comment -->'
	def comment(string)
		puts "comment: #{string}"
	end
	
	# Called with the parsed instruction: '<?' identifier space+ body '?>'
	def instruction(string)
		puts "instruction: #{string}"
	end
	
	# Called with a cdata block: '<![CDATA[text]]>'
	def cdata(string)
		puts "cdata: #{string}"
	end
	
	# Called with any arbitrary pcdata text (e.g. between tags).
	def text(string)
		puts "text: #{string}"
	end
end

# Parse the buffer which will call methods on the delegate object.
buffer = XRB::Buffer("<p style='color: red'>Hello, World!</p>")
XRB::Parsers.parse_markup(buffer, MyDelegate.new, entities)
# => open_tag_begin: p
# => attribute: style = color: red
# => open_tag_end: false
# => text: Hello, World!
# => close_tag: p
```

### Namespaces

Using namespaces to control how Markup is transformed is a powerful feature of the XRB templating system. Namespaces can be used to define custom tags, attributes, and entities, and can be used to control how the parser processes the input.

``` ruby
# Following from the above example...

buffer = XRB::Buffer("<my:paragraph>Hello, World!</my:paragraph>")
XRB::Parsers.parse_markup(buffer, MyDelegate.new, entities)

# => open_tag_begin: my:paragraph
# => open_tag_end: false
# => text: Hello, World!
# => close_tag: my:paragraph
```

In your delegate class, you can extract namespaces from the tag name and use them to control how the parser processes the input. e.g.

``` ruby
class MyDelegate
	def open_tag_begin(name, offset)
		namespace, name = name.split(':', 2)
		if namespace == 'my'
			# Handle custom tag
		else
			# Handle standard tag
		end
	end
end
```
