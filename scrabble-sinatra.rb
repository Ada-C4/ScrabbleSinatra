require "sinatra"
require "./lib/highest_score.rb"
require "./lib/player.rb"
require "./lib/score.rb"
require "./lib/tilebag.rb"

class ScrabbleSinatra < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score" do
    @page_name = "Score a Word"
    erb :score
  end

  get "/score_multiple" do
    @page_name = "Score some Words"
    erb :score_multiple
  end


end
