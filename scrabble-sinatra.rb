require "sinatra"
require "./lib/scrabble_module"

class ScrabbleSinatra < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  get "/score_multiple" do
    erb :score_multiple
  end

  post "/score" do
    @word = params[:word]
    if @word.include?(",")
      @invalid_word = true
    elsif !@word.nil?
      @word_submitted = true
    end
    erb :score
  end

  post "/score_multiple" do
    @words = params[:words].split(",").map(&:strip)
    if !@words.nil?
      @words_submitted = true
    end
    erb :score_multiple
  end
end
