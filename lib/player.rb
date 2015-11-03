require "scrabble_class.rb"
require "tile_bag.rb"

module Scrabble

  class Player
    attr_accessor :name, :score, :plays, :score_array, :tiles_array, :tiles


    def initialize(name)
      @name = name
      @score = 0
      @plays = []
      @score_array = []
      @tiles= []
      @tile_bag = TileBag.new
    end


    def play(word)
      if won?
        return false
      else
        @plays.push(word)
      end
    end

    def total_score
      @score = 0
      @plays.each do |word|
        @score += Scrabble.score(word)
      end
      return @score
    end

    def won?
      if @score > 100
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
      raise ArgumentError if (tile_bag.length > 7)
      num_tiles = 7 - tile_bag.length
      tile_bag.push(@tile_bag.draw_tiles(num_tiles))
      return tile_bag.flatten!
    end
  end

 class Player
   attr_accessor :name, :score, :plays, :score_array, :tiles_array, :tiles


   def initialize(name)
     @name = name
     @score = 0
     @plays = []
     @score_array = []
     @tiles= []
     @tile_bag = TileBag.new
   end


   def play(word)
     if won?
       return false
     else
       @plays.push(word)
     end
   end

   def total_score
     @score = 0
     @plays.each do |word|
       @score += Scrabble.score(word)
     end
     return @score
   end

   def won?
     if @score > 100
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
     raise ArgumentError if (tile_bag.length > 7)
     num_tiles = 7 - tile_bag.length
     tile_bag.push(@tile_bag.draw_tiles(num_tiles))
     return tile_bag.flatten!
   end
 end
end
