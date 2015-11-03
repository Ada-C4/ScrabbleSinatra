require "./lib/scrabble.rb"
require "./lib/player.rb"

module Scrabble
  class TileBag
    attr_reader :tiles

    def initialize()
      @tiles = ["a", "a", "a", "a", "a", "a", "a", "a", "a", "b", "b", "c", "c", "d", "d", "d", "d", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "f", "f", "g", "g", "g", "h", "h", "i", "i", "i", "i", "i", "i", "i", "i", "i", "j", "k", "l", "l", "l", "l", "m", "m", "n", "n", "n", "n", "n", "n", "o", "o", "o", "o", "o", "o", "o", "o", "p", "p", "q", "r", "r", "r", "r", "r", "r", "s", "s", "s", "s", "t", "t", "t", "t", "t", "t", "u", "u", "u", "u", "v", "v", "w", "w", "x", "y", "y", "z"]
    end

    def draw_tiles(num)
      @tiles.shuffle!
      letters = []
      if num > 0 && num < 7
        num.times do
          letters.push(@tiles.pop)
        end
      end
      return letters
    end

    def tiles_remaining
      @tiles.length
    end

  end


end
