module Scrabble
  class Player
    attr_reader :name, :plays, :tiles, :bag

    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
      @bag = nil
    end


    def play(word)
      if won? == true
        return false
      else
        @plays.push(word)
      end
    end

    def total_score
      total = 0
      @plays.each do |word|
        total += Scrabble.score(word)
      end
      return total
    end

    def highest_scoring_word
      Scrabble.highest_score_from(@plays)
    end

    def highest_word_score
      Scrabble.score(highest_scoring_word)
    end

    def won?
      total_score > 100
    end

    def draw_tiles(tile_bag)
      @bag = tile_bag
      until @tiles.length == 7 do
        drawn_tile = @bag.draw_tiles(1)
        @tiles.push(drawn_tile)
      end
      return @tiles
    end

  end
end
