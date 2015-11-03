module Scrabble

  class ScrabbleGame

    def self.score(word)
      value = Hash.new
      value["a"] = 1
      value["b"] = 3
      value["c"] = 3
      value["d"] = 2
      value["e"] = 1
      value["f"] = 4
      value["g"] = 2
      value["h"] = 4
      value["i"] = 1
      value["j"] = 8
      value["k"] = 5
      value["l"] = 1
      value["m"] = 3
      value["n"] = 1
      value["o"] = 1
      value["p"] = 3
      value["q"] = 10
      value["r"] = 1
      value["s"] = 1
      value["t"] = 1
      value["u"] = 1
      value["v"] = 4
      value["w"] = 4
      value["x"] = 8
      value["y"] = 4
      value["z"] = 10

      letters = word.downcase.split("")

      word_score = 0

      letters.each do |letter|
        word_score += value[letter]
      end

      if letters.length == 8
      word_score += 50
      puts "BONUS! You used all seven letters! You get 50 extra points!"
      end

      return word_score
    end

  end
end
