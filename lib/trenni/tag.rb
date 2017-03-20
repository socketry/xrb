# Copyright, 2012, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require_relative 'markup'

module Trenni
	# This represents an individual SGML tag, e.g. <a>, </a> or <a />, with attributes. Attribute values must be escaped.
	Tag = Struct.new(:name, :closed, :attributes) do
		include Trenni::Markup
		
		def self.split(qualified_name)
			if i = qualified_name.index(':')
				return qualified_name.slice(0...i), qualified_name.slice(i+1..-1)
			else
				return nil, qualified_name
			end
		end
		
		def self.closed(name, **attributes)
			self.new(name, true, attributes)
		end
		
		def self.opened(name, **attributes)
			self.new(name, false, attributes)
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
					Markup.append(buffer, content)
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
					self.append_attributes(buffer, value, attribute_key)
				when TrueClass
					buffer << ' ' << attribute_key.to_s
				else
					buffer << ' ' << attribute_key.to_s << '="'
					Markup.append(buffer, value)
					buffer << '"'
				end
			end
			
			return nil
		end
	end
end
