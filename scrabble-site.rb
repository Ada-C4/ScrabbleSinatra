require "sinatra"
require "./lib/scrabble.rb"

class ScrabbleSite < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/index" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    @scored_word = true

    @words = params[:word_to_score].split(',')
    @words == [] ? (@not_legit_word = true) : (@not_legit_word = false)

    @grammar_correct = @words.length > 1 ? true : false

    @score_hash = {}
    @words.each do |word|
      while word.include? " "
        word.slice! " "
      end
      @score_hash[word] = Scrabble.score(word)
    end
    erb :score
  end

  get "/word/:guess_word" do
    @word = params[:guess_word]
    erb :breakdown
  end

end
