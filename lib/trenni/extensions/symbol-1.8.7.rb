
class Symbol
	def <=>(with)
		if with.is_a? Symbol
			to_s <=> with.to_s
		end
	end
end
