require "spec_helper"
require "./lib/highest_score.rb"

describe Scrabble::ScrabbleGame do

  describe "self.highest_score_from" do
    before :each do
      @word_array1 = ["aaa", "bbb"]
      @word_array2 = ["bb", "aaaaaa", "a", "b", "ki", "fg"]
    end

    it "Can look at this method with rspec" do
      puts "Rspec can see in here"
    end

    it "If there is more than word with a top score, return the shortest word that is listed first in the array" do
      expect(Scrabble::ScrabbleGame.highest_score_from(@word_array2)).to be == "bb"
    end
  end
end
