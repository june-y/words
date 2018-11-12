require_relative 'puzzle.rb'
require 'set'
include Math
class Puzzle_Solver < Puzzle
attr_reader :nearby_letters


  puzzle = Puzzle.new
  puzzle.receive_input

  def nearby_letters()
    #nearby_letters = add to x one at a time, while running function for nearby words
    @square_limit = @@square_with_letters.count
    @@boundary_limit = (@square_limit - 1)
    @lurd = []
    lurd_points = {}
    @@word_list.each do |word|
      word.each_char.with_index do |letter,index|
        @@points_list = []
        create_pointslist(letter)
        @@points_list.push(@letter_point)
        @@points_list =  @@points_list.flatten(1)

        @@points_list.each do |point|
            x_axis = point[0]
            y_axis = point[1]
            if (x_axis) == 0 # || x_axis < 0
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
            elsif x_axis == @square_limit
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
            elsif y_axis == @square_limit
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
        nearby_letters()
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
    return @@all_letters_atpoint
  end

  def create_pointslist(letter)
    @@allpoints_forletter = @@mapped_puzzle.find_all{|row| row[:letter] == letter}
    @@allpoints_forletter.each do |letter_point|
      @letter_point = @@allpoints_forletter.flatten.map{|key| key[:point]}
    end #
    return @@allpoints_forletter
  end #create_pointslist

  def nearbypoints_list(point)
      nearbypoints_array = []
      lurd_for_point = @@puzzle_w_lurd.find_all{|row| (row[:point] == point) }
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


  def clean_nearbypointslist(point)
    nearbypoints = nearbypoints_list(point)
    cleaned_nearbypoints = nearbypoints.delete_if {|obj| (obj[0].is_a? String) || (obj[1].is_a? String)  || (obj.nil? == true)  || (obj[0] < 0 ) || (obj[1] < 0 )  }
    very_cleaned_nearbypoints = cleaned_nearbypoints.delete_if {|obj| (obj[0] > @@boundary_limit) || (obj[1] > @@boundary_limit) }
    return very_cleaned_nearbypoints
  end


  def determine_distance(point1,point2)
    x_value1 = point1[0]
    y_value1 = point1[1]
    x_value2 = point2[0]
    y_value2 = point2[1]
    x_result = (x_value2 - x_value1)
    x_square = x_result**(2)
    y_result = (y_value2 - y_value1)
    y_square = y_result**(2)
    @distance = Math.sqrt((x_square + y_square))
    return @distance
  end

  def compare_distances(points_per_lindex)
    if ((@points_per_lindex.count == 1) && (@lindex == 0))
        p "1"
        @point1 = @points_per_lindex
        p @point1
        if (@nextpoints_per_lindex.count == 1)
          @point2 = @nextpoints_per_lindex.flatten
          #distance1 = determine_distance(@point1,@point2)
          #@expected_letterlist_forword[0][:nearby_point] = @point2
          #@expected_letterlist_forword[0][:distance_from_currentpoint_to_nextletterpoint] = distance1
        else (@nextpoints_per_lindex.count > 1)
          @nextpoints_per_lindex.each do |point|
              @point2 = point
              #distance1 = determine_distance(@point1,@point2)
              #@expected_letterlist_forword[0][:nearby_point] = @point2
              #@expected_letterlist_forword[0][:distance_from_currentpoint_to_nextletterpoint] = distance1
            end #do point
          #p @potential_hash
        end #((@points_per_lindex.count == 1) && (@lindex == 0))


    elsif ((@points_per_lindex.count > 1) && (@lindex == 0))
      p "2"
      @points_per_lindex.each do |point|
          @point1 = point
      end #do point
      if (@nextpoints_per_lindex.count == 1)
        @point2 = @nextpoints_per_lindex.flatten
      else (@nextpoints_per_lindex.count > 1)
        @nextpoints_per_lindex.each do |point|
            @point2 = point
          end #do point
      end # ((@points_per_lindex.count > 1) && (@lindex == 0))


    elsif ((@points_per_lindex.count == 1) && (@lindex != 0))
      p "3"
      @point1 = @points_per_lindex.flatten
      if (@nextpoints_per_lindex.count == 0)
        nil
      elsif (@nextpoints_per_lindex.count == 1)
          @point2 = @nextpoints_per_lindex.flatten
          #p @point2
          distance3 = determine_distance(@point1,@point2)
          @expected_letterlist_forword[0][:nearby_point] = @point2
          @expected_letterlist_forword[0][:distance_from_currentpoint_to_nextletterpoint] = distance3
      else (@nextpoints_per_lindex.count > 1)
          @nextpoints_per_lindex.each do |point|
              @point2 = point
              #p @point2
              distance3 = determine_distance(@point1,@point2)
              @expected_letterlist_forword[0][:nearby_point] = @point2
              @expected_letterlist_forword[0][:distance_from_currentpoint_to_nextletterpoint] = distance3
          end #do point
      end #((@points_per_lindex.count == 1) && (@lindex != 0))


    else ((@points_per_lindex.count > 1) && (@lindex != 0))
      p "4"
      @points_per_lindex.each do |point|
          p "!!!!"
          @point1 = point
          if (@nextpoints_per_lindex.count == 1)
            @point2 = @nextpoints_per_lindex.flatten
            distance4 = determine_distance(@point1,@point2)
            p "AAAAA"
            p  @point1, @point2
            #@expected_letterlist_forword[0][:nearby_point] = @point2
            #@expected_letterlist_forword[0][:distance_from_currentpoint_to_nextletterpoint] = distance4
          else (@nextpoints_per_lindex.count > 1)
            @nextpoints_per_lindex.each do |point|
                @point2 = point
                p "BBBB"
                p @point1, @point2
                distance4 = determine_distance(@point1,@point2)
                #@expected_letterlist_forword[0][:nearby_point] = @point2
                #@expected_letterlist_forword[0][:distance_from_currentpoint_to_nextletterpoint] = distance4
              end #do point
          end # ((@points_per_lindex.count > 1) && (@lindex != 0))
        end #do point
    end # if loop
  end #compare_distances


  def create_expected_letterlist_forword()
    add_lurd_to_mapped_letters()
    nextletter_inwords()
    word_list = @@word_list
    word_list.each_with_index do |word,windex|
        @limit = word.length
        @pointsarray_forword = []
        @potential_hash = Hash.new
        @expected_letterlist_forword = []
        @actual_letterlist_forword = word.chars
        p word
        currentword_letterlist = @@nextletter_list.find_all{|row| (row[:word_index] == windex) && (row[:word] == word) }
        word.each_char.with_index do |letter,lindex|
          @lindex = lindex
          @letter_list = currentword_letterlist.find_all{|row| row[:letter] == letter }
          @current_letter = @letter_list[0][:letter]
          @next_letter = @letter_list[0][:next_letter]
          @letter_limit_for_word = @actual_letterlist_forword.count
          currentletter_points = create_pointslist(@current_letter) #gives all points per letter bc loop
          point_per_letter_found = currentletter_points.map{|key| key[:point]}
          p point_per_letter_found
          point_per_letter_found.each do |point|
            very_cleaned_nearbypoints = clean_nearbypointslist(point)
            @point1 = point
            ##for first letter
            array_limit = @letter_limit_for_word-1
            if (@lindex == array_limit)
              p "this is last letter"
            elsif (@lindex == 0 )
              @first_letter = @current_letter
              clean_nearbypointslist(point)
              very_cleaned_nearbypoints.each do |potential_point2|
                letters_at_point =  letters_atpoint(potential_point2)
                point2_list = letters_at_point.select {|row| row[:letter] == @next_letter}
                point2_list.each do |point2|
                  @point2 = point2[:point]
                  distance0 = determine_distance(@point1,@point2)
                  @potential_hash = {:potential_letter=> @first_letter, :potential_point=>@point1, :lindex=>lindex,:next_letter=>@next_letter, :nearby_potential_point=>@point2, :potential_point_distance=>distance0}
                  @expected_letterlist_forword << @potential_hash
                  end # do point2
                end #do potential_point2 again
            else (@lindex != 0 ) # @letter_limit_for_word I will want to change this to be more meaningful
              @current_letter = @current_letter
              very_cleaned_nearbypoints.each do |potential_point2|
                letter_at_point2 = letters_atpoint(potential_point2)
                point2_list = letter_at_point2.select {|row| row[:letter] == @next_letter}
                point2_list.each do |point2|
                  @point2 = point2[:point]
                  distance1 = determine_distance(@point1,@point2)
                  @potential_hash = {:potential_letter=> @current_letter, :potential_point=>@point1, :lindex=>lindex, :next_letter=>@next_letter,:nearby_potential_point=>@point2, :potential_point_distance=>distance1}
                  @expected_letterlist_forword << @potential_hash
                  end # do point2
                end #do potential_point2 again
              #@expected_letterlist_forword = @expected_letterlist_forword.uniq

            end #if
          end #point per letter found
          lindex += 1
      end #do lindex
       #p @expected_letterlist_forword
      windex += 1
    end
    return @expected_letterlist_forword
  end #end of create_expected_letterlist_forword

