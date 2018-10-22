require "spec_helper"
require "puzzle_solver"


# search_horizontally = add to x one at a time, while running function for nearby words
# search_Vertically = add to y axis  ....
# search diagonally_descending = starting at letter, add to y, then add to x
# search diagonally_ascending = starting at letter, add to x, then y (kind of assumes your at the bottom)
# search backwards = all axes?? uncertain but will come back


class Puzzle_Solver
  describe Puzzle_Solver do


      describe ".isLURD_nextletter" do
        context "given a mapped puzzle and nextletter_inwords" do
          it "checks if any LURD values for current letter are points that belong to next_letter" do
        end
      end
    end

  end # Puzzle_Solver describe do block
end #Puzzle_Solver class
