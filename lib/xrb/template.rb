# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2012-2024, by Samuel Williams.

require_relative "parsers"
require_relative "markup"
require_relative "buffer"
require_relative "builder"

module XRB
	# The output variable that will be used in templates:
	OUT = :_out
	
	# The default binding to use when compiling templates.
	BINDING = binding
	
	class Builder
		def capture(*arguments, &block)
			Template.capture(*arguments, output: self, &block)
		end
	end
	
	# An evaluatable text-format that can be used to generate output.
	class Template
		# Capture the output of a block from within a template.
		# @returns [String] the output produced by calling the given block.
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
			
			return output.to_str
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
			# Raw text should be escaped, e.g. it can't contain tags or other special characters.
			def text(text)
				# We have to use an approach which preserves newlines and tabs as raw characters.
				text = text.gsub("'", "\\\\'")
				@code << "#{OUT}.raw('#{text}');"
			end

			# Output a ruby expression (or part of).
			def instruction(text, postfix = nil)
				@code << text << (postfix || ";")
			end
			
			# Output a string interpolation.
			def expression(code)
				@code << "#{OUT}<<(#{code});"
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
			
			@compiled = nil
		end
		
		def freeze
			return self if frozen?
			
			compiled
			
			super
		end
		
		def code
			@code ||= compile!
		end
		
		def compiled(scope = @binding.dup)
			@compiled ||= eval("\# frozen_string_literal: true\nproc{|#{OUT}|;#{code}}", scope, @buffer.path, 0).freeze
		end
		
		def to_string(scope = Object.new, output = nil)
			builder = Builder.new(output, encoding: code.encoding)
			
			scope.instance_exec(builder, &compiled)
			
			return builder.output
		end
		
		def to_buffer(scope)
			Buffer.new(to_string(scope), path: @buffer.path)
		end
		
		def to_proc(scope = @binding.dup)
			proc do |output|
				to_string(scope, output)
			end
		end
		
		protected
		
		def make_assembler
			Assembler.new
		end
		
		def compile!
			assembler = make_assembler
			
			Parsers.parse_template(@buffer, assembler)
			
			assembler.code
		end
	end
end
