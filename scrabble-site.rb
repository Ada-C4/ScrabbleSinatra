require "sinatra"
require "./lib/scrabble_class"
require "./lib/tile_bag"
require "./player"

class ScrabbleSinatra < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    word = params[:score]
    Scrabble::Scrabble.score(score)
  end


end
