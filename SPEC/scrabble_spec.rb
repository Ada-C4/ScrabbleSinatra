require "./lib/scrabble_module"

describe Scrabble::Scrabble do

  describe "self.score(word)" do
    it "returns 1 for A" do
      expect(Scrabble::Scrabble.score("A")).to eq 1
    end
    it "returns 8 for HELLO" do
      expect(Scrabble::Scrabble.score("HELLO")).to eq 8
    end
    it "returns 8 for hello" do
      expect(Scrabble::Scrabble.score("hello")).to eq 8
    end
  end

  describe "self.highest_score_from(array_of_words)" do
    it "returns zoo from [eat, zoo, star]" do
      expect(Scrabble::Scrabble.highest_score_from(["eat", "zoo", "star"])).to eq "zoo"
    end
    it "returns dog from [dog, stars, sun, to]" do
      expect(Scrabble::Scrabble.highest_score_from(["dog", "stars", "sun", "to"])).to eq "dog"
    end
    it "returns clovers from [zoo, clovers, to, rotates]" do
      expect(Scrabble::Scrabble.highest_score_from(["zoo", "clovers", "to", "rotates"])).to eq "clovers"
    end
    it "returns zzzzzz from [aaaaag, zzzzzz, zzzzzx]" do
      expect(Scrabble::Scrabble.highest_score_from(["aaaaaag", "zzzzzz", "zzzzzx"])).to eq "zzzzzz"
    end
    it "returns aaaaaag from [aaaaag, zzzzzx]" do
      expect(Scrabble::Scrabble.highest_score_from(["aaaaaag", "zzzzzx"])).to eq "aaaaaag"
    end
    it "returns star from [star, suns, real]" do
      expect(Scrabble::Scrabble.highest_score_from(["star", "suns", "real"])).to eq "star"
    end
    it "returns star from [sun, to, star, suns]" do
      expect(Scrabble::Scrabble.highest_score_from(["sun", "to", "star", "suns"])).to eq "star"
    end
  end
end
