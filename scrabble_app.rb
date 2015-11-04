require 'sinatra'
require './lib/scrabble.rb'

class SinatraScrabble < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    @word = params[:word_entry]
    erb :scored_word
  end

  get "/score_multiple_setter" do
    # @num = 0
    erb :score_multiple_setter
  end

  post "/score_multiple_setter" do
    @num = params[:num]
    erb :score_multiple
  end

  post "/score_multiple" do
    @num = params[:input_num]
    counter = 0
    @words = []
    @num.to_i.times do
      counter += 1
      sym = ("word_" + counter.to_s).to_sym
      word = params[sym]
      @words.push(word)
    end
    erb :scored_multiple
  end
end
