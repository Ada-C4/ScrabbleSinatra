require './lib/player_class.rb'
require './lib/tilebag_class.rb'
require './lib/scrabble_class.rb'
require './lib/dictionary_class.rb'


# minimum of 11 specs
describe Scrabble::Player do

    before :each do # (Before each thing I do, create a new player)
      @bag = Scrabble::TileBag.new
      @bag.draw_tiles(3)
      @player1 = Scrabble::Player.new("Logan")
    end

    describe ".new" do
      it "creates a new instance of Player" do
        expect(@player1).to be_an_instance_of Scrabble::Player
      end
    end

    describe "name" do
      it "will return the name passed in the initialize (Logan)" do
        expect(@player1.name).to eq "Logan"
      end
    end

    describe "plays" do
      it "returns an array of the words played by the player" do
        expect(@player1.plays).to be_an Array
      end
    end

    describe "play(word) method" do
      before :each do
        @player1.play("CAT")
        @player1.play("WORD")
      end
      it "adds the player's guessed word to the played_words_array" do
        expect(@player1.plays.include?("CAT")).to be_truthy
      end
      it "returns false if the player has already won" do
        if @player1.won?
          expect(@player1.play("WORD")).to be_falsey
        end
      end
      it "returns the total score of all words played" do
        expect(@player1.total_score).to eq 13
      end
    end

    describe "won?" do
      it "player has won" do
        @player1.play("ZEBRA")
        @player1.play("QUIZ")
        @player1.play("ZZZZZZZ")
        expect(@player1.won?).to eq true
      end
    end

    describe "highest_scoring_word" do
      it "returns the highest scoring word the user has played" do
        @player1.play("HEY")
        @player1.play("ZEBRA")
        expect(@player1.highest_scoring_word).to eq "ZEBRA"
      end
    end


    describe "highest_word_score" do
      it "returns the highest score user has played" do
        @player1.play("ZEBRA")
        @player1.play("QUIZ")
        expect(@player1.highest_word_score).to eq 22
      end
    end

    describe "tiles" do
      it "returns an array of letters" do
        expect(@player1.tiles(@bag)).to be_an Array
      end
      it "array of letters is less than or equal to 7" do
        expect(@player1.tiles(@bag).length).to be <= 7
      end
    end
    describe "draw_tiles" do
      it "fills the total number of tiles avaliable to 7" do
        @player1.draw_tiles(@bag)
        expect(@player1.tiles(@bag).length).to be == 7
      end
    end

    describe "word_in_dictionary from dictionary class" do

      it "should reject a non-word" do
        expect(Scrabble::Dictionary.word_in_dictionary("ZZZZ")).to be_falsey
      end
      it "should not reject a valid word" do
        expect(Scrabble::Dictionary.word_in_dictionary("APPLE")).to be_truthy
      end

    end
end
