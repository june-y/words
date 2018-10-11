require "spec_helper"
require "puzzle"

=begin

RULES:
reject puzzle if its not a square -
        pick a min size; min for words and puzzle size
        word class?
            can be read horizontally, vertically, diagonally, and both forwards and backwards
            Words will be a minimum of two letters long

        ** I'm a little uncertain on the aspect


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

   describe ".isWord_bigger_than_puzzle" do
     context "given a square_with_letters and a word list" do
       it "return true if length and width are equal" do
         square_with_letters.size = []
         expect(variable).to be_in([true, false])
       end
     end
   end






end # Puzzle class


=begin


hash be like:


x-axis | y-axis | letter | isin_Word


=end
