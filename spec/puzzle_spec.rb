require "spec_helper"
require "puzzle"

=begin

RULES:
reject puzzle if its not a square -
        pick a min size; min for words and puzzle size
        word class?
            can be read horizontally, vertically, diagonally, and both forwards and backwards
            Words will be a minimum of two letters long


INPUT:
 first line of the text file will consist of the list of words to be found
    separated by commas

  remaining lines are randomized characters
  and the number of rows will match the number of characters in a line

OUTPUT:
      WORD: (X,Y),(X,Y),(X,Y) (as many locations as letters)


TESTING:
    unit testing
    integration testing

=end


describe Puzzle do



  describe ".map_text_to_hash" do
    context "given a square_with_letters" do
      it "create a hash" do
       puzzle = Puzzle.new
       puzzle.receive_input() #test_files/
       expect(puzzle.map_text_to_hash).to include({:x_axis=>63, :y_axis=>7, :point=>"(63,7)", :letter=>"v", :isin_Word=>"TRUE"})
       #(:x_axis=>1, :y_axis=>0)
      end
      #{:x_axis=>27, :y_axis=>3, :point=>"(27,3)", :letter=>"p", :isin_Word=>"FALSE"}
    end
  end



end # Puzzle class


=begin

do you want a hash just for the words, so that you can more easily search for
next letter?

hash be like:


x-axis | y-axis | letter | isin_Word


=end
