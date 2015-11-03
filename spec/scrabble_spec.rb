require "./lib/scrabble"
describe Scrabble::Scrabble do
  before :each do
    @game = Scrabble::Scrabble.new
    @letter = "l"
    @word = "cat"
    @word_7 = "Meighan"
    @array_of_words = ["zebra", "cat", "dog"]
    @array_of_words_tie = ["dog", "talle", "a"]
    @array_of_words_length_tie = ["dog", "cat", "a"]
    @hash = {"zebra"=>16, "cat"=>5, "dog"=>5}
  end
  describe ".new" do
    it "creates a new instance" do
      expect(@game).to be_an_instance_of Scrabble::Scrabble
    end
  end
  describe ".self.make_value_array(word)" do
    it "returns an array of letter values" do
      expect(Scrabble::Scrabble.make_value_array(@word)).to eq [3, 1, 1]
    end
  end

  describe ".self.score(word)" do
    it "totals the elements of the array" do
      expect(Scrabble::Scrabble.score(@word)).to eq 5
    end
    it "returns score + 50 if word is 7 letters" do
      expect(Scrabble::Scrabble.score(@word_7)).to eq 63
    end
  end
  describe "self.create_word_score_hash(array_of_words)" do
    it "returns a hash of word: value pairs" do
      expect(Scrabble::Scrabble.create_word_score_hash(@array_of_words)).to eq @hash
    end
  end
  describe "self.highest_score_from(array_of_words)" do
    it "returns key if there's not a tie" do
      expect(Scrabble::Scrabble.highest_score_from(@array_of_words)).to eq "zebra"
    end
    it "returns key with shortest length if there's a tie" do
      expect(Scrabble::Scrabble.highest_score_from(@array_of_words_tie)).to eq "dog"
    end
    it "returns first key if there's a tie and both words have the same length" do
      expect(Scrabble::Scrabble.highest_score_from(@array_of_words_length_tie)).to eq "dog"
    end
  end
end
