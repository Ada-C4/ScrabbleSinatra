require "sinatra"
require "./lib/player"
require "./lib/scrabble"
require "./lib/TileBag"
require "./lib/dictionary"

class ScrabbleSite < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    @words_scored = true
    @words_played = params[:words]
    @word_array = @words_played.split(" ")
    @word_scores_hash = Scrabble::Scrabble.create_word_score_hash(@word_array)
    erb :score
  end


end
