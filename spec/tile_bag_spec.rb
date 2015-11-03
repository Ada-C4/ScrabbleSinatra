require "./lib/tile_bag.rb"
require './spec/spec_helper.rb'

describe Scrabble::TileBag do
  before :each do
    @tile_bag =Scrabble::TileBag.new
  end

  describe 'initialize' do
    it "make a new tile bag" do
      expect(@tile_bag.tile_bag).to be_an(Array)
    end
    it "last letter in the array is Z" do
      expect(@tile_bag.tile_bag.last).to eq("z")
    end
  end

  describe '#draw_tiles(num)' do
   it 'only accepts numbers' do
     expect{@tile_bag.draw_tiles("f").to raise_error}
   end
   it 'returns num tiles' do
     tiles = @tile_bag.draw_tiles(4)
     expect(tiles.length).to eq(4)
   end
   it 'removes the tiles from tile_bag_array' do
     initial_length = @tile_bag.tile_bag.length
     @tile_bag.draw_tiles(1)
     expect(@tile_bag.tile_bag.length).to eq(initial_length - 1)
   end
  end

end
