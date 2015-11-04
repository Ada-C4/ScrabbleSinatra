require "sinatra"
require "./lib/scrabble_master"

class ScrabbleSinatra < Sinatra::Base

  def word_scoring
    @word_score = {}
    @letter_scores = Scrabble::Scrabble::SCORES

    @words.each do |word|
      @word_score[word.upcase] = Scrabble::Scrabble.score(word)

      if !@bonus && word.length == 7
        @word_score[word.upcase] -= 50
      end
    end
  end

  get "/" do
    erb :index
  end

  get "/index" do
    erb :index
  end

  get "/score" do
    if !params[:words].nil?
      @words = [params[:words].split(" ").first]
      @bonus = true

      word_scoring
    end

    erb :score
  end

  get "/score_multi" do
    erb :score_multi
  end

  post "/score_multi" do
    @words = params[:words].split(" ")
    @bonus = params[:bonus] == "yes_bonus"

    word_scoring

    erb :score_multi
  end

end
