# Create a `TileBag` class with a minimum of 5 specs. It should have the following class and instance methods:
#
require "./lib/scrabble_class.rb"
require "./lib/player_class.rb"

module Scrabble
  class TileBag

    attr_accessor :avaliable_tiles_array, :player_tiles, :total_player_tiles

  # - `self.new` creates an instance with a collection of default tiles
  def initialize
    @avaliable_tiles_array = [?A * 9, ?B * 2, ?C * 2, ?D * 4, ?E * 12, ?F * 2, ?G * 3, ?H * 2, ?I * 9, ?J * 1, ?K * 1, ?L * 4, ?M * 2, ?N * 6, ?O * 8, ?P * 2, ?Q * 1, ?R * 6, ?S * 4, ?T * 6, ?U * 4, ?V * 2, ?W * 2, ?X * 1, ?Y * 2, ?Z * 1].join.split("")
    @total_player_tiles = []
  end

  def draw_tiles(num)
    # returns n number of random tiles
    # removes the tiles from the default set
    if num + @total_player_tiles.length > 7
      num = 7 - @total_player_tiles.length
    end
    @player_tiles = []
    num.times do
      letter = @avaliable_tiles_array[rand(@avaliable_tiles_array.length)]
      @player_tiles.push(letter)
      @avaliable_tiles_array.slice!(@avaliable_tiles_array.index(letter))
      @total_player_tiles += @player_tiles
    end
  end

  def tiles_remaining
  # - `#tiles_remaining` returns the number of tiles remaining in the bag
    return @avaliable_tiles_array.length
  end

  end #TileBag class
end #Scrabble module
