require_relative 'puzzle.rb'
class Puzzle_Solver < Puzzle

  puzzle = Puzzle.new
  puzzle.receive_input

  def nearby_letters()
    #nearby_letters = add to x one at a time, while running function for nearby words

    @lurd = []
    lurd_points = []
    @@word_list.each do |word|
      puts word
      word.each_char.with_index do |letter,index|
        @points_list = []
        create_pointslist(letter)
        @points_list.push(@letter_point)
        @points_list =  @points_list.flatten(1)
        p letter
        square_limit = @@square_with_letters.count
        @points_list.each do |point|
            x_axis = point[0]
            y_axis = point[1]
            if (x_axis) == 0
              #x_axis = "N"
              lurd_points = [x_axis,(y_axis-1)],[("N"),y_axis],[x_axis,(y_axis+1)],[(x_axis+1),y_axis]

              @lurd.push(lurd_points)
            elsif x_axis == square_limit
              #x_axis = "N"
              lurd_points = [x_axis,(y_axis-1)],[(x_axis-1),y_axis],[x_axis,(y_axis+1)],[("N"),y_axis]

              @lurd.push(lurd_points)
            elsif y_axis == 0
              #y_axis = "N"
              lurd_points = [x_axis,("N")],[(x_axis-1),y_axis],[x_axis,(y_axis+1)],[(x_axis+1),y_axis]

              @lurd.push(lurd_points)
            elsif y_axis == square_limit
              #y_axis = "N"
              lurd_points = [x_axis,(y_axis-1)],[(x_axis-1),y_axis],[x_axis,("N")],[(x_axis+1),y_axis]

              @lurd.push(lurd_points)
            else
              lurd_points = [x_axis,(y_axis-1)],[(x_axis-1),y_axis],[x_axis,(y_axis+1)],[(x_axis+1),y_axis]
              @lurd.push(lurd_points)
            end #if/else
        end #points_list
        #is_nearbyletter_in_wordlist(letter)
        end # word each char
    end #word_list
    #puts @@mapped_puzzle

  end #nearby_letters


#if any lurd_points = ((nextletter_inword(index))
#
#
#


  def nextletter_inword(index)
    @@word_list.each do |word|
      letterlist_perword = []
      word_count = word.length
      word.each_char do |letter|
        letterlist_perword << letter
      end
      next_letter = index + 1
      if next_letter = word_count
        p "No next letter"
      else
        p letterlist_perword[next_letter]
      end
      return letterlist_perword[next_letter]
    end

    end #nextletter_inword


  def letter_atpoint(point)
    @@mapped_letters = @@mapped_puzzle.find_all{|row| row[:point] == point}
    p @@mapped_letters
  end


  def is_nearbyletter_in_wordlist(letter)
    #for every mapped letter, check if any of the lurd points equals
    # the points for the next letter. NOT LETTER LIST
    #p @@word_list.strip(//).each_char
    a = []
     @lurd.flatten(1).each do |point|
        letter_atpoint(point)
        found = @@mapped_letters.find_all{|row| row[:point] == point} # unless (@@mapped_letters.select{|row| row[:point] == point}).empty?
        a << found.delete_if { |elem| elem.flatten.empty? }
      end
      #puts @@mapped_letters#.find_all {|row| row[:point] == point}
  end #is_nearby

  def create_pointslist(letter)

    @@mapped_letters = @@mapped_puzzle.find_all{|row| row[:letter] == letter}
    #keep track of nearby letters -[left(y-1),up(x-1),right(y+1),down(x+1)]
    @@mapped_letters.each do |letter_point|
      @letter_point = @@mapped_letters.flatten.map{|key| key[:point]}
    end #

    #puts ""
    return @points_list
  end #create_pointslist

#test_files/test2.txt

end #Puzzle_Solver class

test = Puzzle_Solver.new
test.nearby_letters
test.letter_atpoint([2,3])
test.letter_atpoint(nextletter_inword(2))




=begin

@@mapped_puzzle.map do |hash|
  hash.select do |key, value|

    #value.select{:letter==first_letter}


    [{},
    {},
    {}]

    find all of the places where the letter is equal to that of the word list
    increment the indice of x or y (based on function)

=end

=begin
    headers = ["left","up", "right", "down", "letter", "next_letter"]
    @@square_with_letters.each do |line|
      line.split(//)

      line.each_char do |letter|
        @mapped_letter = {
        :x_axis => x_value,
        :y_axis => y_value,
        :point =>  [x_value,y_value],
        :letter => letter.downcase,
        :isin_Word => (isin_Words(letter.downcase))
        }

          @@mapped_puzzle << @mapped_letter
      end #letter loop
=end
