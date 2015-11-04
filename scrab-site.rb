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
      @word_being_scored = params[:word].upcase
      @points = Scrabble::Scrabble.score(@word_being_scored)
      @scored = "true"
      erb :score
  end

end #end of ScrabbleSite class
