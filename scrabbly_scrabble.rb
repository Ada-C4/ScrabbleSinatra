require "sinatra"
require "./lib/scrabble_master.rb"

class Scrabbly_Scrabbles < Sinatra::Base
  get "/" do
    erb :index
  end

end
