# Chris Tice

class Tile
	attr_reader :name, :number
	
	def initialize(name, number)
		@name, @number = name, number
	end
	
	def ==(tile)
		return (self.name == tile.name) && (self.number == tile.number)
	end
end
