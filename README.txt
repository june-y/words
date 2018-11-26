# Puzzle Solver


##Requirements
Ruby Version:
ruby 2.5.3p105

Rspec Version:
RSpec 3.8
  - rspec-core 3.8.0
  - rspec-expectations 3.8.2
  - rspec-mocks 3.8.0
  - rspec-support 3.8.0


##Installation
Download and unzip package
Enter words_master dir
Type in command line:
  gem install puzzle_solver-0.0.0.gem
  run bundle


##Usage

puzzle.rb:
  You do not need to run this. You COULD run it by entering

  'ruby lib/puzzle.rb'

  in the command line. No output

  Rspec Tests:
  rspec spec/puzzle/allpuzzle_spec.rb



puzzle_solver.rb:
  After entering:

  'ruby lib/puzzle_solver.rb'

You will be prompted for a file. Use this format

  'test_files/test1.txt'

  There are four text files that can be used for input
  test_files/test1.txt
  test_files/test2.txt
  test_files/test3.txt
  test_files/test5.txt

  Other test files are meant for specific tests.


  Rspec Tests:
  rspec spec/puzzle_solver/allpuzzle_solver_spec.rb

  Input:
  test_files/fixtures/hello.txt
  test_files/test2.txt
  test_files/test2.txt
  test_files/test2.txt
  test_files/test2.txt
  test_files/test4_abort.txt
  test_files/test2.txt

##Notes

     I do want to note that currently the solution does not output the desired result.
     Due to using a hash vs an array I had to somehow reflect "placement" of the letters. (As in
     is this letter the first letter, or the third etc.) Between all of the data manipulation
     I'm left with arrays filled with nested hashes/more arrays. I would like to believe I'm close
     to the final solution. I have currently stopped at comparing_distance_per_lindex. The potential_word_arr
     is keeping duplicate letters that I do not want.
