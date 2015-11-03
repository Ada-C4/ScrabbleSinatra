module Scrabble

  class ScrabbleGame

    LETTER_VALUES = {
      "a" => 1,
      "b" => 3,
      "c" => 3,
      "d" => 2,
      "e" => 1,
      "f" => 4,
      "g" => 2,
      "h" => 4,
      "i" => 1,
      "j" => 8,
      "k" => 5,
      "l" => 1,
      "m" => 3,
      "n" => 1,
      "o" => 1,
      "p" => 3,
      "q" => 10,
      "r" => 1,
      "s" => 1,
      "t" => 1,
      "u" => 1,
      "v" => 4,
      "w" => 4,
      "x" => 8,
      "y" => 4,
      "z" => 10
    }

    def self.score(word)

      letters = word.downcase.split("")

      word_score = 0

      letters.each do |letter|
        word_score += LETTER_VALUES[letter]
      end

      if letters.length == 8
      word_score += 50
      puts "BONUS! You used all seven letters! You get 50 extra points!"
      end

      return word_score
    end

  end
end
