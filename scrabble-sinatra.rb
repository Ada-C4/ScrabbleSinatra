require 'sinatra'
require "./lib/scrabble_master"

class ScrabbleSite < Sinatra::Base

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

  get "/scoremore" do
    erb :scoremore
  end

  post "/scoremore" do
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
