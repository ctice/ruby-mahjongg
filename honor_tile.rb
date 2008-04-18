# Chris Tice

require 'tile'

class HonorTile < Tile
	
	def initialize(name, number)
		super(name, number)
	end
	
	def to_s
		self.name + " #" + self.number.to_s
	end
end
