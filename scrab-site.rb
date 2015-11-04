require "sinatra"
require "./lib/scrabble_class"

class ScrabbleSite < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
      @word = params[:word]
      @points = Scrabble::Scrabble.score(@word)
      @scored = "true"
      erb :score
  end

end #end of ScrabbleSite class
