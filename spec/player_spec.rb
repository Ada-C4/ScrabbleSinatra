require "spec_helper"
require "./lib/player"

describe Scrabble::Player do
  before :each do
    @player1 = Scrabble::Player.new("bob")
    @player2 = Scrabble::Player.new("andre")
    @player3 = Scrabble::Player.new("batman")
    @player4 = Scrabble::Player.new("spiderman")
    @player5 = Scrabble::Player.new("superman")
    @player2.play("love") # love = 7
    @player2.play("toast") # toast = 5
    @player2.play("hand") # hand = 8
    @player3.play("zzzzzzzzzzz") # = 110
  end

  describe ".new" do
    it "creates a new instance of Player" do
      expect(@player1).to be_an_instance_of Scrabble::Player
    end
  end

  describe "#name" do
    it "returns the @name variable" do
      expect(@player1.name).to eq "bob"
    end
  end

  describe "#plays" do
    it "returns an array of the words played by player" do
      expect(@player1.plays).to eq []
    end
  end

  describe "#play" do
    it "adds the input word to the plays array" do
      @player1.play("sparkle")
      expect(@player1.plays).to eq ["sparkle"]
    end
    it "adds the input word to the plays array" do
      expect(@player2.plays).to eq ["love", "toast", "hand"]
    end
    it "returns false if player has already won" do
      expect(@player3.play("word")).to eq false
    end
  end

  describe "#total_score" do
    it "sums up and returns the score of the players words" do
      expect(@player2.total_score).to eq 20
    end
  end

  describe "#won?" do
    it "returns true if player has over 100 points" do
      expect(@player3.won?).to eq true
    end

    it "returns false if player does not have over 100 points" do
      expect(@player2.won?).to eq false
    end
    it "returns false if player does not have over 100 points" do
      @player4.play("zzzzzzzzzz") #word = 100 points exactly
      expect(@player4.won?).to eq false
    end
  end

  describe "#highest_scoring_word" do
    it "returns highest scoring word player used" do
      expect(@player2.highest_scoring_word).to eq "hand"
    end
  end

  describe "#highest_word_score" do
    it "returns the highest scoring word score" do
      expect(@player2.highest_word_score).to eq 8
    end
  end

  describe "#tiles" do
    it "returns the collection of letters that the player can play" do
      expect(@player5.tiles).to be_an_instance_of Array
    end
    it "contains a maximum of 7 tiles" do
      expect(@player5.tiles.length).to be <= 7
    end
  end

  describe "#draw_tiles(tile_bag)" do
    it "fills tiles array until it has 7 letters from the given tile bag" do
      @tilebag = Scrabble::TileBag.new
      @player5.draw_tiles(@tilebag)
      expect(@player5.tiles.length).to eq 7
    end
  end



end
