require "./lib/tilebag"

describe ScrabbleMod do
  describe ScrabbleMod::TileBag do
    before :each do
      @tilebag = ScrabbleMod::TileBag.new
    end

    describe "#initialize" do
      it "creates instance of TileBag" do
        expect(@tilebag).to be_an_instance_of ScrabbleMod::TileBag
      end
      it "TileBag instance has correct num of each kind of tile" do
        expect(@tilebag.tile_array.find_all {|letter| letter == "a"}.length).to eq 9
        expect(@tilebag.tile_array.find_all {|letter| letter == "e"}.length).to eq 12
        expect(@tilebag.tile_array.find_all {|letter| letter == "k"}.length).to eq 1
        expect(@tilebag.tile_array.find_all {|letter| letter == "r"}.length).to eq 6
        expect(@tilebag.tile_array.find_all {|letter| letter == "z"}.length).to eq 1
        expect(@tilebag.total_tiles).to eq 98
      end
    end

    describe "#draw_tiles(num)" do
      it "returns correct num of tiles" do
        expect(@tilebag.draw_tiles(1).length).to eq 1
        num = rand(0..97)
        expect(@tilebag.draw_tiles(num).length).to eq num
      end
      it "removes correct num tiles from bag" do
        @tilebag.draw_tiles(1)
        expect(@tilebag.total_tiles).to eq 97
        rand_num = rand(0..97)
        @tilebag.draw_tiles(rand_num)
        expect(@tilebag.total_tiles).to eq (97 - rand_num)
      end
    end

    describe "#tiles_remaining" do
      it "returns num tiles remaining in bag" do
        expect(@tilebag.tiles_remaining).to eq @tilebag.total_tiles
      end
    end

  end
end
