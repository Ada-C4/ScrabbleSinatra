require 'pry'

module Scrabble

  class ScrabbleGame


# another way to do the hash is score =
# {"a": 1,
#  "b": 2,
# }

    def self.score(word)
      score = Hash.new
      score["a"] = 1
      score["b"] = 3
      score["c"] = 3
      score["d"] = 2
      score["e"] = 1
      score["f"] = 4
      score["g"] = 2
      score["h"] = 4
      score["i"] = 1
      score["j"] = 8
      score["k"] = 5
      score["l"] = 1
      score["m"] = 3
      score["n"] = 1
      score["o"] = 1
      score["p"] = 3
      score["q"] = 10
      score["r"] = 1
      score["s"] = 1
      score["t"] = 1
      score["u"] = 1
      score["v"] = 4
      score["w"] = 4
      score["x"] = 8
      score["y"] = 4
      score["z"] = 10

      letters = word.downcase.split("")

      word_score = 0

      letters.each do |letter|
        word_score += score[letter]

      end

      if letters.length == 8
      word_score += 50
      puts "BONUS! You used all seven letters! You get 50 extra points!"
      end

      return word_score
    end

  end
end
