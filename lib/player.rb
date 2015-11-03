require 'pry'
require "./lib/score.rb"
require "./lib/highest_score.rb"
require "./lib/tilebag.rb"

module Scrabble

  class Player
    attr_accessor :name, :words_played, :player_score, :tiles

    def initialize(name)
      @name = name.capitalize
      @words_played = []
      @player_score = 0
      @tiles = []
    end

    def play_word(word)
      if won?
        puts "You've won!"
        return "player won"
      else
        @words_played.push(word)
        return @words_played
      end
    end

    def won?
      if @player_score > 100
        return true
      end
    end

    def total_score
      sum = 0
      @words_played.each do |word|
        sum += (ScrabbleGame.score(word))
      end
      sum
    end

    def highest_scoring_word
      ScrabbleGame.highest_score_from(@words_played)
    end

    def highest_word_score
      ScrabbleGame.score(highest_scoring_word)
    end

    def draw_tiles(tilebag)
      num = 7 - @tiles.length
      @tiles += (tilebag.draw_tiles(num))
    end
  end
end
