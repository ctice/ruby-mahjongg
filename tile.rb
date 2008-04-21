# Chris Tice

class Tile
	attr_reader :name
	attr_reader :number
	
	def initialize(name, number)
		@name, @number = name, number
	end
	
	# tiles are equal if their names are equal and their numbers are equal
	def ==(tile)
		return (self.name == tile.name) && (self.number == tile.number)
	end
	
	def to_s
		name + " #" + number.to_s
	end
end
