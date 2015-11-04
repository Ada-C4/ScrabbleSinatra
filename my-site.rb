require "sinatra"
require "./lib/scrabble.rb"

class SinatraScrabble < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/index" do
    erb :index
  end

  get "/score" do
    @score = false
    erb :score
  end

  post "/score" do
    @score = true
    @words_hash = {}
    @letters_hash = {}
    words = params[:word].split(",")
    @rules = params[:scrabble_rules]
    if params[:scrabble_rules] == "shortest"
      words.each do |word|
        score, bonus = ScrabbleMod::Scrabble.score(word)
        if bonus == true
          score -= 50
        end
        @words_hash[word] = score
        score_by_letter, @bonus = ScrabbleMod::Scrabble.score_by_letters(word)
        @letters_hash[word] = score_by_letter
      end
      @bonus = false
    else
      words.each do |word|
        score, bonus = ScrabbleMod::Scrabble.score(word)
        @words_hash[word] = score
        score_by_letter, @bonus = ScrabbleMod::Scrabble.score_by_letters(word)
        @letters_hash[word] = score_by_letter
      end
    end
    erb :score
  end

  get "/score" do
    
  end

end
