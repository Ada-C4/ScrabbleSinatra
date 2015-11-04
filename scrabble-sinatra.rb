require 'sinatra'
require "./lib/scrabble_master"

class ScrabbleSite < Sinatra::Base

  def score_word_display
    erb :score_word_display
  end

  get "/" do
    @header = "Scrabble Score"
    erb :index
  end

  get "/score" do
    @header = "Score A Word"
    erb :score
  end

  post "/score" do
    @header = "Score A Word"
    @word = params[:word]
    @score = Scrabble::Scrabble.score(@word)
    erb :score
  end

  get "/scoremore" do
    @header = "Score Multiple Words"
    erb :scoremore
  end

  post "/scoremore" do
    @header = "Score Multiple Words"
    all_words = params[:words]
    word_array = all_words.split(/\W+/)
    @word_hash = {}

    word_array.each do |word|
      score = Scrabble::Scrabble.score(word)
      @word_hash[word] = score
    end
    erb :scoremore
  end



end
