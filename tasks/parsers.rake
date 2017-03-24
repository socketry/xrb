
PARSERS_DIRECTORY = File.expand_path("parsers", __dir__)
FALLBACK_DIRECTORY = File.expand_path("lib/trenni/fallback", __dir__)
NATIVE_DIRECTORY = File.expand_path("ext/trenni", __dir__)

task :generate_fallback_parsers do
	Dir.chdir(FALLBACK_DIRECTORY) do
		Dir.glob("*.rl").each do |parser_path|
			sh("ragel", "-I", PARSERS_DIRECTORY, "-R", parser_path, "-F1")
		end
		
		sh("ruby-beautify", "--tabs", "--overwrite", *Dir.glob("*.rb"))
	end
end

task :generate_native_parsers do
	Dir.chdir(NATIVE_DIRECTORY) do
		Dir.glob("*.rl").each do |parser_path|
			sh("ragel", "-I", PARSERS_DIRECTORY, "-C", parser_path, "-G2")
		end
	end
end

task :generate_parsers => [:generate_native_parsers, :generate_fallback_parsers, :compile]

task :visualize_parsers do
	Dir.chdir(FALLBACK_DIRECTORY) do
		Dir.glob("*.rl").each do |parser_path|
			dot_path = parser_path + ".dot"
			sh("ragel", "-I", PARSERS_DIRECTORY, "-Vp", parser_path, "-o", dot_path)
			
			pdf_path = parser_path + ".pdf"
			sh("dot", "-Tpdf", "-o", pdf_path, dot_path)
			
			sh("open", pdf_path) rescue nil
		end
	end
end
