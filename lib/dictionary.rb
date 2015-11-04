require 'ruby-dictionary'

module Scrabble
  class WordDictionary

  DICTIONARY = Dictionary.from_file('./lib/dictionary.txt')

   def self.lookup(word)
     word = word.downcase
     DICTIONARY.exists?(word)
   end
  end
end
