require "sinatra"

class Scrabbly_Scrabbles < Sinatra::Base
  get "/" do
    erb :score_page
  end

end
