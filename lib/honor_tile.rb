# Chris Tice

require 'tile'

class HonorTile < Tile

	NAMES = ["red dragon", "white dragon", "green dragon", "north wind",
		"east wind", "west wind", "south wind", "flower", "season"]
	
	def initialize(name, number)
		super(name, number)
	end
end
