require 'sinatra'
require "./lib/score.rb"
require "./lib/highest_score.rb"

class SinatraScrabble < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    @word = params[:user_input]
    @score = Scrabble::ScrabbleGame.score(@word)
    erb :score
  end

  post "/multiple_scores" do
    @word = params[:user_input]
    #creates an array
    multiple_words = @word.split(", ")
    @multiple_word_score = {}
    # pushes each individual word of array into array
    multiple_words.each do |word|
      word_score = Scrabble::ScrabbleGame.score(word)
      @multiple_word_score[word] = word_score

      @total = 0
      multiple_words.each do |word|
        word_score = Scrabble::ScrabbleGame.score(word)
        @total += word_score
        end
      @total
    end
    erb :multiple_scores
  end
end
