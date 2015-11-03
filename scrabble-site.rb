require "sinatra"
require "./lib/scrabble"

class ScrabbleSinatra < Sinatra::Base
  get "/" do
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

  get "/scoremultiple" do
    erb :scoremultiple
  end

  post "/scoremultiple" do
    @words = params[:multiple_words].split(",")
    @words.map! { |word| word.strip }
    erb :scoremultiple
  end

end
