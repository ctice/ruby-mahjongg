# Chris Tice

require 'player'
require 'table'
require 'honor_tile'
require 'suit_tile'

class Game
	attr_reader :players, :free_tiles, :dealer
	
	# Create a new game with where n player names are passed as parameters and
	# 4 - n are CPU players
	def initialize(*names)
		raise ArgumentError, "Must have between 1 and 4 players" if 
			!(1..4).include? names.size
		
		@players = []
		names.each do |name|
			@players << Player.new(name)
		end
		
		(names.size+1).upto(4) do |n|
			@players << Player.new("Player #{n}")
		end
		
		# pick a random player as dealer
		@dealer = @players[rand(4)]
		
		populate_free_tiles
		shuffle_tiles
	end
	
	private
	
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
			@players.each do |p|
				tile = @free_tiles.delete_at rand(@free_tiles.size)
				p.tiles << tile
			end
		end
		
		tile = @free_tiles.delete_at rand(@free_tiles.size)
		@dealer.tiles << tile
	end
end