# your lindex is wrong

  def search
    nextletter_inwords()
    create_expected_letterlist_forword()
    #p @expected_letterlist_forword
    @by_lindex =  @expected_letterlist_forword.group_by{|key| key[:lindex]}
    points_by_lindex = @by_lindex.select{|key| key==@lindex}
    next_points_by_lindex = @by_lindex.select{|key| key==(@lindex+1)}
    @points_per_lindex = points_by_lindex.values.flatten.map{|key| key[:potential_point]}
    @nextpoints_per_lindex = next_points_by_lindex.values.flatten.map{|key| key[:potential_point]}
    p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    #sorted_potential_array = unique_points_array.sort_by{|k|k[0]}
  end #search

  def print_output
    windex = 0
    @@word_list.each_with_index do |word,windex|
      p "#{word}: "
    end # word list do
  end

  #test_files/test2.txt

end #Puzzle_Solver class

test = Puzzle_Solver.new
test.nearby_letters
test.create_expected_letterlist_forword()
#test.search()


=begin
lindex_list = @by_lindex.keys
lindex_list.each do |indices_per_letter|
  #p indices_per_letter #amount of indices per letter
  @by_lindex.each do |point|
    # you want to list the points where point = lindex, and check the points for lindex after that
    end #do point
end # do indicer per letter


ARE THE SAME
p @letter_limit_for_word
p @limit


=end
