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


end #puzzle class

#test2 = Puzzle.new
#test2.receive_input
#test2.letters_in_wordlist
#test2.isin_Words('a')

=begin
These are notes

#will need a function for grid_size, location hash
## min size for puzzle the longest word has to be able to fit on one line
## min size for puzzle is longest word <= column/row count



=end
