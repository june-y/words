require "spec_helper"
require "puzzle_solver"


class Puzzle_Solver
  describe Puzzle_Solver do

        describe ".create_pointslist" do
          context "given a letter " do
            it "returns a list of all letters in mapped puzzle" do
              solver = Puzzle_Solver.new
              expect(solver.create_pointslist("t")).to be_instance_of(Array)
            end
          end
        end

        describe ".letters_atpoint" do
          context "given a point " do
            it "returns the mapped letter at that index" do
              solver = Puzzle_Solver.new
              solver.nearby_letters()
              #expect(solver.letters_atpoint([2,3])).to be_instance_of(Array)
              expect(solver.letters_atpoint([3,4])).to include({:x_axis=>3, :y_axis=>4, :point=>[3, 4], :letter=>"e", :isin_Word=>true})
          end
        end
      end


      describe ".nearby_letters" do
        context "given the puzzle class and input has been received" do
          it "returns an array of [left(y-1),up(x-1),right(y+1),down(x+1),[(x_axis-1),((y_axis-1)],[(x_axis-1),(y_axis+1)],[(x_axis+1),(y_axis+1)],[(x_axis+1),(y_axis-1)]]" do
            solver = Puzzle_Solver.new #test_files/test2.txt
            expect(solver.nearby_letters()).to include({:down=>[2, 4],:left=>[1, 3],:left_down=>[0, 3], :left_up=>[0, 5],:letter=>"e", :point=>[1, 4], :right=>[1, 5],:right_down=>[2, 3],:right_up=>[2, 5],:up=>[0, 4]})
        end
      end
    end


    describe ".add_lurd_to_hash" do
      context "given the @@mapped_hash, and having ran nearby_letters" do
        it "adds a column to @@mapped_hash, with lurd values" do
         solver = Puzzle_Solver.new
         solver.nearby_letters() #test_files/test2.txt
         expect(solver.add_lurd_to_mapped_letters()).to include({:isin_Word=>false, :letter=>"y", :point=>[6, 4], :x_axis=>6, :y_axis=>4})
        end
      end
    end


    describe ".nearbypoints_list(point)" do
      context "given a point, and add_lurd_to_mapped_letters() has been run" do
        it "outputs surrounding points" do
          solver = Puzzle_Solver.new
          solver.nearby_letters()
          expect(solver.nearbypoints_list([5,4])).to include ([6, 5])
        end
      end
    end



    describe ".nextletter_inword" do
      context "given an index (int) " do
        it "returns a list of all letters at that index in mapped puzzle" do
          solver = Puzzle_Solver.new
          expect(solver.nextletter_inwords()).to include( {:letter=>"u",:letter_index=>1,:next_index=>2,:next_letter=>"v",:word=>"juvenile",:word_index=>0})
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

      describe ".create_potential_letterlist_forword(word_list)" do
        context "given words and output of compare_distances_relative_to_lindex " do
          it " creates expected letter list with points and distances" do
            solver = Puzzle_Solver.new
            solver.nearby_letters() #test_files/test2.txt
            a_result = {:potential_letter=>"l", :potential_point=>[5, 1], :lindex=>2, :next_letter=>"d", :nearby_potential_point=>[4, 0], :potential_point_distance=>1.4142135623730951}
            expect(solver.create_potential_letterlist_forword().any? (a_result))
          end
        end
      end

      describe ".arepoints_Consecutive(point1,point2)" do
        context "given two points " do
          it "returns true if the point is next to it (as per lurd)" do
            solver = Puzzle_Solver.new
            solver.nearby_letters() #test_files/test2.txt
            expect(solver.arepoints_Consecutive([1,4],[2,1]) == false)
            #expect(solver.arepoints_Consecutive([1,2],[2,1]) == true)
          end
        end
      end


  describe ".compare_distances_relative_to_lindex(points_per_lindex)" do
    context "given an hash with lindex as key, and points as values" do
      it "outputs array of correct points" do
      end
    end
  end

  describe ".print_output" do
    context "given the results from search " do
      it "outputs results in desired format" do
      end
    end
  end



  end # Puzzle_Solver describe do block
end #Puzzle_Solver class
