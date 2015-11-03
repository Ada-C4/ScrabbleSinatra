require "sinatra"
require "./lib/scrabble_master"

class ScrabbleSinatra < Sinatra::Base

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
    @word = params[:word]
    @score = Scrabble::Scrabble.score(@word)

    erb :score
  end

end
