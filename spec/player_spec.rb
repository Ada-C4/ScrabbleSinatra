require "spec_helper"
require "./lib/scrabble_master"

describe Scrabble::Player do
  before :each do
    @player = Scrabble::Player.new("ergdarg")
  end
  describe ".new" do
    it "creates a new instance of player" do
      expect(@player).to be_an_instance_of Scrabble::Player
    end
  end
  describe "#name" do
    it "gives the name of the player" do
      expect(@player.name).to eq "ergdarg"
    end
  end
  describe "#plays" do
    it "returns an empty array of words at the beginning of the game" do
      expect(@player.plays).to eq []
    end
    it "returns an array with the played word" do
      @player.create_mock({tiles: %w(O R A N G E S)})
      @player.play("oranges")
      expect(@player.plays).to eq ["ORANGES"]
    end
  end
  describe "#play(word)" do
    it "adds the played word to the @plays array" do
      @player.create_mock({tiles: %w(W O R D A B C)})
      expect(@player.play("word")).to eq ["WORD"]
    end
    it "removes the played tiles from the @tiles array" do
      @player.create_mock({tiles: %w(W O R D A B C)})
      @player.play("WORD")
      expect(@player.tiles).to eq ["A", "B", "C"]
    end
    it "returns false if player has already won" do
      @player.create_mock({tiles: %w(O R A N G E S), plays: %w(stirred)})
      @player.play("oranges")
      expect(@player.play("word")).to be_falsey
    end
    it "gives an error if try to play a word without the appropriate tiles" do
      @player.create_mock({tiles: %w(O R A N G E P)})
      expect(@player.play("oranges")).to be_nil
    end
    it "will accept a word even if there is a duplicates in the tiles array" do
      @player.create_mock({tiles: %w(W O R D D O O)})
      expect(@player.play("word")).to eq ["WORD"]
    end
  end
  describe "#total_score" do
    it "sums up and returns the total score of the players words" do
      @player.create_mock({plays: %w(SNACK APPLE ORANGES)})
      expect(@player.total_score).to eq 11 + 9 + 58
    end
  end
  describe "#won?" do
    it "returns true if player has over 100 points" do
      @player.create_mock({plays: %w(STIRRED ORANGES)})
      expect(@player.won?).to be_truthy
    end
    it "returns false if player has under 100 points" do
      @player.create_mock({plays: %w(CAT DOG)})
      expect(@player.won?).to be_falsey
    end
  end
  describe "#highest_scoring_word" do
    it "returns nil if @plays is empty" do
      expect(@player.highest_scoring_word).to be_nil
    end
    it "returns the highest scoring word the user has played" do
      @player.create_mock({plays: %w(CAT CRAZY ORANGE)})
      expect(@player.highest_scoring_word).to eq "CRAZY"
    end
  end
  describe "#highest_word_score" do
    it "returns nil if @plays is empty" do
      expect(@player.highest_word_score).to be_nil
    end
    it "returns the highest scoring word score" do
      @player.create_mock({plays: %w(CAT CRAZY ORANGE)})
      expect(@player.highest_word_score).to eq 19
    end
  end
  describe "#tiles" do
    it "returns an empty array of tiles at the beginning of the game" do
      expect(@player.tiles).to eq []
    end
  end
  describe "#draw_tiles(tile_bag)" do
    before :each do
      @tilebag = Scrabble::TileBag.new
    end
    it "draws 7 tiles" do
      expect(@player.draw_tiles(@tilebag).length).to eq 7
    end
    it "adds 7 tiles to the players tiles array" do
      @player.draw_tiles(@tilebag)
      expect(@player.tiles.length).to eq 7
    end
    it "adds 3 tiles to the players tiles array already containing 4 tiles" do
      @player.create_mock({tiles: %w(W O R D)})
      @player.draw_tiles(@tilebag)
      expect(@player.tiles.length).to eq 7
    end
  end
end
