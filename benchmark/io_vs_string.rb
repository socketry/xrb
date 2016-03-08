
require 'benchmark/ips'
require 'stringio'

puts "Ruby #{RUBY_VERSION} at #{Time.now}"
puts

Benchmark.ips do |x|
	
	# These two tests look at the cost of simply writing to a buffer.
	
	x.report("String (Amortized)") do |i|
		buffer = String.new
		
		i.times do
			buffer << "String #{i}"
		end
	end
	
	x.report("StringIO (Amortized)") do |i|
		buffer = StringIO.new
		
		i.times do
			buffer << "String #{i}"
		end
	end
	
	x.compare!
end

# Calculating -------------------------------------
#   String (Amortized)     91666 i/100ms
# StringIO (Amortized)     69531 i/100ms
# -------------------------------------------------
#   String (Amortized)  2856024.9 (±8.8%) i/s -   14208230 in   5.017309s
# StringIO (Amortized)  2424863.3 (±7.0%) i/s -   12098394 in   5.013982s
# 
# Comparison:
#   String (Amortized):  2856024.9 i/s
# StringIO (Amortized):  2424863.3 i/s - 1.18x slower

# Adjust N to consider the cost of allocation vs the cost of appending.
N = 5

Benchmark.ips do |x|
	# These next two tests consider that multiple writes may be done per buffer allocation.
	
	x.report("String") do |i|
		i.times do
			buffer = String.new
			
			N.times do
				buffer << "String #{i}"
			end
		end
	end
	
	x.report("StringIO") do |i|
		i.times do
			buffer = StringIO.new
			
			N.times do
				buffer << "String #{i}"
			end
		end
	end
	
	x.compare!
end

# Calculating -------------------------------------
#               String     36822 i/100ms
#             StringIO     32471 i/100ms
# -------------------------------------------------
#               String   445143.2 (±5.0%) i/s -    2246142 in   5.059017s
#             StringIO   328469.2 (±4.1%) i/s -    1656021 in   5.049919s
# 
# Comparison:
#               String:   445143.2 i/s
#             StringIO:   328469.2 i/s - 1.36x slower
