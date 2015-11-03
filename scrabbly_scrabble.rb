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

  get "/multiple" do
    erb :score_multiple_words
  end
end
