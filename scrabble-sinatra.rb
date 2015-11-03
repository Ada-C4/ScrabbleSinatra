require "sinatra"
require "./lib/highest_score.rb"
require "./lib/player.rb"
require "./lib/score.rb"
require "./lib/tilebag.rb"

class ScrabbleSinatra < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score" do
    @page_name = "Score a Word"
    erb :score
  end

  post "/score" do
    @page_name = "Score a Word"
    word = params[:word]
    @score = Scrabble::ScrabbleGame.score(word)
    erb :score
  end

  get "/score_multiple" do
    @page_name = "Score some Words"
    word =

    erb :score_multiple
  end


end
