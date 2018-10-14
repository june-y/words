require_relative 'puzzle.rb'
class Puzzle_Solver < Puzzle

  puzzle = Puzzle.new
  puzzle.receive_input

  def search_horizontally
    #search_horizontally = add to x one at a time, while running function for nearby words
    #puts @@mapped_puzzle
    #puts @@letter_list
    first_letter = @@letter_list[0]
    @@word_list.each do |word|
      word.each_char do |letter|
        puts (@@mapped_puzzle.find_all {|row| row[:letter] == letter } && )

        #
        #
        #
        #
      end
    end #word_list
    puts ""
  end #search_horizontally

=begin

[{},
{},
{}]

find all of the places where the letter is equal to that of the word list
increment the indice of x or y (based on function)


keep track of nearby letters -
    say I'm at point (5,4) letter = D, I should know that around it
    are the letters [B(),L(),S(),Y()]
                    [left(y-1),up(x-1),right(y+1),down(x+1)]


=end
    #{|key| key[:x_axis] == 0 }
    #@@mapped_puzzle.select{|point| point}



end #Puzzle_Solver class

test = Puzzle_Solver.new
test.search_horizontally

=begin
for @@word_list.each do |word|
  #find first letter of word nexpected '\n', expecting &. or :: or '[' or '.'on mapped_puzzle and return point
  for word.each do |letter|
  puts letter for mapped_puzzle[:x_axis => "0", :y_axis => "0"] # point => ["0","0"]
  puts point for mapped_puzzle[:letter => letter]
end #for do loop


@@mapped_puzzle.map do |hash|
  hash.select do |key, value|

    #value.select{:letter==first_letter}
=end
