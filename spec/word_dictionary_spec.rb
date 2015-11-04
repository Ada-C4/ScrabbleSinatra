require "spec_helper"
require './lib/word_dictionary.rb'

describe Dictionary do
  before :each do
    @dictionary = WordDictionary.new
  end


  describe "#new" do
    it "create a new instance of Dictionary" do
      expect(@dictionary).to be_an_instance_of WordDictionary
    end
  end

  describe "#check_word" do
    it "finds word in the dictionary" do
      expect(@dictionary.check_word('excellent')).to eq true
    end

    it "doesn't find made up words in the dictionary" do
      expect(@dictionary.check_word('gobblygoock')).to eq false
    end

    it "doesn't allow words with capital letters" do
      expect(@dictionary.check_word('Aaron')).to eq false
    end
  end
end
