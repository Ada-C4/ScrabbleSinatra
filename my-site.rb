require "sinatra"

class MySite < Sinatra::Base

  get "/" do
        erb :score
  end

end
