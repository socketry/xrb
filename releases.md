# Releases

## Unreleased

### URL References

**Breaking:** XRB no longer provides the `XRB::Reference` class or the `XRB::Reference(...)` factory method. Use `Protocol::URL::Reference` from the `protocol-url` gem instead.

Add `gem "protocol-url"` to your application dependencies and replace `require "xrb/reference"` with `require "protocol/url"`.

Replace `XRB::Reference(path, **parameters)` with:

```ruby
reference = Protocol::URL::Reference.parse(path)
reference.parse_query!.update(parameters)
```

This preserves the previous behavior of parsing existing query parameters before updating them with the supplied parameters.

Replace direct `XRB::Reference.new(path, parameters, fragment: fragment)` calls with `Protocol::URL::Reference.new(path, nil, fragment, parameters)`.

`protocol-url` treats path strings as already encoded URL paths. When starting with decoded path components, encode them explicitly with `Protocol::URL::Path.for(components)`.
