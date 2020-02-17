# frozen_string_literal: true

require 'benchmark/ips'
require 'trenni/parsers'
require 'trenni/entities'

require 'trenni/query'
require 'rack/utils'

require 'nokogiri'

RSpec.describe Trenni::Parsers do
	# include_context "profile"
	
	describe '#parse_markup' do
		let(:xhtml_path) {File.expand_path('corpus/large.xhtml', __dir__)}
		let(:xhtml_buffer) {Trenni::FileBuffer.new(xhtml_path)}
		let(:entities) {Trenni::Entities::HTML5}
		
		it "should be fast to parse large documents" do
			Benchmark.ips do |x|
				x.report("Large (Trenni)") do |times|
					delegate = Trenni::ParseDelegate.new
					
					while (times -= 1) >= 0
						Trenni::Parsers.parse_markup(xhtml_buffer, delegate, entities)
						
						delegate.events.clear
					end
				end
				
				x.report("Large (Nokogiri)") do |times|
					delegate = Trenni::ParseDelegate.new
					parser = Nokogiri::HTML::SAX::Parser.new(delegate)
					
					while (times -= 1) >= 0
						parser.parse(xhtml_buffer.read)
						
						delegate.events.clear
					end
				end
				
				x.compare!
			end
		end
	end
	
	describe '#parse_template' do
		let(:large_trenni_path) {File.expand_path('template_spec/large.trenni', __dir__)}
		let(:trenni_buffer) {Trenni::FileBuffer.new(large_trenni_path)}
		
		let(:large_erb_path) {File.expand_path('template_spec/large.erb', __dir__)}
		let(:erb_buffer) {Trenni::FileBuffer.new(large_erb_path)}
		
		it "should be fast to parse large templates" do
			Benchmark.ips do |x|
				x.report("Large (Trenni)") do |times|
					delegate = Trenni::ParseDelegate.new
					
					while (times -= 1) >= 0
						Trenni::Parsers.parse_template(trenni_buffer, delegate)
						
						delegate.events.clear
					end
				end
				
				x.report("Large (ERB)") do |times|
					while (times -= 1) >= 0
						ERB.new(erb_buffer.read)
					end
				end
				
				x.compare!
			end
		end
	end
	
	describe '#parse_query' do
		let(:string) {"foo=hi%20there&bar[blah]=123&bar[quux][0]=1&bar[quux][1]=2&bar[quux][2]=3"}
		
		it "should be fast to parse large query strings" do
			Benchmark.ips do |x|
				x.report("Large (Trenni)") do |times|
					while (times -= 1) >= 0
						Trenni::Query.new.parse(Trenni::Buffer.new string)
					end
				end
				
				x.report("Large (Rack)") do |times|
					while (times -= 1) >= 0
						Rack::Utils.parse_nested_query(string)
					end
				end
				
				x.compare!
			end
		end
	end
end
