require 'pry'
require "./lib/score.rb"

module Scrabble
  class ScrabbleGame


    def self.score_multiple_words(array_of_words)
      wordscore_hash = {}
      array_of_words.each do |w|
        score = self.score(w)
        wordscore_hash[w] = score
      end
      return wordscore_hash
    end

    def self.string_to_multiple_word_scores(string_of_words)
      word_array = string_of_words.split(" ")
      Scrabble::ScrabbleGame.score_multiple_words(word_array)
    end

    def self.highest_score_from(array_of_words)
      wordscore_hash = Scrabble::ScrabbleGame.score_multiple_words(array_of_words)
      top_scoring_words_hash = {}
      wordscore_hash.each do |k, v|
        if v == wordscore_hash.values.max
          top_scoring_words_hash[k] = v
        end
      end
      #make a hash from the top scoring words that instead of containing scores for values, contains the length of the word.
      word_lengths_hash = {}
      top_scoring_words_hash.each do |k, v|
        word_lengths_hash[k] = k.length
      end

      #return the word associated with the shortest length
      #if the value of the key is equal to the min, return just one
      word_lengths_hash.each do |k,v|
        if v == word_lengths_hash.values.min
        puts "#{k}"
        return k
        end
      end
    end
  end
end
