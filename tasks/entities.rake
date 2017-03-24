
task :fetch_entities do
	require 'open-uri'
	require 'json'
	
	entites_json_path = File.expand_path("entities.json", __dir__)
	
	unless File.exist? entites_json_path
		url = "https://www.w3.org/TR/html5/entities.json"
		File.write(entites_json_path, open(url).read)
	end
	
	@entities = JSON.parse(File.read(entites_json_path)).delete_if{|string, _| !string.end_with? ';'}
end

task :update_entities => :fetch_entities do
	require 'trenni/template'
	
	paths = {
		'ext/trenni/entities.rl' => 'ext/trenni/entities.trenni',
		'lib/trenni/entities.rb' => 'lib/trenni/entities.trenni',
	}
	
	paths.each do |output_path, template_path|
		template = Trenni::Template.load_file(template_path)
		
		puts template.send(:code)
		
		#output = template.to_string(@entities)
		
		#File.write(output_path, output)
	end
end
