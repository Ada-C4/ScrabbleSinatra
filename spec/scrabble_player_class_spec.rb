require "spec_helper"
require "./lib/scrabble_player_class"

describe Player do
  before :each do
    @player = Scrabble::Scrabble::Player.new("Jack")
  end


  describe "returns the @name instance variable" do
    it "returns @name" do
      expect(@player.name).to eq "Jack"
    end
  end

  describe "shows words played" do
    it "returns @plays" do
      expect(@player.play("apple")).to eq ["apple"]
    end
  end


  describe "shows total score" do
    it "returns score of all words played" do
      @player.play("venus")
      @player.play("zzzzzzzzzzzzzz")
      @player.play("a")
      expect(@player.total_score).to eq 7
    end
  end

  describe "tells if the player has over 100 points" do
    it "returns ture or false" do
      @player.play("zzzzzzzzzzzzzz")
      expect(@player.won?).to be false
    end
  end

  describe " tells the highest scoring word" do
    it "returns the highest scoring word" do
      @player.play("venus")
      @player.play("zzzzzzzzzzzzzz")
      @player.play("a")

      expect(@player.highest_scoring_word).to eq "a"
    end
  end

  describe " gives the highest scoring number" do
    it "gives the higest scoring number" do
      @player.play("venus")
      @player.play("zzzzzzzzzzzzzz")
      @player.play("a")

      expect(@player.highest_score_number).to eq 4
    end
  end

end
