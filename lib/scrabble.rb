module Scrabble

  class Scrabble

    SCORE_HASH = {
      "a" => 1,
      "e" => 1,
      "i" => 1,
      "o" => 1,
      "u" => 1,
      "l" => 1,
      "n" => 1,
      "r" => 1,
      "s" => 1,
      "t" => 1,
      "d" => 2,
      "g" => 2,
      "b" => 3,
      "c" => 3,
      "m" => 3,
      "p" => 3,
       "f" => 4,
       "h" => 4,
       "v" => 4,
       "w" => 4,
       "y" => 4,
       "k" => 5,
       "j" => 8,
       "x" => 8,
       "q" => 10,
       "z" => 10,
    }

    def self.score(word, bonus = false)
      score = 0
      return nil if word.class != String || word == ""
      word.downcase.strip.each_char do |letter|
        score += SCORE_HASH[letter]
      end
      score += 50 if bonus
      return score
    end

    def self.get_word_breakdown(word, bonus = false)
      return nil if word.class != String || word == ""
      word.strip!
      score_breakdown = ""
      word.length.times do |n|
        letter = word[n].downcase
        score_breakdown += SCORE_HASH[letter].to_s
        score_breakdown += " + " unless n == word.length - 1
      end
      score_breakdown += " + 50" if bonus
      return score_breakdown
    end

    def self.highest_score_from_array(array_of_words)
      if array_of_words.class != Array || array_of_words == []
        return nil
      end

      score_array = array_of_words.map do |word|
        Scrabble.score(word)
      end

      max_score = score_array.max

      winners = []
      score_array.length.times do |i|
        if score_array[i] == max_score
          winners.push(array_of_words[i])
        end
      end

      winners.sort_by! do |word|
        word.length
      end

      if winners[-1].length == 7
        return winners[-1]
      else
        return winners[0]
      end

    end

  end

end
