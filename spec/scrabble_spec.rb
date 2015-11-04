require "./lib/scrabble"

describe ScrabbleMod do
  describe ScrabbleMod::Scrabble do
  before :each do
    @word = "abba"
    @number = 93
    @float = 1.5
    @array = [1,2,3]
    @array_of_words = ["ab","baaaaaaa", "aabbaa"]
    @array_of_words2 = ["aaaaaaa", "abb"]
    @array_of_words3 = ["ab", "abb", "bba"]
    @array_of_words4 = ["ab", "aaabaaa", "baaaaaa"]
  end

  describe "#self.score" do
    it "returns an integer" do
      expect(ScrabbleMod::Scrabble.score(@word)).to be_kind_of(Fixnum)
    end
    it "accepts only a string" do
      expect(ScrabbleMod::Scrabble.score(@word)).to be_kind_of(Fixnum)
      expect(ScrabbleMod::Scrabble.score(@number)).to eq "Error message"
      expect(ScrabbleMod::Scrabble.score(@float)).to eq "Error message"
      expect(ScrabbleMod::Scrabble.score(@array)).to eq "Error message"
    end
    it "correctly scores a word" do
      expect(ScrabbleMod::Scrabble.score(@word)).to eq 8
    end
  end

  describe "#self.highest_score_from" do
    it "returns a string" do
      expect(ScrabbleMod::Scrabble.highest_score_from(@array_of_words)).to be_kind_of(String)
    end
    it "selects word with 7 letters in case of tie" do
      expect(ScrabbleMod::Scrabble.highest_score_from(@array_of_words2)).to eq "aaaaaaa"
    end
    it "selects word with fewest letters in case of tie, unless one of words has 7 letters" do
      expect(ScrabbleMod::Scrabble.highest_score_from(@array_of_words)).to eq "aabbaa"
    end
    it "in case of score and word length tie, selects first word provided" do
      expect(ScrabbleMod::Scrabble.highest_score_from(@array_of_words3)).to eq "abb"
    end
    it "in case of two 7-letter words with same score, returns first 7-letter word provided" do
      expect(ScrabbleMod::Scrabble.highest_score_from(@array_of_words4)).to eq "aaabaaa"
    end

  end
end
end

describe "SCORES" do
  it "matches keys with values" do
    expect(ScrabbleMod::SCORES[:a]).to eq 1
  end
end
