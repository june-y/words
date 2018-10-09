class Puzzle


def receive_input(input_file)
  file_array = IO.readlines(input_file)
  word_list = file_array[0]
  puzzle_row_count  = file_array.count
  grid_size = (puzzle_row_count - 1)
  puts word_list
  puzzle_body =
  #you should account for commas and spaces
end

#will need a function to clean word_list/turn into its own array

#will need a function to validate square

#will need a function for grid_size location hash


## min size for puzzle the longest word has to be able to fit on one line
## min size for puzzle is longest word <= column count

new.receive_input(ARGV[0])

end


##  for index in (0...grid_size)
##    create hash
## end
