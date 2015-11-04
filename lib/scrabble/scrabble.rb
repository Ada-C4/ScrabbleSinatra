require "./lib/scrabble_module"
module Scrabble
  class Scrabble

    def self.letter_score(letter)
      case letter
      when "A", "E", "I", "O", "U", "L", "N", "R", "N", "S", "T"
        return 1
      when "D", "G"
        return 2
      when "B", "C", "M", "P"
        return 3
      when "F", "H", "V", "W", "Y"
        return 4
      when "K"
        return 5
      when "J", "X"
        return 8
      when "Q", "Z"
        return 10
      end
    end

    def self.score(word)
      letter_array = word.upcase.split(//)
      sum = 0
      letter_array.each do |letter|
        sum += self.letter_score(letter)
      end
      return sum
    end

    def self.highest_score_from(array_of_words)
      max_sum = 0
      max_word = ""
      array_of_words.each do |word|
        word_sum = self.score(word)
        if word.length == 7
          word_sum += 50
        end
        if word_sum > max_sum
          max_sum = word_sum
          max_word = word
        elsif word_sum == max_sum
          if word.length == 7
            max_word = word
          elsif word.length < max_word.length && max_word.length != 7
            max_word = word
          end
        end
      end
      return max_word
    end
  end
end
