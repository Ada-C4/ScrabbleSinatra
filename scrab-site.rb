require "sinatra"
require "./lib/scrabble_class"

class ScrabbleSite < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
      @word_scores_array = []
      input_being_scored = params[:word]
      @word_being_scored_array = input_being_scored.split(" ")
      @word_being_scored_array.each do |split_word|
        points = Scrabble::Scrabble.score(split_word.upcase)
        @word_scores_array.push(points.to_s)
      end
      @words_and_scores_hash = Hash[@word_being_scored_array.zip(@word_scores_array)]
      @scored = "true"
      erb :score
  end

end #end of ScrabbleSite class
