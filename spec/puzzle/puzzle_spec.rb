require "spec_helper"
require "puzzle"


describe Puzzle do


  describe ".isWord_bigger_than_puzzle" do
    context "given a square_with_letters and a word list" do
      it "check if the longest words is at least the length the square" do
      puzzle = Puzzle.new
       puzzle.receive_input() #test_files/test4_abort.txt
       expect {puzzle.isWord_bigger_than_puzzle()}.to raise_error(SystemExit)
      end
    end
  end


end # Puzzle class
