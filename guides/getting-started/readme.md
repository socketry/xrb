## Usage

This guide gives a brief overview of the XRB templating system and how to use it.

## Installation

Add the `xrb` gem to your project:

```shell
$ bundle add xrb
```

## Core Concepts

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
	
	# Called with the full doctype: '<!doctype html>'
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

    rake generate_fallback_parsers && XRB_PREFER_FALLBACK=y rspec

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

To run this with the pure ruby implementation, use `XRB_PREFER_FALLBACK=y sus benchmarks`.

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
