require "sinatra"

class SinatraScrabble < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

end
