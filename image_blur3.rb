class Image
    def initialize(array)
        @array = array
    end
    def output_image
        @array.each do |row|
      puts row.join
      end
    end
     
    def find_1
      ones = []
        
      @array.each_with_index do |row_array, row_num|
        row_array.each_with_index do |cell, column_num|
          if cell == 1
            ones << [row_num, column_num]
          end
        end
      end
      ones.each do |x|
        x.join
      end
    end
    
    def blur(distance)
      
      ones = find_1
      @array.each_with_index do |row_array, row_num|
        row_array.each_with_index do |cell, column_num|
          ones.each do |row_index, column_index|
            if manhattan(column_num,row_num,column_index,row_index) <= distance
              @array[row_num][column_num] = 1 
            end
          end
        end
      end
    end
    
    def manhattan(x1,y1,x2,y2)
        (x1-x2).abs + (y1-y2).abs
    end
end




image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
])

image.output_image
puts "---"

puts "What is the blur distance?"
image.blur(gets.chomp.to_i)
image.output_image

