require "sinatra"
require "./lib/highest_score.rb"
require "./lib/player.rb"
require "./lib/score.rb"
require "./lib/tilebag.rb"

class ScrabbleSinatra < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score" do
    @page_name = "Score a Word"
    erb :score
  end

  post "/score" do
    @page_name = "Score a Word"
    word = params[:word]
    @score = Scrabble::ScrabbleGame.score(word)
    erb :score
  end

  get "/score_multiple" do
    @page_name = "Score some Words"
    erb :score_multiple
  end

  post "/score_multiple" do
    @page_name = "Score some Words"
    words = params[:words]
    @words_with_scores = Scrabble::ScrabbleGame.string_to_multiple_word_scores(words)
    erb :score_multiple
  end


end
