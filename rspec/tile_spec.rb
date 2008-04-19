# Chris Tice

require 'tile'

describe Tile do
	before(:each) do
		@tile = Tile.new("dragon", 2)
	end
	
	it "should have 'dragon' as its name" do
		@tile.name.should == "dragon"
	end
	
	it "should have '2' as its number" do
		@tile.number.should == 2
	end
end
