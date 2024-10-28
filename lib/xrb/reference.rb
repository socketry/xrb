# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2020-2024, by Samuel Williams.

require_relative "query"

module XRB
	class Reference
		def initialize(path, query = {}, fragment: nil)
			@path = path.to_s
			@query = query
			@fragment = fragment
		end
		
		# The path component of the URI, e.g. /foo/bar/index.html
		attr :path
		
		# The query parameters.
		attr :query
		
		# A fragment identifier, the part after the '#'
		attr :fragment
		
		def append(buffer)
			buffer << escape_path(@path)
			
			unless @query.empty?
				buffer << "?" << query_string
			end
			
			if @fragment
				buffer << "#" << escape(@fragment)
			end
			
			return buffer
		end
		
		def to_str
			append(String.new)
		end
		
		alias to_s to_str
		
		private
		
		# According to https://tools.ietf.org/html/rfc3986#section-3.3, we escape non-pchar.
		NON_PCHAR = /([^
			a-zA-Z0-9
			\-\._~
			!\$&'\(\)\*\+,;=
			:@\/
		]+)/x.freeze
		
		def escape_path(path)
			encoding = path.encoding
			path.b.gsub(NON_PCHAR) do |m|
				"%" + m.unpack("H2" * m.bytesize).join("%").upcase
			end.force_encoding(encoding)
		end
		
		# Escapes a generic string, using percent encoding.
		def escape(string)
			encoding = string.encoding
			string.b.gsub(/([^a-zA-Z0-9_.\-]+)/) do |m|
				"%" + m.unpack("H2" * m.bytesize).join("%").upcase
			end.force_encoding(encoding)
		end
		
		def query_string
			build_nested_query(@query)
		end
		
		def build_nested_query(value, prefix = nil)
			case value
			when Array
				value.map { |v|
					build_nested_query(v, "#{prefix}[]")
				}.join("&")
			when Hash
				value.map { |k, v|
					build_nested_query(v, prefix ? "#{prefix}[#{escape(k.to_s)}]" : escape(k.to_s))
				}.reject(&:empty?).join("&")
			when nil
				prefix
			else
				raise ArgumentError, "value must be a Hash" if prefix.nil?
				"#{prefix}=#{escape(value.to_s)}"
			end
		end
	end
	
	# Generate a URI from a path and user parameters. The path may contain a `#fragment` or `?query=parameters`.
	def self.Reference(path = "", **parameters)
		base, fragment = path.split("#", 2)
		path, query_string = base.split("?", 2)
		
		if query_string
			query = Query.parse(Buffer.new(query_string))
		else
			query = {}
		end
		
		query.update(parameters)
		
		Reference.new(path, query, fragment: fragment)
	end
end
