module Scrabble
  class Scrabble
    LETTER_VALUES = {A: 1, E: 1, I: 1, O: 1,  U: 1, L: 1, N: 1, R: 1, S: 1, T: 1, D:  2, G: 2, B: 3, C: 3, M: 3, P: 3, F: 4,  H: 4, V: 4, W: 4, Y: 4, K: 5, J: 8, X:  8, Q: 10, Z: 10}
    def self.make_value_array(word)
      word_array = word.each_char.to_a
      word_array.map do |letter|
         LETTER_VALUES[letter.upcase.to_sym]
      end
    end
    def self.score(word)
      value_array = self.make_value_array(word)
      score = value_array.inject {|sum, item| sum + item}
      if word.length == 7
        return score + 50
      else
        return score
      end
    end
    def self.create_word_score_hash(array_of_words)
      word_score_hash = Hash.new
      array_of_words.each do |word|
        word_score_hash[word] = self.score(word)
      end
      return word_score_hash
    end
    def self.highest_score_from(array_of_words)
      highest_pair = self.create_word_score_hash(array_of_words).max_by do |k, v|
          v
      end
      highest_score_value = highest_pair[1]
      highest_score_hash = self.create_word_score_hash(array_of_words).select do |k, v|
        v == highest_score_value
      end
      if highest_score_hash.length == 1
        return highest_score_hash.key(highest_score_value)
      else
        pair = highest_score_hash.min_by do |k, v|
          k.length
        end
        pair[0]
      end
    end
  end
end
