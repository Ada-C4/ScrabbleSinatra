require "sinatra"
require "./lib/scrabble_class"


class ScrabbleSinatra < Sinatra::Base
  get "/" do
    @title = "Home page"
    erb :index
  end

  get "/score" do
    @title = "Score Page"
    erb :score
  end

  post "/score" do
    @letter_hash = {}
    word = params[:word]
    @score = Scrabble::Scrabble.score(word)
    letters = word.split("")
    letters.each do |letter|
      @letter_hash[letter] = Scrabble::Scrabble.letter_value(letter)
    end
    erb :score
  end

  get "/score_words" do
    erb :score_words
  end

  post "/score_words" do
    @title = "Multiply Words Score Page"
    @words = params[:multiply_words].split(" ")
    @scores_array = []
    @words.each do |word|
      score = Scrabble::Scrabble.score(word)
      @scores_array.push(score)
    end
    erb :score_words
  end



end
