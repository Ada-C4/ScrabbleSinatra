require './lib/scrabble.rb'

describe Scrabble do
  describe Scrabble::Scrabble do

    describe ".score(word)" do
      it "returns the correct point value for a single letter" do
        expect(Scrabble::Scrabble.score("a")).to eq 1
        expect(Scrabble::Scrabble.score("g")).to eq 2
        expect(Scrabble::Scrabble.score("m")).to eq 3
        expect(Scrabble::Scrabble.score("v")).to eq 4
        expect(Scrabble::Scrabble.score("k")).to eq 5
        expect(Scrabble::Scrabble.score("x")).to eq 8
        expect(Scrabble::Scrabble.score("z")).to eq 10
      end
      it "returns the correct point value for a single uppercase letter" do
        expect(Scrabble::Scrabble.score("A")).to eq 1
        expect(Scrabble::Scrabble.score("G")).to eq 2
        expect(Scrabble::Scrabble.score("M")).to eq 3
        expect(Scrabble::Scrabble.score("V")).to eq 4
        expect(Scrabble::Scrabble.score("K")).to eq 5
        expect(Scrabble::Scrabble.score("X")).to eq 8
        expect(Scrabble::Scrabble.score("Z")).to eq 10
      end
      it "returns nil when given an empty String" do
        expect(Scrabble::Scrabble.score("")).to be_nil
      end
      it "does not accept non-string arguments" do
        expect(Scrabble::Scrabble.score(4)).to be_nil
      end
      it "returns the correct point value when given a String argument" do
        expect(Scrabble::Scrabble.score("dog")).to eq 5
        expect(Scrabble::Scrabble.score("friend")).to eq 10
        expect(Scrabble::Scrabble.score("haiku       ")).to eq 12
      end

      it "returns the correct bonus point value when given a 7-letter word" do
        expect(Scrabble::Scrabble.score("holiday")).to eq 64
        expect(Scrabble::Scrabble.score("quality")).to eq 69
      end

      it "returns the correct point value when there are capital letters" do
        expect(Scrabble::Scrabble.score("dOG")).to eq 5
        expect(Scrabble::Scrabble.score("FrienD")).to eq 10
        expect(Scrabble::Scrabble.score("hoLIDay")).to eq 64
        expect(Scrabble::Scrabble.score("QUALITY")).to eq 69
      end

    end

    describe ".highest_score_from_array(array_of_words)" do
      it "returns nil if not passed an array or empty array" do
        expect(Scrabble::Scrabble.highest_score_from_array("")).to be_nil
        expect(Scrabble::Scrabble.highest_score_from_array("hello")).to be_nil
        expect(Scrabble::Scrabble.highest_score_from_array([])).to be_nil
      end

      it "returns the word with the highest score" do
        expect(Scrabble::Scrabble.highest_score_from_array(["dog", "friend", "haiku"])).to eq("haiku")
        expect(Scrabble::Scrabble.highest_score_from_array(["jennie", "jenna"])).to eq("jennie")
      end

      it "will return the 7-letter word in the case of a tie" do
        expect(Scrabble::Scrabble.highest_score_from_array(["qqqqqj", "aaaaaad"])).to eq("aaaaaad")
        expect(Scrabble::Scrabble.highest_score_from_array(["zzzzzx", "qqqqqj", "aaaaaad"])).to eq("aaaaaad")
      end

      it "will return the shorter word in the case of a tie without a 7-letter word" do
        expect(Scrabble::Scrabble.highest_score_from_array(["aa", "d"])).to eq("d")
        expect(Scrabble::Scrabble.highest_score_from_array(["d", "aa"])).to eq("d")
        expect(Scrabble::Scrabble.highest_score_from_array(["strkda", "qi", "hoki"])).to eq("qi")
        expect(Scrabble::Scrabble.highest_score_from_array(["strkda", "hoki"])).to eq("hoki")
      end
    end


  end



end
