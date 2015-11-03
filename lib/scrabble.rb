module ScrabbleMod

  SCORES = {
    a: 1,
    b: 3,
    c: 3,
    d: 2,
    e: 1,
    f: 4,
    g: 2,
    h: 4,
    i: 1,
    j: 8,
    k: 5,
    l: 1,
    m: 3,
    n: 1,
    o: 1,
    p: 3,
    q: 10,
    r: 1,
    s: 1,
    t: 1,
    u: 1,
    v: 4,
    w: 4,
    x: 8,
    y: 4,
    z: 10
  }

  class Scrabble
    def self.score(word)
      #sanitize input
      if word.is_a? String
        #create variable for word score
        word_score = 0
        #split word into array of characters - downcased
        word_array = word.downcase.split("")
        #convert letters to symbols
        #look up score for each symbol and add it to word score variable
        word_array.each do |letter|
          word_score += SCORES[letter.to_sym]
        end
        #add 50 points if the word has 7 letters and return word score variable
        word_score += 50 if word.length == 7
        return word_score
      else
        return "Error message"
      end
    end

    def self.highest_score_from(array_of_words)
      word_hash = {}
      winners_array = []
      winner = nil

      #sanitize input
      if array_of_words.is_a? Array
        #run the self.score method on each word in the array
        #store the word and push the score into a hash

        array_of_words.each do |word|
          word_hash[word] = ScrabbleMod::Scrabble.score(word)
        end

        max_score = word_hash.values.max

        #retrieve the highest scoring word
        high_scores = word_hash.select { |k, v| v == max_score }.keys

        if high_scores.length > 1
          high_scores.each do |word|
            if word.length == 7
              winners_array.push(word)
              winner = winners_array[0]
            end
          end

          if winners_array.length == 0
            winner = high_scores.min_by do |w|
              w.length
            end
          end

          return winner

        else
          winner = high_scores[0]
        end

      else
        return "Error message"
      end
    end
  end

end
