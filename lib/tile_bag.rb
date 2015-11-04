require "./lib/scrabble"

class TileBag < Scrabble::Scrabble
  def initialize
    @bag = ["b", "b", "c", "c", "f", "f", "p", "p", "v", "v"]
    @dealt_tiles = []
    @default_tiles = draw_tiles(7)
  end


  def draw_tiles(num)
  tiles = @dealt_tiles
    num.times do
      t = @bag.sample
      tiles.push(t)
      remove_tiles(t)
    end
    tiles
  end

  def remove_tiles(letter)
    spot = @bag.index(letter)
    @bag.delete_at(spot)
  end

  def tiles_remaining
    @bag.length
  end
end

#def generate_answer
#  possible_words = ["beef", "onion", "boot", "shoe", "dog", "cat", "fireball", "mandrake"]
#  @answer = possible_words.sample.split("")
#end
