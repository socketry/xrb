# XRB

XRB is a templating system built loosely on top of XHTML markup. It uses efficient native parsers where possible and compiles templates into efficient Ruby. It also includes a markup builder to assist with the generation of pleasantly formatted markup which is compatible with the included parsers.

[![Development Status](https://github.com/socketry/xrb/workflows/Test/badge.svg)](https://github.com/socketry/xrb/actions?workflow=Test)

``` xrb
<h1>XRB Examples</h1>

<ul>
	<li>XRB uses normal string interpolation syntax: #{"Hello World"}</li>

	<?r if true ?>
	<li>XRB also adopts standard #{"<?r ... ?>"} script tags</li>
	<?r end ?>
	
	<!-- That's all of the syntax! -->
<ul>
```

Generates:

``` xml
<h1>XRB Examples</h1>

<ul>
	<li>XRB uses normal string interpolation syntax: Hello World</li>

	<li>XRB also adopts standard &lt;?r ... ?&gt; script tags</li>
	
	<!-- That's all of the syntax! -->
<ul>
```

## Is it fast?

Yes. XRB is designed to be fast. It uses a combination of efficient native parsers and Ruby code generation to ensure that templates are compiled into efficient Ruby code. This means that XRB is suitable for use in high performance applications. In comparison to `ERB`, it is generally about 10x faster.

## Usage

Please see the [project documentation](https://socketry.github.io/xrb/) for more details.

  - [Getting Started](https://socketry.github.io/xrb/guides/getting-started/index) - This guide gives a brief overview of the XRB templating system and how to use it.

  - [Capturing Output](https://socketry.github.io/xrb/guides/capturing-output/index) - This guide explains how to capture intermediate output during template rendering.

  - [Markup Parser](https://socketry.github.io/xrb/guides/markup-parser/index) - This guide explains how to parse and manipulate Markup using the XRB templating system.

## See Also

  - [xrb-sanitize](https://github.com/socketry/xrb-sanitize) - A stream-based HTML sanitizer for XRB, based on the XRB Markup parser.
  - [xrb-vscode](https://github.com/socketry/xrb-vscode) - A syntax highlighting package for Visual Studio Code.
  - [trenni](https://github.com/ioquatix/trenni) - The original templating system which XRB is based on.

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
