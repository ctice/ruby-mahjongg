# Chris Tice

require 'player'
require 'honor_tile'
require 'suit_tile'

class Game
	attr_reader :players		# the players in the game
	attr_reader :free_tiles	# free tiles don't belong to any player
	attr_reader :dealer			# the current dealer for the round
	attr_reader :turn				# the player whose turn it is
	attr_reader :center_tile# the free tile in the center of the table
	
	# Create a new game with where n player names are passed as parameters and
	# 4 - n are CPU players
	def initialize(*names)
		raise ArgumentError, "Must have between 1 and 4 players" if 
			!(1..4).include? names.size
		
		@players = []
		names.each do |name|
			@players << Player.new(name)
		end
		
		# assign generic names to the CPU players
		(names.size+1).upto(4) do |n|
			@players << Player.new("Player #{n}")
		end
		
		# pick a random player as dealer
		@dealer = @players[rand(4)]
		@turn = @dealer
		
		populate_free_tiles
		shuffle_tiles
	end
	
	def draw_tile(player)
		
	end
	
	# remove the tile from the player and place it in the center of the table
	def discard_tile(tile)
		@center_tile = turn.remove_tile(tile)
	end
	
	# the current turn has been completed, so advance the turn to the next player
	def advance_turn
		index = @players.index(@turn)
		index = (index + 1) % 4
		@turn = @players[index]
	end
	
	# print a compact representation of the state of the game
	def to_s
		@players.each do |player|
			puts player
			print "Public tiles: ", player.public_tiles.join("|")
			puts
			print "Private tiles: ", player.private_tiles.join("|")
			2.times do puts end
		end
	end
	
	private
	
	# generate the 144 tiles used for the game
	def populate_free_tiles
		@free_tiles = []
		1.upto(4) do |num|
			for name in HonorTile::NAMES
				@free_tiles << HonorTile.new(name, num)
			end
		end
		
		1.upto(36) do |num|
			for name in SuitTile::NAMES
				@free_tiles << SuitTile.new(name, num)
			end
		end
	end
	
	# assign 13 tiles to each of the 4, plus 1 extra for the dealer
	def shuffle_tiles
		13.times do
			@players.each do |player|
				tile = @free_tiles.delete_at rand(@free_tiles.size)
				player.add_tile(tile)
				
				# flower and seaon tiles are automatically exposed to all players, so
				# keep dealing more tiles until the tile is not flower or season
				while tile.name == "flower" || tile.name ==  "season"
					tile = @free_tiles.delete_at rand(@free_tiles.size)
					player.add_tile(tile)
				end
			end
		end
		
		tile = @free_tiles.delete_at rand(@free_tiles.size)
		@dealer.add_tile(tile)
	end
end
