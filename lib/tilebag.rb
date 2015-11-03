require 'pry'
require './lib/player.rb'

module Scrabble

  class TileBag

  attr_accessor :quantity

    def initialize

      @quantity = {}

      @quantity["a"] = 9
      @quantity["b"] = 2
      @quantity["c"] = 2
      @quantity["d"] = 4
      @quantity["e"] = 12
      @quantity["f"] = 2
      @quantity["g"] = 3
      @quantity["h"] = 2
      @quantity["i"] = 9
      @quantity["j"] = 1
      @quantity["k"] = 1
      @quantity["l"] = 4
      @quantity["m"] = 2
      @quantity["n"] = 6
      @quantity["o"] = 8
      @quantity["p"] = 2
      @quantity["q"] = 1
      @quantity["r"] = 6
      @quantity["s"] = 4
      @quantity["t"] = 6
      @quantity["u"] = 4
      @quantity["v"] = 2
      @quantity["w"] = 2
      @quantity["x"] = 1
      @quantity["y"] = 2
      @quantity["z"] = 1
    end

# turn @quantity into an array, shuffle, pop, and return x amount of letters

    def draw_tiles(num)
      if num > 7
        return []
      else
      letters_array = []
        num.times do
        letters_array.push(@quantity.keys.shuffle.pop)
        end
        letters_array.each do |letter|
          @quantity[letter] -= 1
        end
        return letters_array
      end
    end

    def tiles_remaining
      sum = @quantity.values.inject(0) {|sum, value| sum + value}
      sum
    end
  end
end
