require "./lib/tilebag_class.rb"

describe Scrabble::TileBag do

  before :each do
    @bag = Scrabble::TileBag.new
  end

  describe "TileBag.new" do
    it "creates an new bag with a default collection of tiles" do
      expect(@bag).to be_an_instance_of Scrabble::TileBag
    end
    it "has 12 E's, 8 O's and 2 Y's" do
      e_array = @bag.avaliable_tiles_array.find_all{ |l| l == "E"}
      o_array = @bag.avaliable_tiles_array.find_all{ |l| l == "O"}
      y_array = @bag.avaliable_tiles_array.find_all{ |l| l == "Y"}
      expect(e_array.length).to eq 12
      expect(o_array.length).to eq 8
      expect(y_array.length).to eq 2
    end
  end

  describe "draw_tiles" do
    before :each do
      @bag = Scrabble::TileBag.new
      @count = @bag.avaliable_tiles_array.length
      @bag.draw_tiles(5)
    end
    it "returns the number of tiles the player has asked for randomly from the bag tiles" do
      expect(@bag.player_tiles.length).to eq 5
    end
    it "removes the tiles given to the player from the default set" do
      expect(@bag.avaliable_tiles_array.length).to eq (@count - 5)
    end
  end

end #describe Scrabble::TileBag do
