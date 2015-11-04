require "./lib/scrabble_class.rb"
require "./lib/tilebag_class.rb"

module Scrabble
  class Player
    attr_accessor :name

    def initialize(name)
      @name = name
      @played_words_array = []
      @total_score = 0
      @high_score = 0
      @high_scoring_word = "HEY"
    end

    def plays
       # returns an array of the words played by the player
      return @played_words_array
    end

    def play(word)
      if self.won?   # returns false if the player has already won.
        return false
      else
        @played_words_array.push(word)  # add input word (parameter) to the plays array.
        word_score = Scrabble.score(word)# call the score method on the scrabble class and pass it (word)
        @total_score += word_score
        if word_score > @high_score
          @high_scoring_word = word
          @high_score = word_score
        end
      end
    end

    def total_score
      return @total_score
      # sums up score
      # returns the score of the players words
    end

    def won?
      # if the player has over 100 points, return true
      # otherwise, return false
      if @total_score > 100
        return true
      else
        return false
      end
    end

    def highest_scoring_word
      return @high_scoring_word
    end

    def highest_word_score
      return @high_score
    end

    # and add to the `Player` class the following instance methods:

    def tiles(bag)
      return bag.total_player_tiles
    end
    # - `#tiles` a collection of letters that the player can play (max 7)

    def draw_tiles(tile_bag)
      tile_bag.draw_tiles(7)
    end
    # - `#draw_tiles(tile_bag)` fills tiles array until it has 7 letters from the given tile bag


  end
end
