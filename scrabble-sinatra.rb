require "sinatra"
require "./lib/scrabble_module"

class ScrabbleSinatra < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  get "/score_multiple" do
    erb :score_multiple
  end

  post "/score" do
    @word = params[:word]
    @score = Scrabble::Scrabble.score(@word)
    if @word != ""
      @word_submitted = true
    end
    erb :score
  end
end
