require "spec_helper"
require './lib/scrabble_master'

describe ".lookup(word)" do
  it "accepts a word from the dictionary" do
    expect(Scrabble::WordDictionary.lookup("word")).to be_truthy
  end
  it "rejects a word that is not in the dictionary" do
    expect(Scrabble::WordDictionary.lookup("zzzz")).to be_falsey
  end
end
