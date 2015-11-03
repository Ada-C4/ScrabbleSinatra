require "./lib/score.rb"

describe Scrabble::ScrabbleGame do
  describe "#word as parameter" do
    it "checks if the input is a string" do
      word = "test"
      expect(word).to be_an_instance_of String
    end
  end

  describe "score" do
    it "checks the value of the word 'puppy'" do
      word = "puppy"
      expect(Scrabble::ScrabbleGame.score(word)).to eq 14
    end
    it "checks the value of the word 'huzzah'" do
      word = "huzzah"
      expect(Scrabble::ScrabbleGame.score(word)).to eq 30
    end
    it "checks the value of the word 'cat'" do
      word = "cat"
      expect(Scrabble::ScrabbleGame::score(word)).to eq 5
    end
    it "checks the value of nothing" do
      word = ""
      expect(Scrabble::ScrabbleGame::score(word)).to eq 0
    end
    it "checks that 50 points are added to an 8 letter word" do
      word = "flapjack"
      expect(Scrabble::ScrabbleGame::score(word)).to eq 76
    end

  end
end
