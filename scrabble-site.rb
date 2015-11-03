require "sinatra"
require "./lib/scrabble.rb"

class ScrabbleSite < Sinatra::Base
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
    @scored_word = true
    @word = params[:word_to_score]
    if @word == ""
      @not_legit_word = true
    else
      @not_legit_word = false
    end
    @score = Scrabble.score(@word)

    erb :score
  end

end
