# Getting Started

This guide gives a brief overview of the XRB templating system and how to use it.

## Installation

Add the gem to your project:

```shell
$ bundle add xrb
```

## Core Concepts

XRB is a template language which adopts a Ruby-native approach to string interpolations, and a XML-native approach to Processing Instructions (Ruby code). The template language is designed to operate within the domain of XML, HTML and fragments of those languages, so natively supports a strict subset of HTML5 Markup. Therefore, XRB will safely escape your output by default, and will catch a large number of semantic issues, e.g. missing closing tags, and so on.

- A {ruby XRB::Template} is the main entry point for rendering templates. It can generate textual output which you can use in your application or process further.
- A {ruby XRB::Buffer} is a string buffer which is used to manage the input and output of the template system.
- A {ruby XRB::Builder} is a DSL for constructing Markup strings.
- A set of {ruby XRB::Parsers} which can efficiently and parse Markup, query strings, and templates, based on [ragel](http://www.colm.net/open-source/ragel/).

## Usage

The most common use case is to render a template with some data:

``` ruby
require 'xrb'

buffer = XRB::Buffer('<?r self.each do |item| ?>#{item}<?r end ?>')
template = XRB::Template.new(buffer)
items = 1..4

template.to_string(items)
# => "1234"
```

The code above demonstrates the only two constructs, `<?r expression ?>` and `#{output}`.

### Providing Inputs

The `to_string` method accepts a single argument, which is the context in which the template is evaluated using `instance_eval`. This can be any object, including a binding. However, using a binding is slower than using an object and can also reduces the isolation of the template from the rest of the application.

#### Using a Object

``` ruby
require 'xrb'

Person = Struct.new(:name, :age)
Controller = Struct.new(:people)
controller = Controller.new([Person.new('Alice', 30), Person.new('Bob', 40)])

buffer = XRB::Buffer('<?r self.people.each do |person| ?>#{person.name} is #{person.age} years old.<br/><?r end ?>')
template = XRB::Template.new(buffer)

template.to_string(controller)
# => "Alice is 30 years old.<br/>Bob is 40 years old.<br/>"
```

#### Using a Binding

``` ruby
require 'xrb'

Person = Struct.new(:name, :age)
Controller = Struct.new(:people)
def people
	[Person.new('Alice', 30), Person.new('Bob', 40)]
end

buffer = XRB::Buffer('<?r self.people.each do |person| ?>#{person.name} is #{person.age} years old.<br/><?r end ?>')
template = XRB::Template.new(buffer)

template.to_string(binding)
# => "Alice is 30 years old.<br/>Bob is 40 years old.<br/>"
```
