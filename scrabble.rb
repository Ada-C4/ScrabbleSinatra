require "sinatra"
require "./lib/scrabble_class"

class ScrabbleSinatra < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    @word_played = true
    @word_input = params[:word]
    @score = Scrabble::Scrabble.score(@word_input.upcase)
    erb :score
  end

  get "/score_words" do
    erb :score_words
  end

  post "/score_words" do
    @word_array = [params[:word1], params[:word2], params[:word3], params[:word4]]
    erb :scoring
  end
end
