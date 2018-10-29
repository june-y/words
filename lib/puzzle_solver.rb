require_relative 'puzzle.rb'
require 'set'
class Puzzle_Solver < Puzzle
attr_reader :nearby_letters


  puzzle = Puzzle.new
  puzzle.receive_input

  def nearby_letters()
    #nearby_letters = add to x one at a time, while running function for nearby words

    @lurd = []
    lurd_points = {}
    @@word_list.each do |word|
      word.each_char.with_index do |letter,index|
        @@points_list = []
        create_pointslist(letter)
        @@points_list.push(@letter_point)
        @@points_list =  @@points_list.flatten(1)
        square_limit = @@square_with_letters.count
        @@points_list.each do |point|
            x_axis = point[0]
            y_axis = point[1]
            if (x_axis) == 0
              #x_axis = "N"
              lurd_points =
              # center point is x,y  x is columns y is rows
                 {
                   :letter => letter,
                   :point => point,
                   :left => [x_axis,(y_axis-1)],
                   :right => [x_axis,(y_axis+1)],
                   :up => [("N"),y_axis],
                   :down => [(x_axis+1),y_axis],
                   :left_up => [("N"),(y_axis+1)],
                   :right_up  => [(x_axis+1),(y_axis+1)],
                   :left_down => [("N"),(y_axis-1)],
                   :right_down => [(x_axis+1),(y_axis-1)]
                 }
              @lurd.push(lurd_points)
            elsif x_axis == square_limit
              #x_axis = "N"
              lurd_points =
              # center point is x,y  x is columns y is rows
                 {
                   :letter => letter,
                   :point => point,
                   :left => [x_axis,(y_axis-1)],
                   :right => [x_axis,(y_axis+1)],
                   :up => [(x_axis-1),y_axis],
                   :down => [("N"),y_axis],
                   :left_up => [(x_axis-1),(y_axis+1)],
                   :right_up  => [("N"),(y_axis+1)],
                   :left_down => [(x_axis-1),(y_axis-1)],
                   :right_down => [("N"),(y_axis-1)]
                 }
              @lurd.push(lurd_points)
            elsif y_axis == 0
              #y_axis = "N"
              lurd_points =
              # center point is x,y  x is columns y is rows
                 {
                   :letter => letter,
                   :point => point,
                   :left => [x_axis,("N")],
                   :right => [x_axis,(y_axis+1)],
                   :up => [(x_axis-1),y_axis],
                   :down => [(x_axis+1),y_axis],
                   :left_up => [(x_axis-1),(y_axis+1)],
                   :right_up  => [(x_axis+1),(y_axis+1)],
                   :left_down => [(x_axis-1),("N")],
                   :right_down => [(x_axis+1),("N")]
                 }
              @lurd.push(lurd_points)
            elsif y_axis == square_limit
              #y_axis = "N"
              lurd_points =
              # center point is x,y  x is columns y is rows
                 {
                   :letter => letter,
                   :point => point,
                   :left => [x_axis,y_axis-1],
                   :right => [x_axis,"N"],
                   :up => [(x_axis-1),y_axis],
                   :down => [(x_axis+1),y_axis],
                   :left_up => [(x_axis-1),("N")],
                   :right_up  => [(x_axis+1),("N")],
                   :left_down => [(x_axis-1),(y_axis-1)],
                   :right_down => [(x_axis+1),(y_axis-1)]
                 }
              @lurd.push(lurd_points)
            else
              lurd_points =
              # center point is x,y  x is columns y is rows
                 {
                   :letter => letter,
                   :point => point,
                   :left => [x_axis,(y_axis-1)],
                   :right => [x_axis,(y_axis+1)],
                   :up => [(x_axis-1),y_axis],
                   :down => [(x_axis+1),y_axis],
                   :left_up => [(x_axis-1),(y_axis+1)],
                   :right_up  => [(x_axis+1),(y_axis+1)],
                   :left_down => [(x_axis-1),(y_axis-1)],
                   :right_down => [(x_axis+1),(y_axis-1)]
                 }
              @lurd.push(lurd_points)
            end #if/else
          end #points_list
        end # word each char
      end #word_list
    return @lurd
  end #nearby_letters


  def add_lurd_to_mapped_letters()
        index = @lurd.group_by{|entry| [entry[:letter], entry[:point]]}
        @@puzzle_w_lurd = @@mapped_puzzle.map{|entry| (index[[entry[:letter], entry[:point]]] || []).reduce(entry, :merge)}
        # @@puzzle_w_lurd
        return @@puzzle_w_lurd
  end #add lurd to hash


  def nextletter_inwords()
    windex = 0
    @@nextletter_list = Array.new()
    words_withindices = {}
    word_array = []
    @@word_list.each.with_index do |word,windex|
      limit = word.length
      word_array = word.split(//)
      word.each_char.with_index do |letter,lindex|
        next_index = 0
        next_index = (lindex + 1)
        next_letter = letter.next
        if next_index == limit
          next_index = "N"
        end
        words_withindices =
           {
             :word => word,
             :word_index => windex,
             :letter => letter,
             :letter_index => lindex,
             :next_index => next_index,
             :next_letter => word_array[(lindex + 1)]
           }
        @@nextletter_list.push(words_withindices)
        end #do letter
        windex =+ 1
      end #@@word_list
    return @@nextletter_list
  end #nextletter_inword


  def letters_atpoint(point)
    @@all_letters_atpoint = @@mapped_puzzle.find_all{|row| row[:point] == point}
    #p @@all_letters_atpoint
    return @@all_letters_atpoint
  end


  def create_pointslist(letter)
    @@allpoints_forletter = @@mapped_puzzle.find_all{|row| row[:letter] == letter}
    @@allpoints_forletter.each do |letter_point|
      @letter_point = @@allpoints_forletter.flatten.map{|key| key[:point]}
    end #
    return @@allpoints_forletter
  end #create_pointslist



  def search_horizontally
    #puts @@puzzle_w_lurd
    nextletter_inwords()
    windex = 0

    @@word_list.each_with_index do |word,windex|
      #puts word
      @@points_list = []
      @pointsarray_forword = []
      @letterlist_forword = word.chars
      p @letterlist_forword   #@@nextletter_list
      currentword_nextletter_list = @@nextletter_list.find_all{|row| (row[:word_index] == windex) && (row[:word] == word) }
      p currentword_nextletter_list
      word.each_char.with_index do |letter,lindex|
        #puts ("Current letter is #{letter}" )
        letter_list = currentword_nextletter_list.find_all{|row| row[:letter] == letter }
        @current_letter = letter_list[0][:letter]
        @next_letter = letter_list[0][:next_letter]
        p @current_letter
        p @next_letter
        nextletter_points = create_pointslist(@current_letter)
        nextletter_points.each do |row|
            @next_point = row.values_at(:point).flatten
            @next_x = @next_point[0]
            @next_y = @next_point[1]
            p "next point: #{@next_point}"
            p letters_atpoint(@next_point)

            nearbypoints_list(@next_point).each do |point|
              p point
              tmp_letter = @letterlist_forword[lindex]
              possiblepoints_forword = letters_atpoint(point) #returns
              possiblepoints_forword.delete_if{|row| row[:isin_Word] == "FALSE" }
               #.any? {|letter| letter == (possiblepoints_forword.map{|key| key[:letter]})}
              possiblepoints_letter = possiblepoints_forword.map{|key| key[:letter]}
              possiblepoints_forword.map{|key| key[:letter]}

              p possiblepoints_letter
              if ((possiblepoints_letter.include? tmp_letter) == true)
                puts "This point #{point} #{possiblepoints_letter}"
                @@points_list << point
                # you could check array size is not bigger than word
              end #if statement
            end # nearbypoints_list each
            lindex += 1
        end #nextletter_points each
        windex += 1
      end #each char
      unique_arr = @@points_list.uniq
      unique_arr.each do |point|
        p letters_atpoint(point)
      end
    end #each word
  end #search horizantally


  #test_files/test2.txt


  def nearbypoints_list(point)
      lurd_for_point = @@puzzle_w_lurd.find_all{|row| (row[:point] == point) }
      nearbypoints_array = []
      nearbypoints_array << lurd_for_point[0][:left]
      nearbypoints_array << lurd_for_point[0][:right]
      nearbypoints_array << lurd_for_point[0][:up]
      nearbypoints_array << lurd_for_point[0][:down]
      nearbypoints_array << lurd_for_point[0][:left_up]
      nearbypoints_array << lurd_for_point[0][:left_down]
      nearbypoints_array << lurd_for_point[0][:right_up]
      nearbypoints_array << lurd_for_point[0][:right_down]
      return nearbypoints_array
  end



  def print_output
    windex = 0
    @@word_list.each_with_index do |word,windex|
      p "#{word}: "
    end # word list do
  end



end #Puzzle_Solver class

test = Puzzle_Solver.new
test.nearby_letters
test.add_lurd_to_mapped_letters()
#test.nearbypoints_list([5,6])
test.search_horizontally()
#test.nextletter_inwords(2)




=begin

points_for_word = []
create_pointslist(letter)
@@points_list.push(@letter_point)
@@points_list =  @@points_list.flatten(1)

#test_files/test2.txt



# add to @letterlist_forword here, because it is actually on the first
# letter. and ideally points list is only going to have points

@@points_list.each do |point|
  x_axis = point[0]
  y_axis = point[1]
  #p ["#{x_axis}","#{y_axis}"]
  points_for_currentletter = letters_atpoint(point)
  puts "current letter"
   lurd_for_letter = @@puzzle_w_lurd.find_all{|row| (row[:point] == point) }
   #lurd_for_letter.delete_if {|row| (row[:left] || row[:right] ) == [x_axis,"N"]  }
   lurd_for_letter.each do |row|

     currentletter_points = row.values_at(:point).flatten
     #letters_atpoint(row[:left]).delete_if{|row| row[:isin_Word] == "FALSE" }
     #letters_atpoint(row[:right]).delete_if{|row| row[:isin_Word] == "FALSE" }

     left_letter_strip =  letters_atpoint(row[:left])
     left_letter = left_letter_strip.last.to_a.flatten.values_at(8)
     left_letter = left_letter[0]
     #p left_letter.instance_of? String
     right_letter_strip = letters_atpoint(row[:right])
     right_letter = right_letter_strip.last.to_a.flatten.values_at(8)
     right_letter = right_letter[0]
     p "letter #{row[:letter]} point#{row[:point]}"
     p "next letter #{@next_letter} next point #{@next_point}"
     p nearbypoints_list(point)
     p "left letter #{left_letter}, right letter #{right_letter}"
     p "left point #{row[:left]}, right point #{row[:right]}"


     if ((left_letter == @next_letter) && ((nearbypoints_list(point)).any?(row[:point])))
          #is the letter I'm looking at, the next letter, AND is it also within 1

       # if you find a good letter do two things: add letter and point
        puts "Found letter to the left"
        #@pointsarray_forword << left_letter # letter
        #@pointsarray_forword << row[:left] # point
     elsif ((right_letter  == @next_letter) && ((nearbypoints_list(point)).any?(row[:point])))
        #@pointsarray_forword << right_letter
        #@pointsarray_forword << row[:right]
        puts "Found letter to the right"

      end #if statement

   end #do loop lurd_For_letter
end # points list
=end
