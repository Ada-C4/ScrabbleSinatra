require "sinatra"


class ScrabbleSite < Sinatra::Base

  get "/" do
    erb :score
  end

end
