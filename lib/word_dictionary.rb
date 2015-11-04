require 'ruby-dictionary'

# We have to call this WordDictionary because Dictionary is used in the gem as a key word
class WordDictionary
  def initialize

    @dictionary = Dictionary.from_file('./lib/system_words.txt')
  end

  # We used to use a txt file of words that contained words with hyphens and proper nouns so we had some additional tests, but after switching to Letterpress's word list, we do not need the checks that are commented out.
  def check_word(word)
    exists = @dictionary.exists?(word.downcase)
    exists == true ? (return true) : (return false)
      # if word[0].upcase == word[0]
      #   puts "Sorry, words spelled with a capital letter cannot be used."
      #   return false
      # elsif word.include? "-"
      #   puts "Sorry, words with a hyphen are not accepted."
      #   return false
      # elsif word.include? "'"
      #   puts "Sorry, words with an apostrophe are not accepted."
      #   return false
      # else return true
      # end
    # else
    #   return false
    # end
  end
end
