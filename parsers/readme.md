# Parsers

The parsers defined here are the formal specification of the XRB language.

## Template Parser Notes

To compile the native template parser and compile a template, printing it's output code:

```
bundle exec bake xrb:parsers:generate_native build; bundle exec bake template test.xrb
```

## Template Parser Graph

Generates a PDF of the template parser graph:

```
ragel -I ../../parsers -V template.rl -p -M main | dot -Tpdf -o template.pdf
```
