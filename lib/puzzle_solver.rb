require_relative 'puzzle.rb'
include Math

class Puzzle_Solver < Puzzle
attr_reader :nearby_letters


  puzzle = Puzzle.new
  puzzle.receive_input

  def nearby_letters()
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
        return @@puzzle_w_lurd
  end #add lurd to hash


  def nextletter_inwords()
    @@nextletter_list = Array.new()
    words_withindices = {}
    word_array = []
    @@word_list.each.with_index do |word,windex|
      limit = word.length
      word_array = word.split(//)
      word.each_char.with_index do |letter,lindex|
        next_index = 0
        next_index = (lindex + 1)
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
      add_lurd_to_mapped_letters()
      lurd_for_point = @@puzzle_w_lurd.find_all{|row| (row[:point] == point) }
      nearbypoints_array = []
      nearbypoints_array << lurd_for_point[0][:left] # search_horizontally
      nearbypoints_array << lurd_for_point[0][:right] # search_horizontally
      nearbypoints_array << lurd_for_point[0][:up] # search_vertically
      nearbypoints_array << lurd_for_point[0][:down] # search_vertically
      nearbypoints_array << lurd_for_point[0][:left_up] # diagonally_ascending
      nearbypoints_array << lurd_for_point[0][:right_up] # diagonally_ascending
      nearbypoints_array << lurd_for_point[0][:left_down] # diagonally_descending
      nearbypoints_array << lurd_for_point[0][:right_down]# diagonally_descending
      #backwords does not work here, because the word is backwards, not the points
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

  def create_potential_letterlist_forword()
    add_lurd_to_mapped_letters()
    nextletter_inwords()
    word_list = @@word_list
    @combined_expected_letterlists = []
    @by_lindex = []
    @by_distance = []
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
          currentletter_points = create_pointslist(@current_letter)
          point_per_letter_found = currentletter_points.map{|key| key[:point]}
          p point_per_letter_found
          point_per_letter_found.each do |point|
            very_cleaned_nearbypoints = clean_nearbypointslist(point)
            @point1 = point
            array_limit = @letter_limit_for_word-1
            if (@lindex == array_limit)
              @potential_hash = {:potential_letter=> @current_letter, :potential_point=>@point1, :lindex=>lindex}
              @expected_letterlist_forword << @potential_hash
            elsif (@lindex == 0 )
              @first_letter = @current_letter
              clean_nearbypointslist(point)
              very_cleaned_nearbypoints.each do |potential_point2|
                letters_at_point =  letters_atpoint(potential_point2)
                point2_list = letters_at_point.select {|row| row[:letter] == @next_letter}
                point2_list.each do |point2|
                  @point2 = point2[:point]
                  distance0 = determine_distance(@point1,@point2)
                  @potential_hash = {:potential_letter=> @first_letter, :potential_point=>@point1, :lindex=>lindex,:next_letter=>@next_letter,:next_lindex=>(lindex+1), :nearby_potential_point=>@point2, :potential_point_distance=>distance0}
                  @expected_letterlist_forword << @potential_hash
                  end # do point2
                end #do potential_point2 again
            else (@lindex != 0 ) # @letter_limit_
              @current_letter = @current_letter
              very_cleaned_nearbypoints.each do |potential_point2|
                letter_at_point2 = letters_atpoint(potential_point2)
                point2_list = letter_at_point2.select {|row| row[:letter] == @next_letter}
                point2_list.each do |point2|
                  @point2 = point2[:point]
                  distance1 = determine_distance(@point1,@point2)
                  @potential_hash = {:potential_letter=> @current_letter, :potential_point=>@point1, :lindex=>lindex, :next_letter=>@next_letter,:next_lindex=>(lindex+1),:nearby_potential_point=>@point2, :potential_point_distance=>distance1}
                  @expected_letterlist_forword << @potential_hash
                  end # do point2
                end #do potential_point2 again
              @expected_letterlist_forword = @expected_letterlist_forword.uniq
            end #if
          end #point per letter found
          lindex += 1
      end #do lindex
      @combined_expected_letterlists << [word,@expected_letterlist_forword]
      index_list =  @expected_letterlist_forword.group_by{|key| key[:lindex]}
      distance_list = @expected_letterlist_forword.group_by{|key| key[:potential_point_distance]}
      @by_distance << distance_list
      @by_lindex <<  index_list
      windex += 1
    end
    return @combined_expected_letterlists
  end #end of create_potential_letterlist_forword



  def arepoints_Consecutive(point1,point2)
    point1_lurd = @lurd.select{|k,v| k[:point] == point1}
    return point1_lurd[0].values.include?(point2)
  end

  def compare_distances_relative_to_lindex()
    nextletter_inwords()
    create_potential_letterlist_forword()
    lindex_per_word = []

    @by_lindex.each do |hash| lindex_per_word << hash.keys end
    p "***************************"
      @by_distance.each_with_index do |hash,hindex|
        @letter_count = lindex_per_word[hindex].count
        @lindex_for_word = lindex_per_word[hindex]
        @letter_count_without_last = (@letter_count-1)
        @last_lindex =  @lindex_for_word.last
        @point2_list = []
        @possible_word_arr = []
        hash.each do |arr| # arr is each word chunk
           point_count = arr[1].count;
           @point_list = []
           @letter_list = []

           # or at least a list per possibility
           if (point_count >= @letter_count_without_last)
             arr[1].each do |inner_hash|

               @lindex_for_word.each do |lindex|
                 current_lindex = arr[1].select{|row| row[:lindex] == lindex}
                if (inner_hash[:lindex] == lindex)
                   if (current_lindex.count > 1)
                     p current_lindex
                     @dist_point1 = inner_hash[:potential_point]
                     current_lindex.each do |arr|
                       @dist_point2_t = arr[:nearby_potential_point]
                       if (arepoints_Consecutive(@dist_point1,@dist_point0) == true)
                         @point_list << @dist_point1
                         @letter_list << inner_hash[:potential_letter]
                         if (arepoints_Consecutive(@dist_point1,@dist_point2_t) == true)
                           @point_list << @dist_point2_t
                           @letter_list << inner_hash[:next_letter]
                           p "(())"

                         end #if (arepoints_Consecutive(@dist_point1,@dist_point2_t) == true)

                       end #if (arepoints_Consecutive(@dist_point1,@dist_point0) == true)
                      p @point_list.uniq
                     end# do arr



                else
                   #p current_lindex
                   @dist_point0 = inner_hash[:potential_point]
                   @dist_point1 = inner_hash[:potential_point]
                   @dist_point2 = inner_hash[ :nearby_potential_point]
                   if (arepoints_Consecutive(@dist_point1,@dist_point2) == true)
                     @point_list << @dist_point1
                     @letter_list << inner_hash[:potential_letter]
                     if (inner_hash[:next_lindex] == @last_lindex)
                       @dist_point1_t = inner_hash[:potential_point]
                       #p "3"
                       #p "next letter is last"
                     end # (inner_hash[:next_lindex] == @last_lindex)
                   end # (arepoints_Consecutive(@dist_point1,@dist_point2) == true)
                   #p @point_list.uniq
                   #p @letter_list
                   @possible_word_arr << @point_list.uniq
                   end # if (current_lindex.count > 1)
                end # (inner_hash[:lindex] == lindex)
               end # each do |lindex|
             end # inner hash
           end # ((point_count >= @letter_count)
        end #do arr
      end #do hash/hindex
  end #compare_distances_relative_to_lindex



  def print_output
    @@word_list.each_with_index do |word,windex|
      p "#{word}: #{@possible_word_arr}"
    end # word list do
  end

  #test_files/test2.txt

end #Puzzle_Solver class

test = Puzzle_Solver.new
test.nearby_letters
test.compare_distances_relative_to_lindex()
