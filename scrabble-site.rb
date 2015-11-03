require "sinatra"
require "./lib/scrabble.rb"

class ScrabbleSite < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    word = params[:word]
    word_array = word.split(" ")
    @word_hash = {}
    word_array.each do |word|
      @word_hash[word] = Scrabble.score(word)
    end
    erb :scoring
  end
end
