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


        describe ".create_pointslist" do
          context "given a letter " do
            it "returns a list of all letters in mapped puzzle" do
              solver = Puzzle_Solver.new
              expect(solver.create_pointslist("t")).to be_instance_of(Array)
              #expect(solver.create_pointslist()).to include()
            end
          end
        end

      describe ".letters_atpoint" do
        context "given a point " do
          it "returns the mapped letter at that index" do
            solver = Puzzle_Solver.new
            solver.nearby_letters()
            #expect(solver.letters_atpoint([2,3])).to be_instance_of(Array)
            expect(solver.letters_atpoint([3,4])).to include({:x_axis=>3, :y_axis=>4, :point=>[3, 4], :letter=>"e", :isin_Word=>"TRUE"})
        end
      end
    end


    describe ".nearby_letters" do
      context "given a " do
        it "returns an array of [left(y-1),up(x-1),right(y+1),down(x+1),[(x_axis-1),((y_axis-1)],[(x_axis-1),(y_axis+1)],[(x_axis+1),(y_axis+1)],[(x_axis+1),(y_axis-1)]]" do
          solver = Puzzle_Solver.new
          expect(solver.nearby_letters()).to include(:point=>[7, 3], :letter=>"g", :left=>[6, 3], :right=>[8, 3], :up=>[7, 4], :down=>[7, 2], :left_up=>[6, 4], :right_up=>[8, 4], :left_down=>[6, 2], :right_down=>[8, 2])
      end
    end
  end


    describe ".add_lurd_to_hash" do
      context "given the @@mapped_hash, and having ran nearby_letters" do
        it "adds a column to @@mapped_hash, with lurd values" do
         solver = Puzzle_Solver.new
         solver.nearby_letters() #test_files/test2.txt
         expect(solver.add_lurd_to_mapped_letters()).to include({:x_axis=>7, :y_axis=>7, :point=>[7, 7], :letter=>"v", :isin_Word=>"TRUE", :left=>[6, 7], :right=>[8, 7], :up=>[7, 8], :down=>[7, 6], :left_up=>[6, 8], :right_up=>[8, 8], :left_down=>[6, 6], :right_down=>[8, 6]})
        end
      end
    end

    describe ".nextletter_inword" do
      context "given an index (int) " do
        it "returns a list of all letters at that index in mapped puzzle" do
          solver = Puzzle_Solver.new
          expect(solver.nextletter_inwords(2)).to include("t")
        end
      end
    end


    describe ".determine_distance" do
      context "given a list coontaining points, check the distance between them" do
        it "selects the ones that are consecutive (those with the same distance)" do
          solver = Puzzle_Solver.new
          point1 = [3,10]
          point2 = [1,5]
          answer = solver.determine_distance(point1,point2)
          expect(answer).to eq(5.385164807134504)
          #expect(answer).to be_a(Float)
          end
        end
      end

      describe ".clean_nearbypointslist(point)" do
        context "given a point" do
          it "outputs nearby points, removing if it contains a string, is empty, if point is out of range" do
            solver = Puzzle_Solver.new
            solver.nearby_letters() #test_files/test2.txt
            point = [5,6]
            nearby_point = [4, 7]
            expect(solver.clean_nearbypointslist(point)).to include(nearby_point)
          end
        end
      end

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
      

  describe ".compare_distances(points_per_lindex)" do
    context "given an hash with linde as key, and points as values" do
      it "outputs string with word and points" do
      end
    end
  end

  describe ".print_output" do
    context "given the results from search " do
      it "outputs results in desired format" do
      end
    end
  end

  describe ".search" do
    context "given a word list and a puzzle" do
      it "will find the points for the words" do
    end
  end
end


  end # Puzzle_Solver describe do block
end #Puzzle_Solver class