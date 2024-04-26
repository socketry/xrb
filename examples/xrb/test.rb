#!/usr/bin/env ruby

require_relative 'lib/xrb'

class Formatter
	def title_for(options)
		options[:title]
	end
	
	def value_for(options)
		options[:value]
	end
	
	def row(options = {}, &block)
		XRB::Builder.fragment do |builder|
			builder.inline(:dt) { builder.text title_for(options) }

			if block_given?
				binding.irb
				builder.inline(:dd) { builder.capture(self, &block) }
			else
				builder.inline(:dd) { builder.text value_for(options) }
			end
		end
	end
end

template = XRB::Template.load_file('test.xrb')

binding.irb

puts template.to_string(binding)
