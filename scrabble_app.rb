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
end
