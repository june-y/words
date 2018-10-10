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
  and the number of rows will match the number of characters in a line. (what is this)



OUTPUT:
      WORD: (X,Y),(X,Y),(X,Y) (as many locations as letters)


TESTING:
    unit testing
    integration testing

=end


describe Puzzle do

 describe ".receive_single_input" do #reading a txt file with a single line
    context "given a text file" do
      it "opens file and reads it" do  #fix this to test the NON single one
        puzzle = Puzzle.new
        expect(puzzle.receive_single_input("test_files/fixtures/hello.txt")).to eql(["hello\n"])
      end
    end
  end



end # Puzzle class




=begin


hash be like:



x-axis | y-axis | letter | isin_Word





## if I read line by line (because mapping the letters to cooridinates)
## I will need read char, ignore delimiter of space or comma, and record x/y
## and push values to hash



 puzzle = Puzzle.new
 puzzle.receive_input("test_files/test2.txt")
 expect(Puzzle.class_variable_get(@@word_list)).to eql(["juvenile,nectar,gold"])
 #expect(Puzzle.class_variable_get(@@square_with_letters)).to eql("")




=end
