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
		word = params[:word]
		@word_array = word.split(", ")
		@words = {}
		@letters = {}
		@word_array.each do |word|
			@words[word] = letters_array = word.split("")	
			letters_array.each do |letter|
				@letters[letter] = Scrabble::Scrabble.letter_value(letter)Scrabble::Scrabble.score(word)
			
			end
		end

		erb :scored_word
	end
end