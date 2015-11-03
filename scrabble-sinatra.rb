require "sinatra"

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

end
