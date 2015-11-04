module Scrabble
DEFAULT_TILES = {A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1, K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1}
  class TileBag
   attr_reader :tile_quantities
    def initialize
      @tile_quantities = DEFAULT_TILES.dup
    end
    def draw_tiles(num)
      drawn_tiles = []
      if num > self.tiles_remaining
        puts "Not enough tiles to pull #{num} tiles!"
      else
        key_array = @tile_quantities.keys
        num.times do
          rand_letter = key_array[rand(0..(key_array.length - 1))]
          drawn_tiles.push(rand_letter)
            @tile_quantities[rand_letter] -= 1
            if @tile_quantities[rand_letter] == 0
              @tile_quantities.delete(rand_letter)
            end
            key_array = @tile_quantities.keys
          end
      end
      return drawn_tiles
    end
    def tiles_remaining
      total_tiles = 0
      @tile_quantities.values.each do |value|
        total_tiles += value
      end
      return total_tiles
    end
  end
end
