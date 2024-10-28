# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2012-2024, by Samuel Williams.

require_relative "markup"
require_relative "tag"

module XRB
	# Build markup quickly and efficiently.
	class Builder
		INDENT = "\t"
		
		class Fragment
			def initialize(block)
				@block = block
				@builder = nil
			end
			
			def append_markup(output)
				builder = Builder.new(output)
				
				self.build_markup(builder)
				
				return builder.output
			end
			
			def build_markup(builder)
				@block.call(builder)
			end
			
			def to_s
				self.append_markup(nil)
			end
			
			def == other
				# This is a bit of a hack... but is required for existing specs to pass:
				self.to_s == other.to_s
			end
			
			def >> block
				if block
					Template.buffer(block.binding) << self
					
					return nil
				else
					return self
				end
			end
		end
		
		# A helper to generate fragments of markup.
		def self.fragment(output = nil, &block)
			if output.is_a?(Binding)
				output = Template.buffer(output)
			end
			
			if output.nil?
				return Fragment.new(block)
			end
			
			block.call(output)
			
			# We explicitly return nil here as we don't want to append the output twice.
			return nil
		end
		
		def self.tag(name, content, **attributes)
			self.fragment do |builder|
				builder.inline(name, attributes) do
					builder.text(content)
				end
			end
		end
		
		def initialize(output = nil, indent: true, encoding: Encoding::UTF_8)
			# This field gets togged in #inline so we keep track of it separately from @indentation.
			@indent = indent
			
			# We don't need to use MarkupString here as Builder itself is considered markup and should be inserted directly into the output stream.
			@output = output || MarkupString.new.force_encoding(encoding)
			
			@level = [0]
			@children = [0]
		end
		
		def build_markup(builder)
			builder.append(@output)
		end
		
		attr :output
		
		def encoding
			@output.encoding
		end
		
		# Required for output to buffer.
		def to_str
			@output
		end
		
		alias to_s to_str
		
		def == other
			@output == String(other)
		end
		
		def indentation
			if @indent
				INDENT * (@level.size - 1)
			else
				""
			end
		end
		
		def doctype(attributes = "html")
			@output << "<!doctype #{attributes}>\n"
		end
		
		# Begin a block tag.
		def tag(name, attributes = {}, &block)
			full_tag(name, attributes, @indent, @indent, &block)
		end
		
		# Begin an inline tag.
		def inline_tag(name, attributes = {}, &block)
			original_indent = @indent
			
			full_tag(name, attributes, @indent, false) do
				@indent = false
				yield if block_given?
			end
		ensure
			@indent = original_indent
		end
		
		alias inline inline_tag
		
		def inline!
			original_indent = @indent
			@indent = false
			
			yield
		ensure
			@indent = original_indent
		end
		
		def text(content)
			return unless content
			
			if @indent
				@output << "\n" if @level.last > 0
				@output << indentation
			end
			
			content.build_markup(self)
			
			if @indent
				@output << "\n"
			end
		end
		
		def raw(content)
			@output << content
		end
		
		def <<(content)
			content&.build_markup(self)
		end
		
		# Append pre-existing markup:
		def append(value)
			return unless value
			
			# The parent has one more child:
			@level[-1] += 1
			
			if @indent
				value.each_line.with_index do |line, i|
					@output << indentation << line
				end
			else
				@output << value
			end
		end
		
		protected
		
		# A normal block level/container tag.
		def full_tag(name, attributes, indent_outer, indent_inner, &block)
			if block_given?
				if indent_outer
					@output << "\n" if @level.last > 0
					@output << indentation
				end
				
				tag = XRB::Tag.opened(name.to_s, attributes)
				tag.write_opening_tag(@output)
				@output << "\n" if indent_inner
				
				# The parent has one more child:
				@level[-1] += 1
				
				@level << 0
				
				yield
				
				children = @level.pop
				
				if indent_inner
					@output << "\n" if children > 0
					@output << indentation
				end
				
				tag.write_closing_tag(@output)
			else
				# The parent has one more child:
				@level[-1] += 1
				
				@output << indentation
				XRB::Tag.append_tag(@output, name.to_s, attributes, nil)
			end
		end
	end
end
