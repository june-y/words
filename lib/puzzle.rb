class Puzzle

    def receive_single_input()
      puts "Enter text will full path please"
      input_file = $stdin.gets.chomp
      @file_array = IO.readlines(input_file)
    end

    def receive_input()
      puts "Enter text will path relative to current directory"
      input_file = $stdin.gets.chomp
      @file_array = IO.readlines(input_file)
      @@word_list = @file_array[0].downcase.strip.split(/,/)
      @@letter_list = @@word_list.join("").chars.uniq
      cleanSquare()
      puts "cleaned"
      isSquare()
      map_text_to_hash()
      letters_in_wordlist()
      return @@word_list
    end


    def letters_in_wordlist()
      @@letter_list = @@word_list.join("").chars.uniq
      return @@letter_list
    end

    def isin_Words(letter_input)
        if (@@letter_list.any? letter_input )
      		return true
      	else
          return false
        end
    end #end of isin_Word()


    def map_text_to_hash
      @@mapped_puzzle = []
      x_value = 0
      @@square_with_letters.each do |line|
        line.split(//)
        y_value = 0
        line.each_char do |letter|
          @mapped_letter = {
          :x_axis => x_value,
          :y_axis => y_value,
          :point =>  [x_value,y_value],
          :letter => letter.downcase,
          :isin_Word => (isin_Words(letter.downcase))
          }
            y_value += 1
            @@mapped_puzzle << @mapped_letter
        end #letter loop
        x_value += 1
      end

      return @@mapped_puzzle
    end #map to text

    def cleanSquare() #plan for this function to work
        replace_With = [["\t",""],[",",""],["\s+",""],["\n",""]]
        @@square_with_letters = []
        @file_array.drop(1).each do |line|
          replace_With.each {|replace_With| line.gsub!(replace_With[0], replace_With[1])}
          @@square_with_letters << line unless line.chomp.empty?
          end
          return @@square_with_letters
    end


    def isSquare()
      if (@@square_with_letters.count == @@square_with_letters[0].length)
        return true
      else
        return false
      end

    end


    def isWord_bigger_than_puzzle()
      if (@@word_list.max_by(&:length).length > @@square_with_letters[0].length)
        abort("A puzzle word is larger than the puzzle itself. REJECTED")
      end
    end #isWord_bigger_than_puzzle



end #puzzle class
