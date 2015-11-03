require "sinatra"
require "./lib/scrabble"

class ScrabbleSite < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    @word = params[:word]
    @score = ScrabbleMod::Scrabble.score(@word)
    erb :score
  end

end
