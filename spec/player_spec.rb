require "./lib/player.rb"
# require "./lib/highest_score.rb"

describe Scrabble::Player do
  before :each do
    @bob = Scrabble::Player.new("Bob")
    @tilebag = Scrabble::TileBag.new
  end

  describe ".new" do
    it "Creates a new instance of a player" do
      expect(@bob).to be_an_instance_of Scrabble::Player
    end
  end

  describe "name" do
    it "Returns the name initialized at the beginning of the game" do
    expect(@bob.name).to eq "Bob"
    end
  end

  describe "words_played" do
    it "Returns an empty array when the player has not played an words (@words_played)" do
      expect(@bob.words_played).to eq []
    end
  end

  describe "play_word" do
    before :each do
      @word = "test"
    end
    it "adds a single word to the empty @words_played array" do
      expect(@bob.play_word(@word)).to eq ["test"] #changed this line to refer to instance
    end
  end

  describe "play_word" do
    before :each do
      @word = "test"
      @bob.words_played = ["porcupine", "bottle"]
    end
    it "adds an additional word a non-empty @words_played array" do
      expect(@bob.play_word(@word)).to eq ["porcupine", "bottle", "test"] #changed this line to refer to instance
    end
  end


  describe "play_word if already won" do
    before :each do
      @bob.player_score = 110
      @word = "test"
    end
    it "Tells you that player won if that is the case" do
      expect(@bob.play_word(@word)).to eq "player won"
    end
  end

  describe "player_score" do
    before :each do
      @bob.words_played = ["aa", "bb", "zz"] #28 total
    end
    it "Sums the scores from @words_played" do
      expect(@bob.total_score).to eq 28
    end
  end

  describe "highest_scoring_word" do
    before :each do
      @bob.words_played = ["aa", "jgjg", "zz"]
    end
    it "Returns the highest scoring word" do
      expect(@bob.highest_scoring_word).to eq "zz"
    end
  end

  describe "highest_scoring_word" do
    before :each do
      @bob.words_played = ["aaaaaa", "jgjg", "zz"]
    end
    it "Shorter words are considered higher scoring when there is a tie" do
      expect(@bob.highest_scoring_word).to eq "zz"
    end
  end

  describe "highest_word_score" do
    before :each do
      @bob.words_played = ["aa", "jgjg", "zz"]
    end
    it "Returns the highest scoring word's score" do
      expect(@bob.highest_word_score).to eq 20
    end
  end

  describe "highest_word_score" do
    before :each do
      @bob.words_played = ["aa", "jgjg", "flapjack"]
    end
    it "Eight letter words get 50 extra points" do
      expect(@bob.highest_word_score).to eq 76
    end
  end

  describe "tiles" do
    it "Tiles is an instance variable is created on player instatiation" do
      expect(@bob.tiles).to eq []
    end
  end
  #
  describe "draw_tiles" do
    before :each do
      @bob.draw_tiles(@tilebag)
    end
    it "Fills player's tiles array with the given number of tiles, starting from an empty @tiles" do
      expect(@bob.tiles.length).to eq 7
    end
  end

  describe "draw_tiles" do
    before :each do
      @bob.tiles = ["x", "x"]
      @bob.draw_tiles(@tilebag)
    end
    it "Fills player's tiles array with the given number of tiles, starting from a non-empty @tile" do
      expect(@bob.tiles.length).to eq 7
    end
    it "Removes the same number of tiles from the tile bag" do
      expect(@tilebag.tiles_remaining).to eq 93
    end
  end

  describe "draw_tiles" do
    before :each do
      @bob.tiles = ["x", "x", "x", "x", "x", "x", "x"]
      @bob.draw_tiles(@tilebag)
    end
    it "@tiles remains the same if it is already full" do
      expect(@bob.tiles).to eq ["x", "x", "x", "x", "x", "x", "x"]
    end
  end
end
