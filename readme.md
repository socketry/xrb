# XRB

XRB is a templating system built loosely on top of XHTML markup. It uses efficient native parsers where possible and compiles templates into efficient Ruby. It also includes a markup builder to assist with the generation of pleasantly formatted markup which is compatible with the included parsers.

[![Development Status](https://github.com/ioquatix/trenni/workflows/Test/badge.svg)](https://github.com/ioquatix/trenni/actions?workflow=Test)

## Motivation

XRB was designed for [Utopia](https://github.com/ioquatix/utopia). When I originally looked at template engines, I was surprised by the level of complexity and the effort involved in processing a template to produce useful output. In particular, many template engines generate an AST and walk over it to generate output (e.g. ERB, at least at the time I last checked). This is exceedingly slow in Ruby.

At the time (around 2008?) I was playing around with [ramaze](https://github.com/Ramaze/ramaze) and found a template engine I really liked the design of, called [ezamar](https://github.com/manveru/ezamar). The template compilation process actually generates Ruby code which can then be compiled and executed efficiently. Another engine, by the same author, [nagoro](https://github.com/manveru/nagoro), also provided some inspiration.

More recently I was doing some investigation regarding using `eval` for executing the code. The problem is that it's [not possible to replace the binding](http://stackoverflow.com/questions/27391909/replace-evalcode-string-binding-with-lambda/27392437) of a `Proc` once it's created, so template engines that evaluate code in a given binding cannot use a compiled proc, they must parse the code every time. By using a `Proc` we can generate a Ruby function which *can* be compiled to a faster representation by the VM.

In addition, I wanted a simple markup parser and builder for HTML style markup. These are used heavily by Utopia for implementing it's tag based evaluation. `XRB::Builder` is a simple and efficient way to generate markup, it's not particularly notable, except that it doesn't use `method_missing` to [implement normal behaviour](https://github.com/sparklemotion/nokogiri/blob/b6679e928924529b56dcc0f3164224c040d14555/lib/nokogiri/xml/builder.rb#L355) which is [sort of slow](http://franck.verrot.fr/blog/2015/07/12/benchmarking-ruby-method-missing-and-define-method/).

The 2nd release of XRB in 2016 saw an overhaul of the internal parsers. I used [Ragel](http://www.colm.net/open-source/ragel/) to implement efficient event-based markup and template parsers, which can be compiled to both C and Ruby. This provides a native code path where possible giving speed-ups between 10x - 20x. In addition, the formal grammar is more robust.

The 3rd release of XRB in 2017 was primarily focused on performance, by moving more of the critical parsing, escaping and tag generation functions to C. In practical usage, this gave about a 40-50% improvement in performance overall.

## Is it fast?

It's faster than Nokogiri for parsing markup:

    XRB::Native
    Warming up --------------------------------------
          Large (XRB)    71.000  i/100ms
        Large (Nokogiri)    28.000  i/100ms
    Calculating -------------------------------------
          Large (XRB)    662.050  (± 3.9%) i/s -      3.337k in   5.048115s
        Large (Nokogiri)    266.878  (±10.9%) i/s -      1.316k in   5.008464s
    
    Comparison:
          Large (XRB):      662.1 i/s
        Large (Nokogiri):      266.9 i/s - 2.48x slower

It's significantly faster than ERB:

    XRB::Template
    Warming up --------------------------------------
         XRB (object)    75.667k i/100ms
           ERB (binding)     6.940k i/100ms
    Calculating -------------------------------------
         XRB (object)      1.095M (± 7.9%) i/s -      5.448M in   5.007244s
           ERB (binding)     69.381k (± 7.1%) i/s -    347.000k in   5.027333s
    
    Comparison:
         XRB (object):  1094979.9 i/s
           ERB (binding):    69381.1 i/s - 15.78x  slower

## Installation

Add this line to your application's Gemfile:

    gem 'xrb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xrb

## Usage

### Markup Parser

The markup parser parses a loose super-set of HTML in a way that's useful for content processing, similar to an XSLT processor. It's designed to be faster and easier to use, and integrate directly into an output pipeline.

To invoke the markup parser:

``` ruby
require 'xrb'

buffer = XRB::Buffer(string)

# Custom entities, or could use XRB::Entities::HTML5
entities = {'amp' => '&', 'lt' => '<', 'gt' => '>', 'quot' => '"'}

# Modify this class to accumulate events or pass them on somewhere else.
class Delegate
	# Called when encountering an open tag: `<` name
	def open_tag_begin(name, offset)
	end
	
	# Called when encountering an attribute after open_tag_begin
	def attribute(key, value)
	end
	
	# Called when encountering the end of the opening tag.
	def open_tag_end(self_closing)
	end
	
	# Called when encountering the closing tag: '</' name '>'
	def close_tag(name, offset)
	end
	
	# Called with the full doctype: '<!DOCTYPE html>'
	def doctype(string)
	end
	
	# Called with the full comment: '<!-- comment -->'
	def comment(string)
	end
	
	# Called with the parsed instruction: '<?' identifier space+ body '?>'
	def instruction(string)
	end
	
	# Called with a cdata block: '<![CDATA[text]]>'
	def cdata(string)
	end
	
	# Called with any arbitrary pcdata text (e.g. between tags).
	def text(string)
	end
end

# Do the actual work:
XRB::Parsers.parse_markup(buffer, Delegate.new, entities)
```

### Templates

XRB templates work essentially the same way as all other templating systems:

``` ruby
buffer = XRB::Buffer('<?r self.each do |item| ?>#{item}<?r end ?>')
template = XRB::Template.new(buffer)
	
items = 1..4
	
template.to_string(items) # => "1234"
```

The code above demonstrate the only two constructs, `<?r expression ?>` and `#{output}`.

XRB doesn't support using `binding` for evaluation, as this is a slow code path. It uses `instance_exec`

### Builder

XRB can help construct XML/HTML using a simple DSL:

``` ruby
XRB::Builder.fragment do |builder|
	builder.inline 'p' do
		builder.tag 'strong' do
			builder.text 'Hello'
		end
		builder.text ' World'
	end
end.to_s
# => "<p><strong>Hello</strong> World</p>"
```

### Testing

To test the Ruby parsers:

    rake generate_fallback_parsers && TRENNI_PREFER_FALLBACK=y rspec

To test the native C parsers:

    rake generate_native_parsers && rake compile && rspec

### Benchmarks

XRB has a pure Ruby implemenation, with performance critical operations implemented natively. All critical code paths have benchmark specs.

#### Parser Performance

You can evaluate and compare template performance with ERB:

    rspec spec/xrb/parsers_performance_spec.rb
    
    XRB::Native
      #parse_markup
    Warming up --------------------------------------
          Large (XRB)    64.000  i/100ms
        Large (Nokogiri)    30.000  i/100ms
    Calculating -------------------------------------
          Large (XRB)    637.720  (± 6.4%) i/s -      3.200k in   5.038187s
        Large (Nokogiri)    294.762  (± 5.8%) i/s -      1.470k in   5.004284s
    
    Comparison:
          Large (XRB):      637.7 i/s
        Large (Nokogiri):      294.8 i/s - 2.16x  slower
    
        should be fast to parse large documents
      #parse_template
    Warming up --------------------------------------
          Large (XRB)     7.791k i/100ms
             Large (ERB)   488.000  i/100ms
    Calculating -------------------------------------
          Large (XRB)     87.889k (± 9.5%) i/s -    436.296k in   5.024283s
             Large (ERB)      4.844k (± 5.6%) i/s -     24.400k in   5.053247s
    
    Comparison:
          Large (XRB):    87889.4 i/s
             Large (ERB):     4844.5 i/s - 18.14x  slower
    
        should have better performance using instance
    
    Finished in 28.2 seconds (files took 0.14204 seconds to load)
    2 examples, 0 failures

To run this with the pure ruby implementation, use `TRENNI_PREFER_FALLBACK=y rspec spec/xrb/parsers_performance_spec.rb`.

#### Markup String Performance

Markup safe strings require escaping characters. Doing this natively makes sense, and in MRI, `CGI.escape_html` is implemented in C. Strings that include characters that need to be escaped are a bit slower because a new string must be allocated and modified. So, we test these two cases.

    rspec spec/xrb/markup_performance_spec.rb 
    
    XRB::Markup
    Warming up --------------------------------------
          General String   179.396k i/100ms
             Code String    85.050k i/100ms
    Calculating -------------------------------------
          General String      4.773M (±10.0%) i/s -     23.680M in   5.027576s
             Code String      1.469M (± 5.7%) i/s -      7.399M in   5.052467s
    
    Comparison:
          General String:  4773201.3 i/s
             Code String:  1469345.5 i/s - 3.25x  slower
    
      should be fast to parse large documents
    
    Finished in 14.11 seconds (files took 0.09696 seconds to load)
    1 example, 0 failures

#### Template Evaluation Performance

Evaluating templates and generating output is critical to performance. You can compare XRB with ERB. The primary factor affecting performance, is the number of interpolations, because each interpolation requires evaluation and concatenation.

    rspec spec/xrb/template_performance_spec.rb 
    
    XRB::Template
    Warming up --------------------------------------
                  XRB    79.000  i/100ms
    Calculating -------------------------------------
                  XRB    817.703  (± 7.7%) i/s -      4.108k in   5.071586s
      should be fast for lots of interpolations
    Warming up --------------------------------------
         XRB (object)    79.149k i/100ms
           ERB (binding)     5.416k i/100ms
    Calculating -------------------------------------
         XRB (object)      1.081M (± 3.7%) i/s -      5.461M in   5.059151s
           ERB (binding)     59.016k (± 4.7%) i/s -    297.880k in   5.058614s
    
    Comparison:
         XRB (object):  1080909.2 i/s
           ERB (binding):    59016.3 i/s - 18.32x  slower
    
      should be fast for basic templates
    Warming up --------------------------------------
                  XRB    34.204k i/100ms
    Calculating -------------------------------------
                  XRB    407.905k (± 9.0%) i/s -      2.018M in   5.001248s
      should be fast with capture
    
    Finished in 28.25 seconds (files took 0.09765 seconds to load)
    3 examples, 0 failures

## See Also

  - [language-xrb](https://atom.io/packages/language-xrb) package for the [Atom text editor](https://atom.io). It provides syntax highlighting and integration when XRB is used with the [utopia web framework](https://github.com/ioquatix/utopia).

  - [vim-xrb](https://github.com/huba/vim-xrb) package for Vim.

  - [XRB Formatters](https://github.com/ioquatix/xrb-formatters) is a separate gem that uses `XRB::Builder` to generate HTML forms easily.

## Contributing

We welcome contributions to this project.

1.  Fork it.
2.  Create your feature branch (`git checkout -b my-new-feature`).
3.  Commit your changes (`git commit -am 'Add some feature'`).
4.  Push to the branch (`git push origin my-new-feature`).
5.  Create new Pull Request.

### Developer Certificate of Origin

This project uses the [Developer Certificate of Origin](https://developercertificate.org/). All contributors to this project must agree to this document to have their contributions accepted.

### Contributor Covenant

This project is governed by the [Contributor Covenant](https://www.contributor-covenant.org/). All contributors and participants agree to abide by its terms.
