require "./lib/player.rb"
require "./lib/scrabble.rb"
require "./lib/dictionary.rb"

describe Scrabble do
  describe Scrabble::Dictionary do
    before :each do
      @dict = Scrabble::Dictionary.new
    end

    describe "#initialize" do
      it "creates a new dictionary" do
        expect(@dict).to be_an_instance_of(Scrabble::Dictionary)
      end
      it "has a default language of English" do
        expect(@dict.language).to eq(:english)
      end
    end

    describe "#check_word(word)" do
      it "returns true when the word exists" do
        expect(@dict.check_word("brew")).to be true
      end
      it "returns false when the word does not exist" do
        expect(@dict.check_word("nopeeeee")).to be false
      end

    end

  end


end
