module Scrabble
  class Dictionary
    def self.word_in_dictionary(guess)
      open("./lib/dictionary.txt", "r")
      if File.open("./lib/dictionary.txt").each_line.any?{|line| line.include?(guess)}
        return true
      else
        return false
      end
    end
  end
end
