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
    @words = {}
    word_array.each do |word|
      @words[word] = {}
      @words[word[:score]], @words[word[:breakdown]] = Scrabble::Scrabble.score(word)
    end
    erb :scoredword
  end

  get "/scoremany" do
    erb :scoremany
  end

end
