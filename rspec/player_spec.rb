# Chris Tice

require 'player'

describe Player do
	before(:each) do
		@player = Player.new("Chris")
	end
	
	it "should have name 'Chris'" do
		@player.name.should == "Chris"
	end
	
	it "should have to_s output 'Chris'" do
		@player.to_s.should == "Chris"
	end
	
	it "should have no tiles" do
		@player.tiles.size.should == 0
	end
	
	it "should have 1 'dragon #1' tile" do
		dragon_1 = Tile.new("dragon", 1)
		@player.add_tile dragon_1
		@player.tiles.size.should == 1
		
		@player.tiles.include? dragon_1
	end
	
	it "should have 2 tiles" do
		wind_2, season_3 = Tile.new("wind", 2), Tile.new("season", 3)
		
		@player.add_tile wind_2
		@player.add_tile season_3
		@player.tiles.size.should == 2
		
		@player.tiles.include? wind_2
		@player.tiles.include? season_3
	end
	
	it "should have 1 tile after removing 1" do
		wind_2, season_3 = Tile.new("wind", 2), Tile.new("season", 3)
		
		@player.add_tile wind_2
		@player.add_tile season_3
		@player.remove_tile wind_2
		@player.tiles.size.should == 1
		
		@player.tiles.include? season_3
	end
end
