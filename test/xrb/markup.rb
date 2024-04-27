#!/usr/bin/env ruby
# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

require 'xrb/parsers'
require 'xrb/entities'
require 'xrb/template'
require 'xrb/markup'
require 'xrb/parse_delegate'

require 'json'

describe XRB::Markup do
	let(:delegate) {XRB::ParseDelegate.new}
	let(:parsers) {XRB::Parsers}
	let(:entities) {XRB::Entities::HTML5}
	
	def json_generate(events)
		buffer = String.new
		buffer << "[\n"
		
		buffer << events.map do |event|
			"\t#{event.to_json}"
		end.join(",\n")
		
		buffer << "\n]\n"
	end
	
	ROOT = File.expand_path(".markup", __dir__)
	
	Dir.glob("*.xml", base: ROOT) do |path|
		name = File.basename(path, ".xml")
		
		with path, unique: name do
			it "generates correct output" do
				markup_path = File.expand_path(path, ROOT)
				output_path = File.expand_path("#{name}.json", ROOT)
				
				buffer = XRB::Buffer.load_file(markup_path)
				parsers.parse_markup(buffer, delegate, entities)
				
				output = json_generate(delegate.events)
				
				if File.exist?(output_path)
					expect(output).to be == File.read(output_path)
				else
					File.write(output_path, output)
				end
			end
		end
	end
end