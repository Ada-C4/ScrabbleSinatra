require "./lib/scrabble.rb"
require "./lib/player.rb"

module Scrabble
  class Dictionary
    attr_reader :language, :file

    def initialize(language = :english)
      @language = language
    end

    def check_word(word)
      dict_file = File.open("./lib/puzzler_list.txt", "r")
      dict_file.each_line do |line|
        if word  == line.strip
          return true
        end
      end
      return false
    end

  end



end
