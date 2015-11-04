require 'sinatra'
require './lib/scrabble'

class ScrabbleSite < Sinatra::Base
  get "/" do
    @title = "Let's Play Scrabble!"
    erb :index
  end

  get "/score" do
    @title = "Score A Word"
    erb :score
  end

  post "/score" do
    @word_scored = true
    @word = params[:word]
    @word_score =  Scrabble::Scrabble.score(@word)
    erb :score
  end

  get "/score_multiple" do
    @title = "Score Multiple Words"
    erb :score_multiple
  end

  post "/score_multiple" do
    @words_scored = true
    @words_array = params[:words].split(", ")
    @scores_array =  @words_array.map do |word|
      Scrabble::Scrabble.score(word)
    end
    @words_with_scores = Hash[@words_array.zip(@scores_array)]
    erb :score_multiple
  end


end
