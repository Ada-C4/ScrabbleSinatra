require './lib/tilebag.rb'


  describe Scrabble::TileBag do
    before :each do
      @tilebag = Scrabble::TileBag.new
    end

    describe ".new" do
      it "creates a new instance of a tile bag" do
        expect(@tilebag).to be_an_instance_of Scrabble::TileBag
      end
    end

    describe "draw_tilebag(num)" do
      before :each do
        @tilebag.draw_tiles(4)
      end
      it "removes tiles from the tilebag" do
        expect(@tilebag.tiles_remaining).to eq 94
      end
      it "grabs (num) number of tiles" do
        expect((@tilebag.draw_tiles(3)).length).to eq 3
      end
      it "does not likely draw the same letter array twice" do
        expect(@tilebag.draw_tiles(6)).not_to eq(@tilebag.draw_tiles(6))
      end
      it "does not allow user to draw over 7 tiles" do
        expect(@tilebag.draw_tiles(8)).to eq []
      end
    end

    describe "tiles_remaining" do
      it "returns the total number of tiles that remain after a Player" do
        expect(@tilebag.tiles_remaining).to eq 98
      end
    end
  end
