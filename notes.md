```
bundle exec bake xrb:parsers:generate_native build; bundle exec bake template test.xrb

ragel -I ../../parsers -V template.rl -p -M main | dot -Tpdf -o template.pdf
```