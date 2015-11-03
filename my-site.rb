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
    words.each do |word|
      score = ScrabbleMod::Scrabble.score(word)
      @words_hash[word] = score
      score_by_letter, @bonus = ScrabbleMod::Scrabble.score_by_letters(word)
      @letters_hash[word] = score_by_letter
    end
    erb :score
  end

end
