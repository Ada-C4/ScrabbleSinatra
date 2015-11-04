require "./lib/scrabble"

class Player < Scrabble::Scrabble

  attr_reader :name, :plays, :total_score
  def initialize(name)
    @name = name
    @plays = []
    #@total_score = total_score
  end

  def play(word)
    @plays.push(word)
    #score = word_score(word)
    #@total_score.push(score)
    return @plays
  end

  def total_score
    total = 0
    all_words = @plays
    all_words.each do |word|
      #word_score(word)
      total += word_score(word)
    end
      return total
  end

  def won?
    return total_score >= 100
  end

  def highest_scoring_word
    all_words = @plays
    s = "'#{all_words.join("','")}'"
    highest_word_score(s)
  end

  def highest_score_number #we need to extract string from array
    s = highest_scoring_word
    high_score = 0
    s.each do |word|
      #word_score(word)
      high_score += word_score(word)
    end
    return high_score
  end
end
