require "sinatra"
  class Scrabble < Sinatra::Base
    get "/" do
      erb :index
    end

    get "/scores.html" do
      erb :scores
    end
  end
