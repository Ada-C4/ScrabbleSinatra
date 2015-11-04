require "sinatra"
require "./lib/scrabble.rb"

class MySite < Sinatra::Base

  get "/" do
    @title = "Homepage"
    erb :index
  end

  get "/score" do
    @title = "Score One Word"
    erb :score
  end

  post "/score" do
    @title = "Word Score"
    word_array = params[:word].split(" ")
    word = word_array[0]
    @valid_word = Scrabble::Scrabble.word?(word)
    if @valid_word
      bonus = params[:bonus] == "on"
      @words = {}
      @words[word] = {}
      @words[word][:score] = Scrabble::Scrabble.score(word, bonus)
      @words[word][:word_breakdown] = Scrabble::Scrabble.get_word_breakdown(word, bonus)
    end
    erb :scoredword
  end

  get "/scoremany" do
    @title = "Score Many Words"
    erb :scoremany
  end

  post "/scoremany" do
    @title = "Word Score"
    @valid_word = true
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
