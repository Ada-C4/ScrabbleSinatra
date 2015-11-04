module Scrabble

  class Scrabble
    SCORES = {
    "A" => 1,
    "E" => 1,
    "I" => 1,
    "O" => 1,
    "U" => 1,
    "L" => 1,
    "N" => 1,
    "R" => 1,
    "S" => 1,
    "T" => 1,
    "D" => 2,
    "G" => 2,
    "B" => 3,
    "C" => 3,
    "M" => 3,
    "P" => 3,
    "F" => 4,
    "H" => 4,
    "V" => 4,
    "W" => 4,
    "Y" => 4,
    "K" => 5,
    "J" => 8,
    "X" => 8,
    "Q" => 10,
    "Z" => 10
  }

    def self.score(word)
      word = word.upcase
      word_score = 0
      0.upto(word.length - 1) do |n|
        word_score += SCORES[word[n]]
      end
      word_score += 50 if word.length == 7
      return word_score
    end

    def self.highest_score_from(array_of_words)
      max_word = array_of_words.max_by do |word|
        self.score(word)
      end

      max_score = self.score(max_word)
      high_scorers = array_of_words.find_all do |word|
        self.score(word) == max_score
      end

      seven_letter_word = high_scorers.find do |word|
        word.length == 7
      end

      if seven_letter_word != nil
        return seven_letter_word
      else
        high_scorers.min_by do |word|
  	      word.length
        end
      end
    end
  end
end
