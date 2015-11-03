require "sinatra"

class ScrabbleSite < Sinatra::Base
  get "/" do
    erb :index
  end

end
