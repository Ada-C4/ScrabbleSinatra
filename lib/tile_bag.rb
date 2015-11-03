module Scrabble

 class TileBag
   attr_accessor :tile_bag

   def initialize

     @tile_bag = create_tile_bag

   end

   def create_tile_bag
     array_tile_bag = []
     9.times { array_tile_bag.push("a")}
     2.times { array_tile_bag.push("b")}
     2.times { array_tile_bag.push("c")}
     4.times { array_tile_bag.push("d")}
     12.times { array_tile_bag.push("e")}
     2.times { array_tile_bag.push("f")}
     3.times { array_tile_bag.push("g")}
     2.times { array_tile_bag.push("h")}
     9.times { array_tile_bag.push("i")}
     1.times { array_tile_bag.push("j")}
     1.times { array_tile_bag.push("k")}
     4.times { array_tile_bag.push("l")}
     2.times { array_tile_bag.push("m")}
     6.times { array_tile_bag.push("n")}
     8.times { array_tile_bag.push("o")}
     2.times { array_tile_bag.push("p")}
     1.times { array_tile_bag.push("q")}
     6.times { array_tile_bag.push("r")}
     4.times { array_tile_bag.push("s")}
     6.times { array_tile_bag.push("t")}
     4.times { array_tile_bag.push("u")}
     2.times { array_tile_bag.push("v")}
     2.times { array_tile_bag.push("w")}
     1.times { array_tile_bag.push("x")}
     2.times { array_tile_bag.push("y")}
     1.times { array_tile_bag.push("z")}
     return array_tile_bag
   end

   def draw_tiles(num)
     #raise ArgumentError if num.class != Integer
     tiles = []
     num.times do
       t = rand(0..(@tile_bag.length - 1))
       tiles.push(@tile_bag[t])
       @tile_bag.delete_at(t)
     end
     return tiles
   end

   def tiles_remaining
     return @tile_bag.length
   end

 end

end
