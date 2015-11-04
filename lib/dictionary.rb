

module Scrabble
  class Dictionary_Class

    def is_valid?(word)
      raise ArgumentError if word.class != String
      File.open('./lib/dictionary.txt') do |file|
        file.any? do |line|
          line.include?(word)
        end
      end
    end

  end
end
