class Puzzle
require 'csv'



    def receive_single_input(input_file)
      file_array = IO.readlines(input_file)
    end


    def receive_input(input_file)
      file_array = IO.readlines(input_file)
      @@word_list = file_array[0].downcase.strip.split(/,/)
      @@letter_list = @@word_list.join("").chars.uniq
      return @@word_list
    end

    def letters_in_wordlist()
      @@letter_list = @@word_list.join("").chars.uniq
    end


end #puzzle class

test2 = Puzzle.new
test2.receive_input(ARGV[0])
puts test2.letters_in_wordlist
=begin
These are notes

#you should account for commas and spaces
#will need a function to validate square
#will need a function for grid_size, location hash
## min size for puzzle the longest word has to be able to fit on one line
## min size for puzzle is longest word <= column count
## I think the puzzle class should have some reflection of header and swl


=end
