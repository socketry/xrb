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
	
	with '.escape_string' do
		it 'escapes special characters' do
			expect(XRB::Markup.escape_string("<h1>Hello World</h1>")).to be == "&lt;h1&gt;Hello World&lt;/h1&gt;"
		end
		
		it 'fails to escape non-string' do
			expect do
				XRB::Markup.escape_string(Object.new)
			end.to raise_exception(TypeError)
		end
	end
	
	with '.append' do
		it 'appends string to buffer' do
			buffer = String.new
			
			XRB::Markup.append(buffer, "Hello")
			
			expect(buffer).to be == "Hello"
		end
		
		it 'appends escaped string to buffer' do
			buffer = String.new
			
			XRB::Markup.append(buffer, "<h1>Hello World</h1>")
			
			expect(buffer).to be == "&lt;h1&gt;Hello World&lt;/h1&gt;"
		end
		
		it 'appends nil to buffer' do
			buffer = String.new
			
			XRB::Markup.append(buffer, nil)
			
			expect(buffer).to be == ""
		end
		
		it 'appends MarkupString to buffer' do
			buffer = String.new
			
			XRB::Markup.append(buffer, XRB::MarkupString.raw("<h1>Hello World</h1>"))
			
			expect(buffer).to be == "<h1>Hello World</h1>"
		end
		
		it 'fails to append to non-string buffer' do
			buffer = Object.new
			
			expect do
				XRB::Markup.append(buffer, "Hello")
			end.to raise_exception(NoMethodError, message: be =~ /<</)
		end
		
		it 'falls back to appending with #<<' do
			buffer = []
			
			XRB::Markup.append(buffer, "<Hello>")
			
			expect(buffer).to be == ["&lt;Hello&gt;"]
		end
	end
end
