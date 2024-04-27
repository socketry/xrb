# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2016-2024, by Samuel Williams.

module XRB
	# This is a sample delegate for capturing all events. It's only use is for testing.
	class ParseDelegate
		def initialize
			@events = []
		end
		
		attr :events
		
		def method_missing(*args)
			@events << args
		end
	end
end
