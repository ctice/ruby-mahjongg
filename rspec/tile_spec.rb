# Chris Tice

require 'tile'

describe Tile do
	before(:each) do
		@private_tile = Tile.new("dragon", 2)
	end
	
	it "should have 'dragon' as its name" do
		@private_tile.name.should == "dragon"
	end
	
	it "should have '2' as its number" do
		@private_tile.number.should == 2
	end
end
