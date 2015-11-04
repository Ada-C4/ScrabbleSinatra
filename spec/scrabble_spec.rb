require "spec_helper"
require "./lib/scrabble_master"

describe Scrabble do
  describe "self.score(letter)" do
    it "assigns a value of 1 to letter A" do
      expect(Scrabble::Scrabble.score("A")).to eq 1
    end
    it "assigns a value of 2 to letter D" do
      expect(Scrabble::Scrabble.score("D")).to eq 2
    end
    it "assigns a value of 3 to the letter B" do
      expect(Scrabble::Scrabble.score("B")).to eq 3
    end
    it "assigns a value of 4 to the letter F" do
      expect(Scrabble::Scrabble.score("F")).to eq 4
    end
    it "assigns a value of 5 to the letter K" do
      expect(Scrabble::Scrabble.score("K")).to eq 5
    end
    it "assigns a value of 8 to the letter J" do
      expect(Scrabble::Scrabble.score("J")).to eq 8
    end
    it "assigns a value of 10 to the letter Q" do
      expect(Scrabble::Scrabble.score("Q")).to eq 10
    end
  end
  describe "self.score(word)" do
    it "assigns a score of 8 for 'word'" do
      expect(Scrabble::Scrabble.score("word")).to eq 8
    end
    it "adds 50 points to 7 letter words" do
      expect(Scrabble::Scrabble.score("oranges")).to eq 58
    end
  end
  describe "self.highest_score_from(array_of_words)" do
    it "returns word with highest score from two word array with different scores and different length" do
      expect(Scrabble::Scrabble.highest_score_from(["cat","word"])).to eq "word"
    end
    it "returns first word with highest score from two word array with tied scores and same length" do
      expect(Scrabble::Scrabble.highest_score_from(["cat", "dog"])).to eq "cat"
    end
    it "returns first word with highest score from three word array with second two words highest scores and same length" do
      expect(Scrabble::Scrabble.highest_score_from(["a", "dog","cat"])).to eq "dog"
    end
    it "returns shortest word with highest score from an array of two words with tied scores and different length" do
      expect(Scrabble::Scrabble.highest_score_from(["word","yap"])).to eq "yap"
    end
    it "returns 7 letter word if tied with a shorter word in score" do
      expect(Scrabble::Scrabble.highest_score_from(["word","oranges"])).to eq "oranges"
    end
    it "returns the first 7 letter word in the list if tied with another 7 letter word" do
      expect(Scrabble::Scrabble.highest_score_from(["word","stirred","oranges"])).to eq "stirred"
    end
    it "returns the highest scoring word, even if there is a 7 letter word of lower score" do
      expect(Scrabble::Scrabble.highest_score_from(["word","stirred","oranges","joke"])).to eq "stirred"
    end
    it "returns the highest score word of 6 letters, even if there is a 7 letter word" do
      expect(Scrabble::Scrabble.highest_score_from(["aaaaaaa","zzzzzz"])).to eq "zzzzzz"
    end
  end
end
