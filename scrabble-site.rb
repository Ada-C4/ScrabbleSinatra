require "sinatra"

class ScrabbleSinatra < Sinatra::Base
  get "/" do
    :index
  end

  get "/score" do
    :score
  end

end
