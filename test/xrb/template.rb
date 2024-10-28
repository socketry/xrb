# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2012-2024, by Samuel Williams.

require "xrb/template"
require "xrb/parsers"

require "xrb/parse_delegate"

describe XRB::Template do
	ROOT = File.expand_path(".template", __dir__)
	
	Dir.glob("*.xrb", base: ROOT) do |path|
		name = File.basename(path, ".xrb")
		
		with path, unique: name do
			it "generates correct output" do
				template_path = File.expand_path(path, ROOT)
				output_path = File.expand_path("#{name}.xml", ROOT)
				
				template = subject.load_file(template_path)
				output = template.to_string
				
				if File.exist?(output_path)
					expect(output).to be == File.read(output_path)
				else
					File.write(output_path, output)
				end
			end
			
			it "generates correct output with custom output buffer" do
				template_path = File.expand_path(path, ROOT)
				output_path = File.expand_path("#{name}.xml", ROOT)
				
				template = subject.load_file(template_path)
				output = StringIO.new
				
				template.to_string(Object.new, output)
				
				if File.exist?(output_path)
					expect(output.string).to be == File.read(output_path)
				else
					File.write(output_path, output.string)
				end
			end
		end
	end
	
	it "should use default top-level binding if none provided" do
		buffer = XRB::Buffer.new('#{Module.nesting.inspect}')
		template = XRB::Template.new(buffer)
		
		expect(template.to_string(self)).to be == "[XRB]"
	end
end

ATemplateParser = Sus::Shared("template parser") do
	let(:delegate) {XRB::ParseDelegate.new}
	
	it "should fail to parse incomplete expression" do
		buffer = XRB::Buffer.new('<img src="#{product.photo.thumbnail_url" />')
		
		expect{
			subject.parse_template(buffer, delegate)
		}.to raise_exception(XRB::ParseError)
	end
	
	it "should fail to parse incomplete instruction" do
		buffer = XRB::Buffer.new("<?r foo")
		
		expect{
			subject.parse_template(buffer, delegate)
		}.to raise_exception(XRB::ParseError)
	end
end

if defined? XRB::Fallback
	describe XRB::Fallback do
		it_behaves_like ATemplateParser
	end
end

if defined? XRB::Native
	describe XRB::Native do
		it_behaves_like ATemplateParser
	end
end

