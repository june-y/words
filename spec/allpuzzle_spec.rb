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


  describe ".receive_single_input" do #reading a txt file with a single line
   context "given a text file" do
     it "opens file and reads it" do
       puzzle = Puzzle.new
       #expect(puzzle.receive_single_input()).to be_an_instance_of(Array)
       expect(puzzle.receive_single_input()).to eql(["hello\n"]) # test_files/fixtures/hello.txt
     end
   end
 end

describe ".letters_in_wordlist" do #is this letter in the words in the word list (goes thru all)
 context "given a list of words" do
   it "will be one array with unique letters looking for" do
     puzzle = Puzzle.new
     puzzle.receive_input() #test_files/test2.txt
     expect(puzzle.letters_in_wordlist()).to eq(["j", "u", "v", "e", "n", "i", "l", "c", "t", "a", "r", "g", "o", "d"])
     #right now this is failing because input for this function is based off
     #of the ARGV[0] from receive_input.
   end
 end
end

describe ".isin_Words" do #is this letter in the words in the word list (goes thru all)
   context "given an input letter" do
     it "return true if the input letter is in the letter_list" do
       puzzle = Puzzle.new
       puzzle.receive_input() #test_files/test2.txt

       expect(puzzle.isin_Words('e')) == (TRUE)
       expect(puzzle.isin_Words('y')) == (FALSE)
     end
   end
 end


describe ".clean_Square" do #
  context "given a square_with_letters" do
    it "will remove tabs, commas, empty lines, returning an array" do
      puzzle = Puzzle.new
      puzzle.receive_input() #test_files/test2.txt
      expect(puzzle.cleanSquare).to include("RATCENTJ")
    end
  end
end

describe ".isSquare" do #checking if square_with_letters is actually a square
  context "given a square_with_letters" do
    it "will return true if length and width are equal" do
      test2 = Puzzle.new
      test2.receive_input #test_files/test2.txt
      test2.isSquare() == (TRUE)
    end
  end
end

  describe ".isWord_bigger_than_puzzle" do
    context "given a square_with_letters and a word list" do
      it "check if the longest words is at least the length the square" do
      puzzle = Puzzle.new
       puzzle.receive_input() #test_files/test4_abort.txt
       expect {puzzle.isWord_bigger_than_puzzle()}.to raise_error(SystemExit)
      end
    end
  end


  describe ".map_text_to_hash" do
    context "given a square_with_letters" do
      it "creates a hash" do
       puzzle = Puzzle.new
       puzzle.receive_input() #test_files/
       expect(puzzle.map_text_to_hash).to include({:x_axis=>63, :y_axis=>7, :point=>"(63,7)", :letter=>"v", :isin_Word=>"TRUE"})
      end
    end
  end



end # Puzzle class


=begin

do you want a hash just for the words, so that you can more easily search for
next letter?

hash be like:


x-axis | y-axis | letter | isin_Word


=end
