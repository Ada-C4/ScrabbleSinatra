require 'sinatra'
require "./lib/scrabble_class.rb"
require "./lib/dictionary.rb"

class SinatraScrabble < Sinatra::Base
	get "/" do
		erb :index
	end
	get "/score" do
		erb :score
	end

	get "/score_get" do
		erb :score_get
	end

	get "/got_score" do
		word = params[:word]
		@word_array = word.split(", ")
		@words = {}
		@letters = {}
		@word_array.each do |word|
			@words[word] = Scrabble::Scrabble.score(word)
			letters_array = word.split("")	
			letters_array.each do |letter|
				@letters[letter] = Scrabble::Scrabble.letter_value(letter)
			end
		end
		@rules = params[:rules]
		@winner = Scrabble::Scrabble.highest_shortest_score(@word_array) if params[:rules] == "shortest"
		@winner = Scrabble::Scrabble.highest_score_from(@word_array) if params[:rules] == "seven_letter"
		erb :scored_word
	end

	post "/score" do
		word = params[:word]
		@word_array = word.split(", ")
		@words = {}
		@letters = {}
		@word_array.each do |word|
			@words[word] = Scrabble::Scrabble.score(word)
			letters_array = word.split("")	
			letters_array.each do |letter|
				@letters[letter] = Scrabble::Scrabble.letter_value(letter)
			end
		end
		@rules = params[:rules]
		@winner = Scrabble::Scrabble.highest_shortest_score(@word_array) if params[:rules] == "shortest"
		@winner = Scrabble::Scrabble.highest_score_from(@word_array) if params[:rules] == "seven_letter"
		erb :scored_word
	end

end