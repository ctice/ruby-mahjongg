# Chris Tice

class SuitTile < Tile

	def intialize(name, number)
		super(name, number)
	end
	
	def to_s
		self.name + " #" + self.number.to_s
	end
end
