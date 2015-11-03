require "sinatra"
require "./lib/scrabble_master"

class ScrabbleSinatra < Sinatra::Base

  def word_scoring
    @word_score = {}
    @letter_scores = Scrabble::Scrabble::SCORES

    @words.each do |word|
      @word_score[word.upcase] = Scrabble::Scrabble.score(word)
    end
  end

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
    @words = [params[:words].split(" ").first]

    word_scoring

    erb :score
  end

  get "/score_multi" do
    erb :score_multi
  end

  post "/score_multi" do
    @words = params[:words].split(" ")

    word_scoring

    erb :score_multi
  end

end
