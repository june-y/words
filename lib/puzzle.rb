class Puzzle
require 'csv'



    def receive_single_input()
      prompt = '> '
      puts "Enter text will full path please"
      input_file = $stdin.gets.chomp
      @file_array = IO.readlines(input_file)
    end

    def receive_input()
      prompt = '> '
      puts "Enter text will full path please"
      input_file = $stdin.gets.chomp
      @file_array = IO.readlines(input_file)
      @@word_list = @file_array[0].downcase.strip.split(/,/)
      @@letter_list = @@word_list.join("").chars.uniq
      cleanSquare()
      grid_size = @@square_with_letters.count
      return @@word_list
    end

    def letters_in_wordlist()
      @@letter_list = @@word_list.join("").chars.uniq
    end

    def isin_Words(letter_input)
    #could optimize to consider if you just go through the alphabet...
        if (@@letter_list.any? letter_input )  #d in dog, cat or frog
      		puts "TRUE"
          ##set value for this key to 1/true,
      	else
          puts "FALSE"
        end

    end #end of isin_Word()



    def cleanSquare() #plan for this function to work
        puzzle_row_count  = @file_array.count

        replace_With = [["\t",""],[",",""],["\s+",""],["\n",""]]
        @@square_with_letters = []
        @file_array.drop(1).each do |line|
          #read line and remove tabs,commas, empty readlines
          #for each letter, enter x-axis,y-axis, isin_Words value, and
          #figure out a function that per word, what is the next letter in line,
          #and what is that position
          replace_With.each {|replace_With| line.gsub!(replace_With[0], replace_With[1])}
          @@square_with_letters << line unless line.chomp.empty?
          end
          ##  grid_size = @@square_with_letters.count #count of the arrays after cleaning
          return @@square_with_letters
      end




   def isWord_bigger_than_puzzle()
     puts @@word_list.max_by(&:length)

   end #isWord_bigger_than_puzzle


end #puzzle class

#test2 = Puzzle.new
#test2.receive_input
#test2.isWord_bigger_than_puzzle()
#test2.letters_in_wordlist
#test2.isin_Words('a')

=begin
These are notes

#will need a function for grid_size, location hash
## min size for puzzle the longest word has to be able to fit on one line
## min size for puzzle is longest word <= column/row count


#the puzzle solver class will read like:
# search_horizontally = add to x one at a time, while running function for nearby words
# search_Vertically = add to y axis  ....
# search diagonally_descending = starting at letter, add to y, then add to x
# search diagonally_ascending = starting at letter, add to x, then y (kind of assumes your at the bottom)
# search backwards = all axes?? uncertain but will come back



=end
