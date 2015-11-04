require "sinatra"
require "./lib/scrabble"

class ScrabbleSite < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    @word = params[:word]
    @score = ScrabbleMod::Scrabble.score(@word)
    erb :score
  end

  get "/multiscore" do
    @words = []
    @words_hash = {}
    erb :multiscore
  end

  post "/multiscore" do
    big_string = params[:words]
    @words = big_string.split(",")
    @words_hash = {}
    @words.each do |word|
      @words_hash[word] = ScrabbleMod::Scrabble.score(word)
    end
    # @words.each do |word|
    #   score = ScrabbleMod::Scrabble.score(word)
    #   @scores.push(score)
    # end
    erb :multiscore
  end

end
