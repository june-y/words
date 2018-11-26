require "spec_helper"
require "puzzle"

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
      puzzle = Puzzle.new
      puzzle.receive_input #test_files/test2.txt
      puzzle.isSquare() == (TRUE)
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
        it "create a hash" do
         puzzle = Puzzle.new
         puzzle.receive_input() #test_files/test2.txt
         expect(puzzle.map_text_to_hash).to include({:isin_Word=>true, :letter=>"o", :point=>[1, 0], :x_axis=>1, :y_axis=>0})
        end
      end
    end

end # Puzzle class
