module ScrabbleMod

  class Dictionary

    def find_word(word)
      if word.is_a? String
        File.open("./lib/en.txt") do |f|
          f.any? do |line|
            line.include?(word)
          end
        end
      else
        return false
      end
    end

  end
end
