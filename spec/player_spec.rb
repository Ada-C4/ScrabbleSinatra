require "./lib/player"
require "./lib/TileBag"
require 'pry'
describe Scrabble::Player do
  before :each do
    @player = Scrabble::Player.new("Charles")
    @word = "cat"
    @tilebag = Scrabble::TileBag.new
  end
  describe ".self.new(name)" do
    it "creates a new instance" do
      expect(@player).to be_an_instance_of Scrabble::Player
    end
  end
  describe "#initialize(name)" do
    it "assigns instance variable name" do
      expect(@player.name).to eq "Charles"
    end
  end
  describe "#plays" do
    it "returns an Array of the words played by the player" do
      expect(@player.plays).to eq []
    end
  end
  describe "#play(word)" do
    it "Adds the input word to the plays Array" do
      @player.play(@word)
      expect(@player.plays).to eq ["cat"]
    end
    it "Returns false if player has already won" do
      @player.plays = ["cat", "dog", "zebra", "xylopone", "quick", "zzzzzzzzz"]
      expect(@player.play(@word)).to eq false
    end
    it "Does not push last word to Array if player has won" do
      @player.plays = ["cat", "dog", "zebra", "xylopone", "quick", "zzzzzzzzz"]
      expect(@player.plays).to eq ["cat", "dog", "zebra", "xylopone", "quick", "zzzzzzzzz"]
    end
  end
  describe "#total_score" do
    it "Sums up and returns the score of the players words" do
      @player.plays = ["cat", "dog", "zebra"]
      expect(@player.total_score).to eq 26
    end
  end
  describe "#won?" do
    it "returns true if the player has over 100 points otherwise " do
      @player.plays = ["cat", "dog", "zebra", "xylopone", "quick", "zzzzzzzzz"]
      expect(@player.won?).to eq true
    end
    it "returns false if the player does not have over 100 points" do
      @player.plays = ["cat", "dog", "zebra"]
      expect(@player.won?).to eq false
    end
  end
  describe "#highest_scoring_word" do
    it "Returns the highest scoring word the user has played." do
      @player.plays = ["cat", "dog", "zebra"]
      expect(@player.highest_scoring_word).to eq "zebra"
    end
  end
  describe "#highest_word_score" do
    it "Returns the highest_scoring_word score." do
      @player.plays = ["cat", "dog", "zebra"]
      expect(@player.highest_word_score).to eq 16
    end
  end
  describe "#tiles" do
    it "returns a collection of letters that the player can play (max 7)" do
      expect(@player.tiles).to eq []
    end
  end
  describe "#draw_tiles(tile_bag)" do
    it "fills tiles array until it has 7 letters from the given tile bag" do
      @player.draw_tiles(@tilebag)
      expect(@player.tiles.length).to eq 7
    end
    it "does not allow tiles array to exceed a length of 7" do
      @player.draw_tiles(@tilebag)
      @player.draw_tiles(@tilebag)
      expect(@player.tiles.length).to eq 7
    end
  end
end
