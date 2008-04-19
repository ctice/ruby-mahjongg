# Chris Tice

class SuitTile < Tile

	NAMES = ["crak", "dot", "bam"]

	def intialize(name, number)
		super(name, number)
	end
	
	def to_s
		name + " #" + number.to_s
	end
end
