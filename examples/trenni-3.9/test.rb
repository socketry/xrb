#!/usr/bin/env ruby
# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

require "trenni"
require "trenni/version"

class Formatter
	def title_for(options)
		options[:title]
	end
	
	def value_for(options)
		options[:value]
	end
	
	def row(options = {}, &block)
		Trenni::Builder.fragment do |builder|
			builder.inline(:dt) { builder.text title_for(options) }

			if block_given?
				builder.inline(:dd) { builder.capture(self, &block) }
			else
				builder.inline(:dd) { builder.text value_for(options) }
			end
		end >> block
	end
end

puts "Trenni version: #{Trenni::VERSION}"

template = Trenni::Template.load_file("test.trenni")
puts template.to_string(binding)
