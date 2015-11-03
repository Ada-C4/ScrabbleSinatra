require "sinatra"
require "./lib/scrabble.rb"
require "./lib/tilebag.rb"
require "./lib/player.rb"

class MySite < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    erb params
  end

  get "/scoremany" do
    erb :scoremany
  end

end
