require "sinatra"
require "./lib/scrabble/scrabble.rb"

class MySite < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/index.html" do
    erb :index

  end
  get "/score.html" do
    erb :score
  end

  get "/scoremultiple.html" do
    erb :scoremultiple
  end

  post "/score.html" do
    @word = params[:word]
    @score=Scrabble::Scrabble.score(@word)
    erb :score
  end

  post "/scoremultiple.html" do
    words = params[:multiple_words1]
    @words_array = words.split(", ")
    @words_hash = {}
    @words_array.each do |words|
      @words_hash[words]= Scrabble::Scrabble.score(words)
    end
    erb :scoreview
  end
end
