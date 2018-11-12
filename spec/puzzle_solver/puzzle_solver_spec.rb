require "spec_helper"
require "puzzle_solver"


# search_horizontally = add to x one at a time, while running function for nearby words
# search_Vertically = add to y axis  ....
# search diagonally_descending = starting at letter, add to y, then add to x
# search diagonally_ascending = starting at letter, add to x, then y (kind of assumes your at the bottom)
# search backwards = all axes?? uncertain but will come back


class Puzzle_Solver
  describe Puzzle_Solver do

    describe ".create_expected_letterlist_forword(word_list)" do
      context "given words and output of compare_distances " do
        it " creates expected letter list with points and distances" do
          solver = Puzzle_Solver.new
          solver.nearby_letters() #test_files/test2.txt
          a_result = {:potential_letter=>"l", :potential_point=>[5, 1], :lindex=>2, :next_letter=>"d", :nearby_potential_point=>[4, 0], :potential_point_distance=>1.4142135623730951}
          expect(solver.create_expected_letterlist_forword().any? (a_result))
        end
      end
    end

    end # Puzzle_Solver describe do block

end   #Puzzle_Solver class
