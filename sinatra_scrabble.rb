require "sinatra"
require "./lib/scrabble"
require "./lib/tile_bag"
require "./lib/scrabble_player_class"
  class ScrabbleSinatra < Sinatra::Base
    get "/" do
      erb :index
    end

    get "/scores.html" do
      erb :scores
    end

    post "/scores.html" do
      @singleword = params[:word]
      @score = Scrabble::Scrabble.word_score(@singleword)
      erb :scores
    end

    get "/multiwords.html" do
      erb :multiwords
    end

    post "/multiwords.html" do
      @wordlist = params[:word]
      @score = Scrabble::Scrabble.multiwords(@wordlist)
      erb :multiwords
    end
  end
