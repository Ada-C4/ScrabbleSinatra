require './lib/scrabble_class.rb'

describe Scrabble do
  describe ".letter_score" do
    it "should be three points" do
      expect(Scrabble::Scrabble.letter_score("M")).to eq 3
    end
    it "should be 8 for peanut" do
      expect(Scrabble::Scrabble.score("PEANUT")).to eq 8
    end
    it "should give 10 points for Z" do
      expect(Scrabble::Scrabble.score("Z")).to eq 10
    end
    it "gives a 50 point bonus for using 7 letters" do
      expect(Scrabble::Scrabble.score("QUANTUM")).to eq 68
    end
    it "returns QUIZ" do
      expect(Scrabble::Scrabble.highest_score_from(["QUIZ", "CAT"])).to eq "QUIZ"
    end
    it "returns ZQZQZQ (60 points)" do
      expect(Scrabble::Scrabble.highest_score_from(["AAAAAAG", "ZQZQZQ"])).to eq "ZQZQZQ"
    end
    it "the score is tied between a 7 letter and non 7 letter word, return the 7 letter word" do
      expect(Scrabble::Scrabble.highest_score_from(["ZZZZZX", "LOLOLOG"])).to eq "LOLOLOG"
    end
    it "returns the shorter word when the scores are tied" do
      expect(Scrabble::Scrabble.highest_score_from(["ELBOWW", "ZAM"])).to eq "ZAM"
    end
    it "returns the first word in array if both length and score are equal" do
      expect(Scrabble::Scrabble.highest_score_from(["AEI", "IOU", "RLS"])).to eq "AEI"
    end
  end
end
