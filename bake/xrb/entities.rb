# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2017-2024, by Samuel Williams.

# Fetch the HTML5 entities from w3.org and update the local cache.
# @parameter force [Boolean] Whether to force regenerate the local cache.
def fetch_entities(force: false)
	require 'json'
	require 'async'
	require 'async/http/internet'
	
	internet = Async::HTTP::Internet.new
	entites_json_path = self.entites_json_path
	
	if force || !File.exist?(entites_json_path)
		url = "https://www.w3.org/TR/html5/entities.json"
		
		Sync do
			File.write(entites_json_path, internet.get(url).read)
		end
	end
	
	return JSON.parse(File.read(entites_json_path)).delete_if{|string, _| !string.end_with? ';'}
end

# Consume the HTML5 entites and generate parsers to escape them.
# @parameter wet [Boolean] Whether to write updated files.
def update_entities(wet: false)
	require 'xrb/template'
	
	paths = {
		# 'ext/xrb/entities.rl' => 'ext/xrb/entities.xrb',
		'lib/xrb/entities.rb' => 'lib/xrb/entities.xrb',
	}
	
	entities = self.fetch_entities
	
	paths.each do |output_path, template_path|
		template_path = File.expand_path(template_path, context.root)
		output_path = File.expand_path(output_path, context.root)
		
		template = XRB::Template.load_file(template_path)
		
		output = template.to_string(entities)
		
		if wet
			File.write(output_path, output)
		else
			puts "*** #{output_path} ***"
			puts output
		end
	end
end

private

def entites_json_path
	File.expand_path("entities.json", context.root)
end
