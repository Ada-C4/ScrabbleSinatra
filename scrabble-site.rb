require 'sinatra'
require './lib/scrabble'

class ScrabbleSite < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    @word_scored = true
    @word = params[:word]
    @word_score =  Scrabble::Scrabble.score(@word)
    erb :score
  end

end
