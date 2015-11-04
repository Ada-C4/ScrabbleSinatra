require 'sinatra'
require "./lib/score.rb"
require "./lib/highest_score.rb"

class SinatraScrabble < Sinatra::Base

  def score_prompt
    erb :score_prompt
  end

  get "/" do
    erb :index
    @title = "Homepage"
    @h1 = "Welcome to Virtual Scrabble!"
  end

  get "/score" do
    @title = "Single Score"
    @h1 = "Score a word in Scrabble!"
    erb :score
  end

  post "/score" do
    @word = params[:user_input]
    @score = Scrabble::ScrabbleGame.score(@word)
    erb :score
  end

  get "/multiple_scores" do
    @title = "Multiple Scores"
    @h1 = "Score multiple words in Scrabble!"
    erb :multiple_scores
  end

  post "/multiple_scores" do
    @word = params[:user_input]

    multiple_words = @word.split(" ")
    #creates a hash
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
    erb :multiple_words
  end
end
