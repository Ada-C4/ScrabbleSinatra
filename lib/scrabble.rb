module Scrabble
  class Scrabble
    def letter_score(letter)
      case letter.downcase
      when "a", "e", "i", "o", "u", "l", "n", "r", "s", "t"
        return 1
      when "d", "g"
        return 2
      when "m", "b", "c", "p"
        return 3
      when "f", "h", "v", "w", "y"
        return 4
      when "k"
        return 5
      when "j", "x"
        return 8
      when "q", "z"
        return 10
      else
        return 0
      end
    end
    #SCORE = 0
    def word_score(word)
      score = 0
      word.split("").each do |letter|
        letter = letter_score(letter)
        score += letter
      end
      return score
    end

    def highest_word_score(word_list)
      scores = {}

      word_list.split(",").each do |palabra|
        #word_array.push(palabra)
        word_total = word_score(palabra)
        scores[word_total] ||= []
        scores[word_total] << palabra
      end

      highest_score = scores.keys.sort[-1]
      if scores[highest_score].length > 1
        best_word = scores[highest_score].sort_by { |x| x.length }
        best_word[0]
      else
        return scores[highest_score]
      end
    end
  end
end  
