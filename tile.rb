# Chris Tice

class Tile
	attr_reader :name, :number
	
	def initialize(name, number)
		@name, @number = name, number
	end
end
