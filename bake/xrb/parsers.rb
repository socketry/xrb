# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2017-2024, by Samuel Williams.

# Generate the pure Ruby parsers.
def generate_fallback
	pattern = File.join(fallback_directory, "*.rl")
	
	Dir.glob(pattern, base: context.root).each do |parser_path|
		system("ragel", "-I", parsers_directory, "-R", parser_path, "-F1", chdir: context.root)
	end
end

# Generate the native C parsers.
def generate_native
	pattern = File.join(native_directory, "*.rl")
	
	Dir.glob(pattern, base: context.root).each do |parser_path|
		system("ragel", "-I", parsers_directory, "-C", parser_path, "-G2", chdir: context.root)
	end
end

# Generate the parsers and compile them as required.
def generate
	self.generate_native
	self.generate_fallback
end

# Generate a visualisation of the parsers.
def visualize_parsers
	Dir.chdir(fallback_directory) do
		Dir.glob("*.rl").each do |parser_path|
			dot_path = parser_path + ".dot"
			system("ragel", "-I", parsers_directory, "-Vp", parser_path, "-o", dot_path)
			
			pdf_path = parser_path + ".pdf"
			system("dot", "-Tpdf", "-o", pdf_path, dot_path)
			
			system("open", pdf_path) rescue nil
		end
	end
end

private

def parsers_directory
	"parsers"
end

def fallback_directory
	"lib/xrb/fallback"
end

def extensions_directory
	"ext"
end

def native_directory
	"ext/xrb"
end

def system(*arguments, **options)
	Console.info(self, arguments: arguments, options: options)
	super
end
