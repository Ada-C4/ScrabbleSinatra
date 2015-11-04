require "sinatra"
require "./lib/scrabble_master.rb"

class Scrabbly_Scrabbles < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/index" do
    erb :index
  end

  get "/one" do
    erb :score_page
  end

  post "/one" do
    @word = params[:word]
    @w = Scrabble::Scrabble.score(@word)
    erb :scored_one_word
  end

  get "/multiple" do
    erb :score_multiple_words
  end

  post "/multiple" do
    @scored_words = []
    @words_array = params[:words].split(", ")
    @words_array.each do |word|
      @scored_words.push(Scrabble::Scrabble.score(word))
    end
    erb :scored_multiple_words
  end
end
