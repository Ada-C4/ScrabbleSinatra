module ScrabbleMod
  class TileBag
    attr_accessor :tile_array, :total_tiles
    def initialize
      # @tilehash = {
      #   a: 9,
      #   b: 2,
      #   c: 2,
      #   d: 4,
      #   e: 12,
      #   f: 2,
      #   g: 3,
      #   h: 2,
      #   i: 9,
      #   j: 1,
      #   k: 1,
      #   l: 4,
      #   m: 2,
      #   n: 6,
      #   o: 8,
      #   p: 2,
      #   q: 1,
      #   r: 6,
      #   s: 4,
      #   t: 6,
      #   u: 4,
      #   v: 2,
      #   w: 2,
      #   x: 1,
      #   y: 2,
      #   z: 1
      # }

      @tile_array = ["a", "a","a","a","a","a","a","a","a", "b",
        "b", "c", "c", "d", "d", "d", "d", "e","e",
        "e","e","e","e","e","e","e","e","e","e","f",
        "f", "g", "g", "g", "h", "h", "i","i","i","i",
        "i","i","i","i","i","j","k", "l", "l", "l", "l",
        "m", "m", "n","n","n","n","n","n","o","o","o",
        "o","o","o","o","o","p", "p", "q","r","r","r",
        "r","r","r","s","s","s","s","t","t","t","t","t",
        "t","u","u","u","u","v","v","w","w","x","y", "y","z"]

      @total_tiles = @tile_array.length

    end

    def draw_tiles(num)
      current_turn = []

      if num.is_a? Fixnum
        num.times do
          rand_tile_index = rand(0..(@total_tiles-1))
          current_turn.push(@tile_array[rand_tile_index])
          @tile_array.delete_at(rand_tile_index)
          @total_tiles = @tile_array.length
        end

        return current_turn

      else
        return "Error message"
      end
    end

    def tiles_remaining
      return @total_tiles
    end
  end
end
