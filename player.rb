# Chris Tice

class Player
	attr_reader :name						# the player's name
	attr_reader :private_tiles	# the tiles which are only visible to the player
	attr_reader :public_tiles		# the tiles which are visible to everyone
	
	# new Player has a name and 0 private and 0 public tiles
	def initialize(name)
		@name = name
		@private_tiles = []
		@public_tiles = []
	end
	
	# give a tile to the player
	def add_tile(tile)
		if tile.name == "flower" || tile.name == "season"
			@public_tiles << tile
		else
			@private_tiles << tile
		end
	end
	
	# remove a tile from the player
	def remove_tile(tile)
		if tile.name == "flower" || tile.name == "season"
			@public_tiles.delete(tile)
		else
			@private_tiles.delete(tile)
		end
	end
	
	# player's are equal if their names are equal
	def ==(player)
		self.name == player.name
	end
	
	# the player's name
	def to_s
		name
	end
end
