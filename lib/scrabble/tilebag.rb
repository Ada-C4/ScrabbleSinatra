require "./lib/scrabble_module"
module Scrabble
  class TileBag
    attr_reader :tilebag
    def initialize
      @tilebag = %w(A A A A A A A A A
                  B B
                  C C
                  D D D D
                  E E E E E E E E E E E E
                  F F
                  G G G
                  H H
                  I I I I I I I I I
                  J
                  K
                  L L L L
                  M M
                  N N N N N N
                  O O O O O O O O
                  P P
                  Q
                  R R R R R R
                  S S S S
                  T T T T T T
                  U U U U
                  V V
                  W W
                  X
                  Y Y
                  Z)
    end

    def draw_tiles(num)
      tiles_array=[]
      num.times do
        tile = @tilebag.delete_at(rand(@tilebag.length))
        tiles_array << tile
      end
      return tiles_array
    end

    def tiles_remaining
      return @tilebag.length
    end
  end
end
