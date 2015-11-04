require "./lib/scrabble_module"
module Scrabble
  class Player
    attr_reader :name, :total_score
    attr_accessor :tiles

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
      @tiles = []
    end

    def plays
      return @plays
    end

    def play(word)
      @plays.push(word)
      @total_score += Scrabble.score(word)
      if won?
        return false
      end
    end

    def won?
      if @total_score > 100
        return true
      else
        return false
      end
    end

    def highest_scoring_word
      return Scrabble.highest_score_from(@plays)
    end

    def highest_word_score
      return Scrabble.score(highest_scoring_word)
    end

    def draw_tiles(tile_bag)
      tiles_array = tile_bag.draw_tiles(7 - @tiles.length)
      tiles_array.each do |tile|
        @tiles.push(tile)
      end
    end
  end
end
