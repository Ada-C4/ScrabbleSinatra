require "sinatra"


class ScrabbleSinatra < Sinatra::Base

  get "/" do
    erb :index
  end
  
end
