require "spec_helper"
require "puzzle"


# search_horizontally = add to x one at a time, while running function for nearby words
# search_Vertically = add to y axis  ....
# search diagonally_descending = starting at letter, add to y, then add to x
# search diagonally_ascending = starting at letter, add to x, then y (kind of assumes your at the bottom)
# search backwards = all axes?? uncertain but will come back


class Puzzle_Solver
  describe Puzzle_Solver do

      context "a puzzle solver uses a Puzzle" do # class Puzzle_Solver < Puzzle
          it 'should inherit behavior from Puzzle' do
            expect(Puzzle_Solver).to respond_to?(:inherited_method)
          end
        end


      describe ".letter_atpoint" do
        context "given a point " do
          it "returns the mapped letter at that index" do
            solver = Puzzle_Solver.new
            solver.nearby_letters()
            expect{solver.letter_atpoint([2,3])}.to be_instance_of(array)
        end
      end
    end


      describe ".create_pointslist" do
        context "given a letter " do
          it "returns a list of all letters in mapped puzzle" do
            solver = Puzzle_Solver.new
            expect{solver.create_pointslist}.to include()
          end
        end
      end

      describe ".letter_atpoint" do
        context "given a point " do
          it "returns the mapped letter at that index" do
            solver = Puzzle_Solver.new
            solver.nearby_letters()
            expect{solver.letter_atpoint([2,3])}.to be_instance_of(array)
        end
      end
    end


          describe ".nearby_letters" do
            context "given a " do
              it "returns an array of [left(y-1),up(x-1),right(y+1),down(x+1)]" do
                solver = Puzzle_Solver.new
                expect{solver.nearby_letters()}
            end
          end
        end


        describe ".search_horizontally" do
          context "given a puzzle" do
            it "can search for words search_horizontally" do
          end
        end
      end



  end # Puzzle_Solver describe do block
end #Puzzle_Solver class
