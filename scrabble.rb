require 'sinatra'
require "./lib/scrabble_class.rb"

class SinatraScrabble < Sinatra::Base
	get "/" do
		erb :index
	end
	get "/score" do
		erb :score
	end

	post "/score" do
		@word = params[:word]
		@score = Scrabble::Scrabble.score(@word)
		erb :scored_word
	end
end