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
    @letter_hash = {}
    word_array.each do |word|
      word.each_char do |char|
        @letter_hash[char] = Scrabble.score(char)
      end
    end
    @loquacious = Scrabble.highest_score_from(word_array) if params[:rules] == "7-letter"
    erb :scoring
  end
end
