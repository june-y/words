require_relative 'puzzle.rb'
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
                   :left => [("N"),y_axis],
                   :right => [x_axis+1,y_axis],
                   :up => [x_axis,(y_axis+1)],
                   :down => [x_axis,(y_axis-1)],
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
                   :left => [x_axis-1,y_axis],
                   :right => ["N",y_axis],
                   :up => [x_axis,(y_axis+1)],
                   :down => [x_axis,(y_axis-1)],
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
                   :left => [x_axis-1,y_axis],
                   :right => [x_axis+1,y_axis],
                   :up => [x_axis,(y_axis+1)],
                   :down => [x_axis,("N")],
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
                   :left => [x_axis-1,y_axis],
                   :right => [x_axis+1,y_axis],
                   :up => [x_axis,("N")],
                   :down => [x_axis,(y_axis-1)],
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
                   :left => [x_axis-1,y_axis],
                   :right => [x_axis+1,y_axis],
                   :up => [x_axis,(y_axis+1)],
                   :down => [x_axis,(y_axis-1)],
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
    @@all_points_atletter = @@mapped_puzzle.find_all{|row| row[:letter] == letter}
    @@all_points_atletter.each do |letter_point|
      @letter_point = @@all_points_atletter.flatten.map{|key| key[:point]}
    end #
    return @@all_points_atletter
  end #create_pointslist

#test_files/test2.txt


  def search_horizontally
    #puts @@puzzle_w_lurd
    nextletter_inwords()
    windex = 0
    @@word_list.each_with_index do |word,windex|
      puts word

      currentword_nextletter_list = @@nextletter_list.find_all{|row| (row[:word_index] == windex) && (row[:word] == word) }
      p currentword_nextletter_list
      word.each_char.with_index do |letter,index|
        p letter
        @@points_list = []
        create_pointslist(letter)
        @@points_list.push(@letter_point)
        @@points_list =  @@points_list.flatten(1)
        @@points_list.each do |point|
          points_for_currentletter = letters_atpoint(point)
          puts points_for_currentletter
          #@@horizantal_points = @@puzzle_w_lurd.find_all{|row| (row[:left] || row[:right])== point}
          #if #left point or right point equal == a next letter
       end #each char
        windex += 1
      end #each word
    end #search horizantally

    #puts @@all_letters_atpoint()
  end #search horizantally

  def isLURD_nextletter(letter)
     @@puzzle_w_lurd.find_all{|row| row[:letter] == letter}

  end


end #Puzzle_Solver class

test = Puzzle_Solver.new
test.nearby_letters
test.add_lurd_to_mapped_letters()
test.nextletter_inwords()
test.search_horizontally()
#test.nextletter_inwords(2)






=begin


=end
