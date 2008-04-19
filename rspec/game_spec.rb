# Chris Tice

require 'game'

describe Game do
	before(:each) do
		@game = Game.new("chris", "val")
	end
	
	it "should have 4 players, 2 of which are named 'chris' and 'val'" do
		@game.players.size.should == 4
		@game.players.include? Player.new("chris")
		@game.players.include? Player.new("val")
	end
	
	it "should raise error for wrong number of players" do
		lambda { Game.new }.should raise_error
	end
	
	it "should contain 91 tiles after dealing (144 - 13*3 - 14)" do
		@game.free_tiles.size.should == 91
	end
end
