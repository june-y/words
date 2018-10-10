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
# there should be a function to take input, which is a txt
    context "given a text file" do
      it "opens file and reads it" do
        expect(File.open("test_files/fixtures/hello.txt").read).to eq("hello\n")
      end
    end





end # Puzzle class

## if I read line by line (because mapping the letters to cooridinates)
## I will need read char, ignore delimiter of space or comma, and record x/y
## and push values to hash
