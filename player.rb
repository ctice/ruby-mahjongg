# Chris Tice

class Player
	attr_reader :name
	attr_accessor :tiles
	
	# new Player has a name and 0 tiles
	def initialize(name)
		@name = name
		@tiles = []
	end
	
	def add_tile(tile)
		@tiles << tile
	end
	
	def remove_tile(tile)
		tiles.delete(tile)
	end
	
	def to_s
		name
	end
end
