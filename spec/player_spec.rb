require "./lib/player"

describe ScrabbleMod do
  describe ScrabbleMod::Player do
    before :each do
      @player = ScrabbleMod::Player.new(@name)
    end

    describe "#self.new" do
      it "creates a new instance" do
        expect(@player).to be_an_instance_of ScrabbleMod::Player
      end
      it "has a name when initialized" do
        expect(@player.name).to eq @name
      end
    end

    describe "#name" do
      it "returns the name of the Player" do
        expect(@player.name).to eq @name
      end
    end

    describe "#plays" do
      it "returns an array" do
        expect(@player.plays).to be_kind_of(Array)
      end
    end

    describe "#play(word)" do
      it "returns false if a player has already won" do
        @player.won = true
        expect(@player.play(@word)).to be false
      end
      it "adds the input word to the plays array" do
        @player.plays = [@word,@word1,@word2]
        expect(@player.play(@word4)).to eq [@word,@word1,@word2,@word4]
      end
    end

    describe "#total_score" do
      it "returns an integer" do
        expect(@player.total_score).to be_kind_of(Fixnum)
      end
      it "returns a correctly totaled score" do
        @player.plays = ["cat","dog","mouse"]
        expect(@player.total_score).to eq 17
      end
    end

    describe "#won?" do
      it "returns true if the player has over 100 points" do
        @player.plays = ["zzzzz","qqqqq","cat"]
        expect(@player.won?).to be true
      end
      it "returns false if the player has 100 or fewer points" do
        @player.plays = ["cat","dog","mouse"]
        expect(@player.won?).to be false
      end
    end

    describe "#highest_scoring_word" do
      it "returns the highest scoring word the user has played" do
        @player.plays = ["cat","dog","mouse"]
        expect(@player.highest_scoring_word).to eq "mouse"
      end
      it "returns a string" do
        @player.plays = ["cat","dog","mouse"]
        expect(@player.highest_scoring_word).to be_kind_of(String)
      end
    end

    describe "#highest_word_score" do
      it "returns a number" do
        @player.plays = ["cat","dog","mouse"]
        expect(@player.highest_word_score).to be_kind_of(Fixnum)
      end
      it "returns the score of the highest-scoring word in the array" do
        @player.plays = ["cat","dog","mouse"]
        expect(@player.highest_word_score).to eq 7
      end

      describe "#tiles" do
        it "returns an array" do
          expect(@player.tiles).to be_kind_of(Array)
        end
        it "has no more than seven items in the array" do
          expect(@player.tiles.length).to be <= 7
        end
      end

      describe "#draw_tiles(tilebag)" do
        before :each do
          @tilebag = ScrabbleMod::TileBag.new
        end
        it "returns an array" do
          expect(@player.draw_tiles(@tilebag)).to be_kind_of(Array)
        end
        it "has no more than seven items in the array" do
          expect(@player.draw_tiles(@tilebag).length).to be <= 7
        end
      end
      
    end
  end
end
