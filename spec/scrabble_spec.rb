 require "./lib/scrabble_class.rb"
 require "spec_helper"

describe Scrabble::Scrabble do

  describe  "#letter?" do
   it "returns nil input is not a letter" do
   expect(Scrabble::Scrabble.letter?(9)).to eq nil
    end
  end

  describe "#score" do
    it "return a score 9 for the word 'apple'" do
      expect(Scrabble::Scrabble.score("apple")).to equal 9
    end
    it "return an error if gets nothing" do #change to error ?
      expect{Scrabble::Scrabble.score(nil)}.to raise_error(ArgumentError)
    end
    it "return error when it's not a letter" do
      expect{Scrabble::Scrabble.score(9)}.to raise_error(ArgumentError) # check
    end
  end


  describe "#letter_value" do
    it "return the value of the letter 'A'" do
      expect(Scrabble::Scrabble.letter_value("a")).to eq(1)
    end
    it "return the value of the letter 'D'" do
      expect(Scrabble::Scrabble.letter_value("d")).to eq(2)
    end
    it "return the value of the letter 'B'" do
      expect(Scrabble::Scrabble.letter_value("b")).to eq(3)
    end
    it "return the value of the letter 'F'" do
      expect(Scrabble::Scrabble.letter_value("f")).to eq(4)
    end
    it "return the value of the letter 'K'" do
      expect(Scrabble::Scrabble.letter_value("k")).to eq(5)
    end
    it "return the value of the letter 'J'" do
      expect(Scrabble::Scrabble.letter_value("j")).to eq(8)
    end
    it "return the value of the letter 'Q'" do
      expect(Scrabble::Scrabble.letter_value("q")).to eq(10)
    end
  end

  describe "#highest_score_from" do

    it 'only includes strings' do
      word_array = ["aaa", "bbb", "zzz", 9]
      expect{Scrabble::Scrabble.highest_score_from(word_array)}.to raise_error(ArgumentError)
    end
    it 'finds highest score value' do
      word_array = ["aaa", "bbb", "zzz"]
      high_score = Scrabble::Scrabble.highest_score_from(word_array)
      expect(high_score).to eq("zzz")
    end
    it 'chooses shortest word in tie' do
      word_array = ["aaa", "zzkk", "zzz"]
      high_score = Scrabble::Scrabble.highest_score_from(word_array)
      expect(high_score).to eq("zzz")
    end
    it 'applies bonus to seven letter word' do
      word_array = ["aaaaaaa", "zzkk", "zzz"]
      high_score = Scrabble::Scrabble.highest_score_from(word_array)
      expect(high_score).to eq("aaaaaaa")
    end
    it 'chooses first word in a same-length tie' do
      word_array = ["aaaa", "qqq", "zzz"]
      high_score = Scrabble::Scrabble.highest_score_from(word_array)
      expect(high_score).to eq("qqq")
    end
    it 'in a tie seven letter word wins' do
      word_array = ["aaaaaaa", "fk", "zzz"]
      high_score = Scrabble::Scrabble.highest_score_from(word_array)
      expect(high_score).to eq("aaaaaaa")
    end
  end

end
