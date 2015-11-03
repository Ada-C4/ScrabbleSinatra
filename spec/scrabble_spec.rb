require "spec_helper"
require "./lib/scrabble"

describe Scrabble do
  before :each do
    @scrabble = Scrabble::Scrabble.new

  end

  describe "#letter_score" do
    it "scores the letter a" do
      expect(@scrabble.letter_score("a")).to eq 1
    end

    #it "scores the letter e" do
    #  expect(@scrabble.letter_score("e")).to eq 1
    #end

    it "scores the letter m" do
      expect(@scrabble.letter_score("m")).to eq 3
    end

    it "scores the letter b" do
      expect(@scrabble.letter_score("b")).to eq 3
    end

    it "scores the letter c" do
      expect(@scrabble.letter_score("c")).to eq 3
    end

    it "scores the letter p" do
      expect(@scrabble.letter_score("p")).to eq 3
    end
  end

  describe "#word_score" do
    it "iterates through letters and changes them to integers" do
      expect(@scrabble.word_score("Me")).to eq 4
    end
  end

  describe "#highest_word_score" do
    it "call that index on word_array" do
    expect(@scrabble.highest_word_score("aei, b, e")).to eq " b"
    end
  end
end
