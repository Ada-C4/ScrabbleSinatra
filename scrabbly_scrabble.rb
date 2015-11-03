require "sinatra"
require "./lib/scrabble/"
require "./lib/scrabble_master.rb"
require "./lib/spec/spec/"

class Scrabbly_Scrabbles < Sinatra::Base
  get "/" do
    erb :score_page
  end

end
