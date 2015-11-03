require "./lib/player.rb"

# a medicore way of creating a new instance of a player before each spec:

describe Scrabble::Player do
  before :each do
    @bob = Scrabble::Player.new("Bob")
  end

# A better way

# describe 'initialize' do
#   let(:bob) { Scrabble::Player.new :name }
#
#   it 'creates a new instance of a player' do
#     expect(@bob).to be_an_instance_of Scrabble::Player
#   end

## BAD spec example:
# doesn't use only the specific method name the 'describe' block

  describe "the intialize method when creating a new game" do
    it "Creates a new instance of a player" do
      expect(@bob).to be_an_instance_of Scrabble::Player
    end
  end


## GOOD spec example:

  describe "initialize" do
    it "creates a new instance of a player" do
      expect(@bob).to be_an_instance_of Scrabble::Player
    end
  end
end
