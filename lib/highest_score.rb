require 'pry'
require "./lib/score.rb"

module Scrabble
  class ScrabbleGame

    def self.highest_score_from(array_of_words)
      #for each word in array, call method to get the score
      #and make a hash of words with scores
        wordscore_hash = {}
        array_of_words.each do |w|
          score = self.score(w)
          wordscore_hash[w] = score
        end

        #returns all keys with max value
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
