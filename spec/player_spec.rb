require "./lib/player.rb"
require "spec_helper"

describe Scrabble::Player do
 before :each do
   @player = Scrabble::Player.new("Ada")
 end

 describe "#initialize" do
 it "has a name" do
   expect(@player.name).to eq("Ada")
   end
 end

 describe "plays" do
   it "return the words array" do
   expect(@player.plays).to eq([])
   end
 end

 describe "play" do
   it "Adds the input word to the plays Array" do
     @player.play("apple")
     expect(@player.plays).to eq(["apple"])
   end
   it "return an empty array when there are no words" do
     @player.play("")
     expect(@player.plays  ).to eq ([""])
   end
   it "Returns false if player has already won" do
     @player.score = 101
     expect(@player.play("apple")).to eq(false)
   end
 end

 describe "#total_score" do
   it  "sums up and returns scores" do
     @player.plays = ["aaa", "b", "c"]
     @player.total_score
     expect(@player.score).to eq(9)
   end
 end

 describe "#won?" do
   it "player has > 100 points" do
     @player.score = 300
     expect(@player.won?).to eq(true)
   end
   it "player has < 100 points" do
     @player.score = 50
     expect(@player.won?).to eq(false)
   end
 end

 describe "#highest_scoring_word" do
   it "returns highest scoring word" do
     @player.plays = ["aaa", "bbb", "zzz"]
     expect(@player.highest_scoring_word).to eq("zzz")
   end
   it 'returns a string' do
     @player.plays = ["aaa", "bbb", "zzz"]
     expect(@player.highest_scoring_word.class).to eq(String)
   end
 end

 describe "#highest_word_score" do
   it "returns the score of the highest scoring word" do
     @player.plays = ["aaa", "bbb", "zzz"]
     expect(@player.highest_word_score).to eq(30)
   end
 end

 describe "tiles" do
   it 'has no words in the beginning of the game' do
     expect(@player.tiles).to eq([])
   end
   it 'It can\'t contain more then 7 words' do
     array = ["a","b","c","r","g","y","g","h"]
     expect{@player.draw_tiles(array)}.to raise_error(ArgumentError)
   end
 end

  describe "draw_tiles" do
    it 'fills tiles array until it has 7 letters from the given tile bag' do
      check_tile_bag = @player.draw_tiles(["a","b"])
      expect(check_tile_bag.length).to eq (7)
    end
  end

 describe "draw_tiles" do
   it 'fills tiles array until it has 7 letters from the given tile bag' do
     check_tile_bag = @player.draw_tiles(["a","b"])
     expect(check_tile_bag.length).to eq (7)
   end
 end


end
