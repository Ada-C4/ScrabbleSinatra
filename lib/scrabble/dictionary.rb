require "./lib/scrabble_module"
module Scrabble
  class Dictionary
    def self.valid_word?(word)
      File.open("./lib/scrabble/dictionary.txt") do |f|
        f.any? do |line|
          line.include?(word.upcase)
        end
      end
    end
  end
end
