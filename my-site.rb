require "sinatra"

class MySite < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score.html" do
    erb :score
  end
end
