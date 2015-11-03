module Scrabble
  class Player
    attr_reader :name, :tiles
    attr_accessor :plays
    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
    end
    def play(word)
      if won?
        return false
      else
        @plays.push(word)
      end
    end
    def total_score
      total = 0
      @plays.map do |word|
        score = Scrabble.score(word)
        total += score
      end
      return total
    end
    def won?
      if total_score > 100
        true
      else
        false
      end
    end
    def highest_scoring_word
      Scrabble.highest_score_from(@plays)
    end
    def highest_word_score
      highest_pair = Scrabble.create_word_score_hash(@plays).max_by do |k, v|
        v
      end
      return highest_pair[1]
    end
    def draw_tiles(tile_bag)
      length = @tiles.length
      tile_bag.draw_tiles(7-length).each do |element|
        @tiles.push(element)
      end
    end
  end
end
