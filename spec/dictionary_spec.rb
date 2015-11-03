require "./lib/dictionary"

describe ScrabbleMod do
  describe ScrabbleMod::Dictionary do
    before :each do
      @dictionary = ScrabbleMod::Dictionary.new
    end

    describe "#find_word" do
      it "checks to see if a word is valid" do
        expect(@dictionary.find_word("cat")).to be true
        expect(@dictionary.find_word("xylophone")).to be true
        expect(@dictionary.find_word("omnipotent")).to be true
        expect(@dictionary.find_word("zzzzzz")).to be false
        expect(@dictionary.find_word("basdfjhasduifhaksdf")).to be false
        expect(@dictionary.find_word("1234")).to be false
      end
      it "returns false if input is not a string" do
        expect(@dictionary.find_word(12234)).to be false
        expect(@dictionary.find_word(3.14159)).to be false
        expect(@dictionary.find_word(ScrabbleMod::Player.new("me"))).to be false
        expect(@dictionary.find_word(["hey","you"])).to be false
      end
    end
  end
end
