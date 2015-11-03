require "sinatra"
require "./lib/scrabble.rb"

class MySite < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    @word = params[:word]
    @score = Scrabble::Scrabble.score(@word)
    erb :scoredword
  end

  get "/scoremany" do
    erb :scoremany
  end

end
