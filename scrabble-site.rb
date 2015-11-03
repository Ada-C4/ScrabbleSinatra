require "sinatra"
require "./lib/scrabble"

class ScrabbleSinatra < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

end
