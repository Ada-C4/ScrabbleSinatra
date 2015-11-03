module Scrabble
  class Scrabble
    VALUES = {"A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1, "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1,
    "D" => 2, "G" => 2, "B" => 3, "C" => 3, "M" => 3, "P" => 3, "F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4, "K" => 5,
  "J" => 8, "X" => 8, "Q" => 10, "Z" => 10}

    def self.letter_value(letter)
      value =  VALUES[letter.upcase]
      return value
    end

    def self.score(word)
      sum = 0
      word.each_char do |letter|
        letter_val = letter_value(letter.upcase)
        sum += letter_val
      end
      return sum
    end

    def self.highest_score_from(array_of_words)
      high_score = 0
      high_word = nil
      array_of_words.map do |word|
        word_score = score(word.upcase)
        if word_score >= high_score
          if word_score == high_score
            if high_word.length == 7
            elsif word.length == 7
              high_word = word
            elsif word.length < high_word.length
              high_word = word
            else
              high_word = high_word
            end
          else
            high_score = word_score
            high_word = word
          end
        end
      end
      return high_word
    end

  end
end
