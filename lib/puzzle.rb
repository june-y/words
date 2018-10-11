class Puzzle
require 'csv'



    def receive_single_input()
      prompt = '> '
      puts "Enter text will full path please"
      input_file = $stdin.gets.chomp
      file_array = IO.readlines(input_file)
    end

    def receive_input()
      prompt = '> '
      puts "Enter text will full path please"
      input_file = $stdin.gets.chomp
      file_array = IO.readlines(input_file)
      @@word_list = file_array[0].downcase.strip.split(/,/)
      @@letter_list = @@word_list.join("").chars.uniq
      puzzle_row_count  = file_array.count
      grid_size = (puzzle_row_count - 1)
      @@square_with_letters = file_array[1..grid_size]
      @@square_with_letters = @@square_with_letters
      puts @@square_with_letters
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



   def isWord_bigger_than_puzzle()
     puts @@word_list.max_by(&:length)
     puts @@square_with_letters.reject { |c| c.empty? }
   end #isWord_bigger_than_puzzle


end #puzzle class

test2 = Puzzle.new
test2.receive_input
test2.isWord_bigger_than_puzzle()
#test2.letters_in_wordlist
#test2.isin_Words('a')

=begin
These are notes

#will need a function for grid_size, location hash
## min size for puzzle the longest word has to be able to fit on one line
## min size for puzzle is longest word <= column/row count



=end
