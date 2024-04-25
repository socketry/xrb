# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2012-2024, by Samuel Williams.

require_relative 'parsers'
require_relative 'markup'
require_relative 'buffer'
require_relative 'builder'

module XRB
	# The output variable that will be used in templates:
	OUT = :_out
	BINDING = binding
	
	class Builder
		def capture(*arguments, &block)
			Template.capture(*arguments, output: self, &block)
		end
	end
	
	class Template
		# Returns the output produced by calling the given block.
		def self.capture(*arguments, output: nil, &block)
			scope = block.binding
			previous_output = scope.local_variable_get(OUT)
			
			output ||= previous_output.class.new(encoding: previous_output.encoding)
			scope.local_variable_set(OUT, output)
			
			begin
				block.call(*arguments)
			ensure
				scope.local_variable_set(OUT, previous_output)
			end
			
			return output
		end
		
		# Returns the buffer used for capturing output.
		def self.buffer(binding)
			binding.local_variable_get(OUT)
		end
		
		class Assembler
			def initialize(encoding: Encoding::UTF_8)
				@code = String.new.force_encoding(encoding)
			end

			attr :code

			# Output raw text to the template.
			def text(text)
				text = text.gsub("'", "\\\\'")
				@code << "#{OUT}<<'#{text}';"
				
				# This is an interesting approach, but it doens't preserve newlines or tabs as raw characters, so template line numbers don't match up.
				# @parts << "#{OUT}<<#{text.dump};"
			end

			# Output a ruby expression (or part of).
			def instruction(text, postfix = nil)
				@code << text << (postfix || ';')
			end
			
			# Output a string interpolation.
			def expression(text)
				# Double brackets are required here to handle expressions like #{foo rescue "bar"}.
				@code << "#{OUT}<<String(#{text});"
			end
		end
		
		def self.load_file(path, **options)
			self.new(FileBuffer.new(path), **options).freeze
		end
		
		def self.load(string, *arguments, **options)
			self.new(Buffer.new(string), **options).freeze
		end
		
		# @param binding [Binding] The binding in which the template is compiled. e.g. `TOPLEVEL_BINDING`.
		def initialize(buffer, binding: BINDING)
			@buffer = buffer
			@binding = binding
		end
		
		def freeze
			return self if frozen?
			
			to_proc
			
			super
		end
		
		def to_string(scope = Object.new, output = nil)
			output ||= output_buffer
			
			scope.instance_exec(output, &to_proc)
			
			return output
		end
		
		def to_buffer(scope)
			Buffer.new(to_string(scope), path: @buffer.path)
		end
		
		def to_proc(scope = @binding.dup)
			@compiled_proc ||= eval("\# frozen_string_literal: true\nproc{|#{OUT}|;#{code}}", scope, @buffer.path, 0).freeze
		end
		
		protected
		
		def output_buffer
			String.new.force_encoding(code.encoding)
		end
		
		def code
			@code ||= compile!
		end
		
		def make_assembler
			Assembler.new
		end
		
		def compile!
			assembler = make_assembler
			
			Parsers.parse_template(@buffer, assembler)
			
			assembler.code
		end
	end
	
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
