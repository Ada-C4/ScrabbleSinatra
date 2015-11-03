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

  get "/score_multi" do
    erb :score_multi
  end

  post "/score_multi" do
    @words = params[:words].split(" ")
    @scores = {}

    @words.each do |word|
      @scores[word] = Scrabble::Scrabble.score(word)
    end

    erb :score_multi
  end

end
