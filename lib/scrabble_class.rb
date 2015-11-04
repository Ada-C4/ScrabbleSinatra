
# - A `Scrabble` class which contains some sort of data structure to store the **individual letter scores** listed below.
# this is a test
module Scrabble
  class Scrabble
    def self.letter_score(letter)
      case letter
       when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
         point = 1
       when "D", "G"
         point = 2
       when "B", "C", "M", "P"
         point = 3
       when "F", "H", "V", "W", "Y"
         point = 4
       when "K"
         point = 5
       when "J", "X"
         point = 8
        else
         point = 10
      end
      return point
    end

    def self.score(word)
      l_array = word.split("")
      sum = 0
      l_array.each do |l|
        score = letter_score(l)
        sum += score
      end
      if l_array.count == 7
        sum = sum + 50
      end
      return sum
    end


    def self.highest_score_from(array_of_words)
      max_score = 0
      max_word = ""
      array_of_words.each do |word|
        score = self.score(word)
        if score > max_score
          max_score = score
          max_word = word
        elsif score == max_score && word.length == 7
          max_score = score
          max_word = word
        elsif score == max_score && word.length < max_word.length
          max_score = score
          max_word = word
        end
      end
      return max_word
    end
  end
end
