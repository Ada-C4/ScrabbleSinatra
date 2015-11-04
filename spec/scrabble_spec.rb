require "spec_helper"
require "./lib/scrabble"

describe Scrabble::Scrabble do

  describe ".letter_value" do
    it "gives value of 1 to select letters" do
      expect(Scrabble::Scrabble.letter_value("A")).to eq 1
      expect(Scrabble::Scrabble.letter_value("S")).to eq 1
      expect(Scrabble::Scrabble.letter_value("L")).to eq 1
    end
    it "gives value of 2 to select letters" do
      expect(Scrabble::Scrabble.letter_value("D")).to eq 2
    end
    it "gives value of 3 to select letters" do
      expect(Scrabble::Scrabble.letter_value("M")).to eq 3
    end
    it "gives value of 4 to select letters" do
      expect(Scrabble::Scrabble.letter_value("V")).to eq 4
    end
    it "gives value of 10 to select letters" do
      expect(Scrabble::Scrabble.letter_value("Z")).to eq 10
    end
  end

  describe ".score" do
    it "calculates the score of a word" do
      expect(Scrabble::Scrabble.score("cat")).to eq 5
    end
    it "add total value of word string" do
      expect(Scrabble::Scrabble.score("zebra")).to eq 16
    end
  end

  describe ".highest_score_from" do
    before :each do
      @array = ["peanut", "zebra", "cat"]
      @array2 = ["go", "fox", "mop"]
      @array3 = ["jelly", "dog", "quip"]
      @array4 = ["queens", "cat", "cherish"]
      @array5 = ["dog","god","rat"]
      @array6 = ["cherish", "cat", "queens"]
      @array7 = ["god","rat","dog"]

    end
    it "return the word in the array with the highest score." do
      expect(Scrabble::Scrabble.highest_score_from(@array)).to eq "zebra"
    end
    it "return the word in the array with the highest score." do
      expect(Scrabble::Scrabble.highest_score_from(@array2)).to eq "fox"
    end
    it "if words with high scores tied, return word with lowest length" do
      expect(Scrabble::Scrabble.highest_score_from(@array3)).to eq "quip"
    end
    it "if top score tied, choose word with seven letters" do
      expect(Scrabble::Scrabble.highest_score_from(@array4)).to eq "cherish"
    end
    it "if top score tied, choose word with seven letters" do
      expect(Scrabble::Scrabble.highest_score_from(@array6)).to eq "cherish"
    end
    it "if multiple words have equal score and length, select first word listed" do
      expect(Scrabble::Scrabble.highest_score_from(@array5)).to eq "dog"
    end
    it "if multiple words have equal score and length, select first word listed" do
      expect(Scrabble::Scrabble.highest_score_from(@array7)).to eq "god"
    end
  end

end
