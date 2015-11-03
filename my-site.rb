require "sinatra"

class MySite < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  get "/scoremany" do
    erb :scoremany
  end

end
