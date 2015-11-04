require "spec_helper"
require './lib/scrabble.rb'

describe Scrabble do
  before :each do
    @scrabble = Scrabble.new
  end

  describe "#new" do
    it "create a new instance of Scrabble" do
      expect(@scrabble).to be_an_instance_of Scrabble
    end
  end

  describe "#score" do
    before :each do
      @guess_word = "rabbit"
      @guess_word2 = "snake"
      @guess_word3 = "it"
      @guess_word_long = "dragons"
      @guess_word_number = "169"
      @guess_word_integer = 169
      @array = [@guess_word3, @guess_word2, @guess_word]
    end

    it "checks if the input is a string" do
      expect { Scrabble.score(@guess_word_integer) }.to raise_error (ArgumentError)
    end

    it "checks input is alphabetical" do
      expect { Scrabble.score(@guess_word_number) }.to raise_error (ArgumentError)
    end

    it "returns a numeric score" do
      expect(Scrabble.score(@guess_word)).to be_a Fixnum
    end

    it "scores the words according to rules" do
      expect(Scrabble.score(@guess_word)).to eq 10
    end

    # it "adds new words to player_words array" do
    #   @scrabble.score(@guess_word)
    #   #@scrabble.score(@guess_word2)
    #   expect(@scrabble.player_words).to eql [@guess_word]
    # end

    it "adds 50 points to seven letter words" do
      expect(Scrabble.score(@guess_word_long)).to eq 59
    end
  end

  describe "#highest_score_from" do
    before :each do
      @guess_word = "rabbit"
      @guess_word2 = "snake"
      @guess_word3 = "it"
      @guess_word4 = "kk"
      @guess_word5 = "z"
      @array_for_score = [@guess_word3, @guess_word2, @guess_word]
    end

    it "returns word from array with the highest score" do
      expect(Scrabble.highest_score_from(@array_for_score)).to eq @guess_word
    end

    it "returns word with fewer tiles if tie" do
      @array2 = [@guess_word3, @guess_word2, @guess_word4, @guess_word5, @guess_word]
      expect(Scrabble.highest_score_from(@array2)).to eq @guess_word5
    end

    it "returns a 7 letter word if one is played" do
      @guess_word1 = "zzzzzx"
      @quess_word2 = "jjjjjj"
      @guess_word_7_letters = "dragons"
      @array = [@guess_word1, @guess_word2, @guess_word_7_letters]
      expect(Scrabble.highest_score_from(@array)).to eq @guess_word_7_letters
    end
  end
end
