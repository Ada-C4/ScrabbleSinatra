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

  get "/score_multiple" do
    erb :score_multiple
  end

  post "/score_multiple" do
    @word_1 = params[:word_1]
    @word_2 = params[:word_2]
    @word_3 = params[:word_3]
    erb :scored_multiple
  end
end
