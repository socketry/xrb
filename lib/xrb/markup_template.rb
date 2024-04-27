# frozen_string_literal: true

require_relative 'template'

module XRB
	class MarkupTemplate < Template
		class Assembler < Template::Assembler
			# Output a string interpolation.
			def expression(code)
				@code << "#{OUT}<<(#{code});"
			end
			
			# Output raw text to the template.
			def text(text)
				text = text.gsub("'", "\\\\'")
				@code << "#{OUT}.raw('#{text}');"
			end
		end
		
		def to_string(scope = Object.new, output = nil)
			super.output
		end
		
		protected
		
		# We need an assembler which builds specific `Markup.append` sequences.
		def make_assembler
			Assembler.new
		end
		
		# The output of the markup template is encoded markup (e.g. with entities, tags, etc).
		def output_buffer
			Builder.new(encoding: code.encoding)
		end
	end
end
