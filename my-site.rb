require "sinatra"
require "./lib/scrabble.rb"

class MySite < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    word_array = params[:word].split(" ")
    word = word_array[0]
    bonus = params[:bonus] == "on"
    @words = {}
    @words[word] = {}
    @words[word][:score] = Scrabble::Scrabble.score(word, bonus)
    @words[word][:word_breakdown] = Scrabble::Scrabble.get_word_breakdown(word, bonus)
    erb :scoredword
  end

  get "/scoremany" do
    erb :scoremany
  end

  post "/scoremany" do
    word_array = params[:word].split(" ")
    @words = {}
    word_array.each do |word|
      @words[word] = {}
      @words[word][:score] = Scrabble::Scrabble.score(word)
      @words[word][:word_breakdown] = Scrabble::Scrabble.get_word_breakdown(word)
    end
    erb :scoredword
  end

end
