class Puzzle
require 'csv'

def receive_single_input(input_file)
  file_array = IO.readlines(input_file)
end


def receive_input(input_file)
  file_array = IO.readlines(input_file)
  @@word_list = file_array[0].strip.parse_csv
  puzzle_row_count  = file_array.count
  grid_size = (puzzle_row_count - 1)
  @@square_with_letters = file_array[1..grid_size]
end


end


=begin
These are notes

#you should account for commas and spaces
#will need a function to validate square
#will need a function for grid_size, location hash
## min size for puzzle the longest word has to be able to fit on one line
## min size for puzzle is longest word <= column count


=end
