require 'pry'

class Scrabble
  attr_accessor :player_words, :score

  def initialize
  end

  # Returns the total score value for the given word
  def self.score(word)
    # Check that the given word is a string
    if word.class != String
        raise ArgumentError, "Input must be a string."
    else
      # Check that each character of the given string is alphabetical
      word.length.times do |letter|
        if !("a".."z").to_a.include? word[letter]
            raise ArgumentError, "Input must be an alphabetical string."
        end
      end
    end

    @score = 0
    # If word length is 7, add 50 points
    word.length == 7 ? (@score += 50) : (@score += 0)
    # For each letter in the given word, update the score value
    word.length.times do |index|
      case word[index].upcase
      when "A","E","I","O","U","L","N","R","S","T"
        @score += 1
      when "D","G"
        @score += 2
      when "B","C","M","P"
        @score += 3
      when "F","H","V","W","Y"
        @score += 4
      when "K"
        @score += 5
      when "J", "X"
        @score += 8
      when "Q", "Z"
        @score += 10
      end
    end
    return @score
  end

  # Returns the word from a given array of words that will have th highest score
  def self.highest_score_from(array_of_words)
    best_words = []
    # Sort the array by score
    sorted_array = array_of_words.sort_by {|word| score(word)}
    # Inspired by Jennie and Jenna's solution
    # Map the sorted array to a score array
    sorted_score_array = sorted_array.map do |word|
      score(word)
    end
    # Determine the max score
    max_score = sorted_score_array.max
    # For each score value, if it equals the max score, put the word in the best words array
    sorted_score_array.length.times do |i|
      if sorted_score_array[i] == max_score
        best_words.push(sorted_array[i])
      end
    end
    # Sort best words by length
    # After this you have an array of all the words with max_score sorted by word length
    best_words.sort_by! do |word|
      word.length
    end
    # If there is a 7 letter word, return that
    # Otherwise, return the shortest word that hits max score
    if best_words[-1].length == 7
      return best_words[-1]
    else
      return best_words[0]
    end    
  end
end

# ------------ ORIGINAL SOLUTION ------------------------ #
# We rewrote our solution after looking at the solutions of our classmates. We think the new solution is more straightforward but the below solution works too.
    # at_max = true
    # best_words = []
    # index = -1
    #
    # # While you are still at the maximum score
    # while at_max == true
    # # If you are at the first index, check if the score of the value at that index is equal to the value next to it in the array. If it is, push it into best_words and break the loo
    #   if index.abs >= sorted_array.length
    #     if score(sorted_array[index]) == score(sorted_array[index+1])
    #       best_words.push(sorted_array[index])
    #       at_max = false
    #     end
    #   else
    # # Otherwise, push the word into the best words array
    # # If the next value (moving backwards) has a lower score, break out the while loop (and don't add any more words to best_words)
    #     best_words.push(sorted_array[index])
    #     if score(sorted_array[index]) > score(sorted_array[index-1])
    #       at_max = false
    #     end
    #   end
    # # decrement index
    #   index -= 1
    # end
    # # Sort the array by word length
    # best_words.sort_by! {|word| word.length}

    # best_words.each do |word|
    # # Handling the first value
    #   if word == best_words[-1]
    #     return word
    #   end
    #   word_index = best_words.index(word)
    #   if word.length < best_words[word_index+1].length
    #     return word
    #   end
    # end
    # return best_words[0]
# --------------- END OF ORIGINAL SOLUTION -------------------------- #
