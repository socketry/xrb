# frozen_string_literal: true

# Generate the pure Ruby parsers.
def generate_fallback
	Dir.chdir(fallback_directory) do
		Dir.glob("*.rl").each do |parser_path|
			system("ragel", "-I", parsers_directory, "-R", parser_path, "-F1")
		end
		
		# sh("ruby-beautify", "--tabs", "--overwrite", *Dir.glob("*.rb"))
	end
end

# Generate the native C parsers.
def generate_native
	Dir.chdir(native_directory) do
		Dir.glob("*.rl").each do |parser_path|
			system("ragel", "-I", parsers_directory, "-C", parser_path, "-G2")
		end
	end
end

# Compile the C extension.
def compile
	system("rake", "compile", chdir: extensions_directory)
end

# Generate the parsers and compile them as required.
def generate
	self.generate_native
	self.generate_fallback
	self.compile
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
	File.expand_path("parsers", context.root)
end

def fallback_directory
	File.expand_path("lib/trenni/fallback", context.root)
end

def extensions_directory
	File.expand_path("ext", context.root)
end

def native_directory
	File.expand_path("ext/trenni", context.root)
end
