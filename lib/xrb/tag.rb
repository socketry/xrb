# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2017-2024, by Samuel Williams.

require_relative 'markup'

module XRB
	# This represents an individual SGML tag, e.g. <a>, </a> or <a />, with attributes. Attribute values must be escaped.
	Tag = Struct.new(:name, :closed, :attributes) do
		def self.split(qualified_name)
			if i = qualified_name.index(':')
				return qualified_name.slice(0...i), qualified_name.slice(i+1..-1)
			else
				return nil, qualified_name
			end
		end
		
		def self.closed(name, attributes = {})
			self.new(name, true, attributes)
		end
		
		def self.opened(name, attributes = {})
			self.new(name, false, attributes)
		end
		
		def append_markup(output)
			self.write(output)
		end
		
		def build_markup(builder)
			self.append_markup(builder.output)
		end
		
		def [] key
			attributes[key]
		end
		
		alias to_hash attributes
		
		def to_s(content = nil)
			self.class.format_tag(name, attributes, content || !closed)
		end
		
		alias to_str to_s
		
		def self_closed?
			closed
		end
		
		def write_opening_tag(buffer)
			buffer << '<' << name
			
			self.class.append_attributes(buffer, attributes, nil)
			
			if self_closed?
				buffer << '/>'
			else
				buffer << '>'
			end
		end
		
		def write_closing_tag(buffer)
			buffer << '</' << name << '>'
		end
		
		def write(buffer, content = nil)
			self.class.append_tag(buffer, name, attributes, content || !closed)
		end
		
		def self.format_tag(name, attributes, content)
			buffer = String.new.force_encoding(name.encoding)
			
			self.append_tag(buffer, name, attributes, content)
			
			return buffer
		end
		
		def self.append_tag(buffer, name, attributes, content)
			buffer << '<' << name.to_s
			
			self.append_attributes(buffer, attributes, nil)
			
			if !content
				buffer << '/>'
			else
				buffer << '>'
				unless content == true
					content.append_markup(buffer)
				end
				buffer << '</' << name.to_s << '>'
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
					buffer << ' ' << attribute_key.to_s
				else
					buffer << ' ' << attribute_key.to_s << '="'
					value.append_markup(buffer)
					buffer << '"'
				end
			end
			
			return nil
		end
	end
end
