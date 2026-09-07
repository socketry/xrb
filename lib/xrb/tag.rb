# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2017-2024, by Samuel Williams.

require_relative "markup"

module XRB
	# This represents an individual SGML tag, e.g. <a>, </a> or <a />, with attributes. Attribute values must be escaped.
	Tag = Struct.new(:name, :closed, :attributes) do
		# Split a qualified tag name into its namespace and local name.
		# @parameter qualified_name [String] The potentially namespaced tag name.
		# @returns [Array(String | Nil)] The namespace and local name.
		def self.split(qualified_name)
			if i = qualified_name.index(":")
				return qualified_name.slice(0...i), qualified_name.slice(i+1..-1)
			else
				return nil, qualified_name
			end
		end
		
		# Create a self-closing tag.
		# @parameter name [String] The tag name.
		# @parameter attributes [Hash] The tag attributes.
		# @returns [Tag] The self-closing tag.
		def self.closed(name, attributes = {})
			self.new(name, true, attributes)
		end
		
		# Create a tag with separate opening and closing markup.
		# @parameter name [String] The tag name.
		# @parameter attributes [Hash] The tag attributes.
		# @returns [Tag] The opened tag.
		def self.opened(name, attributes = {})
			self.new(name, false, attributes)
		end
		
		# Append the tag to an output buffer.
		# @parameter output [Interface(:<<)] The output buffer.
		# @returns [Nil] This method always returns `nil`.
		def append_markup(output)
			self.write(output)
		end
		
		# Append the tag using a markup builder.
		# @parameter builder [Builder] The builder receiving the tag.
		# @returns [Nil] This method always returns `nil`.
		def build_markup(builder)
			self.append_markup(builder.output)
		end
		
		# Fetch an attribute value by key.
		# @parameter key [Object] The attribute key.
		# @returns [Object | Nil] The attribute value.
		def [] key
			attributes[key]
		end
		
		alias to_hash attributes
		
		# Format the tag and optional content as markup.
		# @parameter content [Object | Nil] The optional tag content.
		# @returns [String] The formatted tag markup.
		def to_s(content = nil)
			self.class.format_tag(name, attributes, content || !closed)
		end
		
		alias to_str to_s
		
		# Determine whether the tag is self-closing.
		# @returns [Boolean] Whether the tag is self-closing.
		def self_closed?
			closed
		end
		
		# Write the opening or self-closing tag to a buffer.
		# @parameter buffer [Interface(:<<)] The output buffer.
		# @returns [Object] The output buffer.
		def write_opening_tag(buffer)
			buffer << "<" << name
			
			self.class.append_attributes(buffer, attributes, nil)
			
			if self_closed?
				buffer << "/>"
			else
				buffer << ">"
			end
		end
		
		# Write the closing tag to a buffer.
		# @parameter buffer [Interface(:<<)] The output buffer.
		# @returns [Object] The output buffer.
		def write_closing_tag(buffer)
			buffer << "</" << name << ">"
		end
		
		# Write the complete tag and optional content to a buffer.
		# @parameter buffer [Interface(:<<)] The output buffer.
		# @parameter content [Object | Nil] The optional tag content.
		# @returns [Nil] This method always returns `nil`.
		def write(buffer, content = nil)
			self.class.append_tag(buffer, name, attributes, content || !closed)
		end
		
		# Format a tag as a new string.
		# @parameter name [String] The tag name.
		# @parameter attributes [Hash] The tag attributes.
		# @parameter content [Object | Boolean | Nil] The tag content, `true` for empty content, or `nil` for a self-closing tag.
		# @returns [String] The formatted tag markup.
		def self.format_tag(name, attributes, content)
			buffer = String.new.force_encoding(name.encoding)
			
			self.append_tag(buffer, name, attributes, content)
			
			return buffer
		end
		
		# Append a complete tag to an output buffer.
		# @parameter buffer [Interface(:<<)] The output buffer.
		# @parameter name [String] The tag name.
		# @parameter attributes [Hash] The tag attributes.
		# @parameter content [Object | Boolean | Nil] The tag content, `true` for empty content, or `nil` for a self-closing tag.
		# @returns [Nil] This method always returns `nil`.
		def self.append_tag(buffer, name, attributes, content)
			buffer << "<" << name.to_s
			
			self.append_attributes(buffer, attributes, nil)
			
			if !content
				buffer << "/>"
			else
				buffer << ">"
				unless content == true
					content.append_markup(buffer)
				end
				buffer << "</" << name.to_s << ">"
			end
			
			return nil
		end
		
		# Convert a set of attributes into a string suitable for use within a <tag>.
		def self.append_attributes(buffer, attributes, prefix)
			attributes.each do |key, value|
				next unless value
				
				attribute_key = prefix ? "#{prefix}-#{key}" : key
				
				case value
				when Hash
					self.append_attributes(buffer, value, attribute_key)
				when Array
					value.each do |attribute|
						raise TypeError, "expected array of key-value pairs" unless attribute.is_a?(Array) and attribute.size == 2
						
						self.append_attributes(buffer, [attribute], attribute_key)
					end
				when TrueClass
					buffer << " " << attribute_key.to_s
				else
					buffer << " " << attribute_key.to_s << '="'
					value.append_markup(buffer)
					buffer << '"'
				end
			end
			
			return nil
		end
	end
end
