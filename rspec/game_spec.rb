# Chris Tice

require 'game'

describe Game do
	before(:each) do
		@game = Game.new("chris", "val")
	end
	
	it "should have 4 players, 2 of which are named 'chris' and 'val'" do
		@game.players.size.should == 4
		@game.players.should include(Player.new("chris"))
		@game.players.should include(Player.new("val"))
	end
	
	it "should raise error for wrong number of players" do
		lambda { Game.new }.should raise_error
		lambda { Game.new("a", "b", "c", "d", "e") }.should raise_error
	end
	
	it "should advance turn to the correct player" do
		current = @game.turn
		3.times do
			@game.advance_turn
		end
		current.should == @game.advance_turn
	end
	
	it "should remove tile from a player and put it in the middle of the table" do
		tile = @game.turn.private_tiles[0]
		@game.discard_tile(tile)
		@game.center_tile.should == tile
	end
end
