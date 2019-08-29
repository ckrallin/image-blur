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
    
    def blur
      ones = find_1
      @array.each_with_index do |row_array, row_num|
        row_array.each_with_index do |cell, column_num|
          ones.each do |row_index, column_index|
            if row_index == row_num && column_index == column_num
              @array[row_num -1][column_num] = 1 unless row_num == 0 #up
              @array[row_num +1][column_num] = 1 unless row_num >= 3 #down
              @array[row_num][column_num -1] = 1 unless column_num == 0 #left
              @array[row_num][column_num +1] = 1 unless column_num >= 3 #right
            end
          end
        end
      end
    end
    
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
puts "---"

image.blur
image.output_image
