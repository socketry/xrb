
require 'benchmark/ips'

puts "Ruby #{RUBY_VERSION} at #{Time.now}"
puts

firstname = 'soundarapandian'
middlename = 'rathinasamy'
lastname = 'arumugam'

Benchmark.ips do |x|
	x.report("String\#<<") do |i|
		buffer = String.new
		
		while (i -= 1) > 0
			buffer << 'Mr. ' << firstname << middlename << lastname << ' aka soundar'
		end
	end
	
	x.report("String interpolate") do |i|
		buffer = String.new
		
		while (i -= 1) > 0
			buffer << "Mr. #{firstname} #{middlename} #{lastname} aka soundar"
		end
	end
	
	x.compare!
end
