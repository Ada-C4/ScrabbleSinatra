class TileBag
  attr_accessor :tile_hash, :tile_bag
  def initialize
    @tile_hash = {
      A: 9,
      B: 2,
      C: 2,
      D: 4,
      E: 12,
      F: 2,
      G: 3,
      H: 2,
      I: 9,
      J: 1,
      K: 1,
      L: 4,
      M: 2,
      N: 6,
      O: 8,
      P: 2,
      Q: 1,
      R: 6,
      S: 4,
      T: 6,
      U: 4,
      V: 2,
      W: 2,
      X: 1,
      Y: 2,
      Z: 1
    }
    @tile_bag = []
    #@tile_tray = []
    self.make_tiles
  end

#makes an instance of a tile_bag that initially includes all the letters possible in the game
  def make_tiles
    @tile_bag = []
   @tile_hash.each do |key, value|
      value.times do
        @tile_bag.push(key.to_s)
      end
    end
    return @tile_bag
  end

#returns an array of num (the parameter) new tiles drawn by choosing a random number for the tile_bag index
  def draw_tiles(num)
    new_tiles = []
    num.times do
      random_num = rand(0..@tile_bag.length)
      new_tiles.push(@tile_bag[random_num])
      @tile_bag.delete_at(random_num)
    end
    return new_tiles
  end

#returns how many tiles are left in the tile_bag array
  def tiles_remaining
    return @tile_bag.length
  end
end
