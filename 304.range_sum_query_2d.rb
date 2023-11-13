class NumMatrix

=begin
    :type matrix: Integer[][]
=end
    def initialize(matrix)
        @ROWS, @COLS = matrix.length, matrix[0].length
        @sum_matrix = Array.new(@ROWS + 1) {Array.new(@COLS + 1){0}}

        # create sum matrix 
        (0..@ROWS - 1).each do |row_idx|
            prefix = 0
            (0..@COLS - 1).each do |col_idx|
                prefix += matrix[row_idx][col_idx]
                above_val = @sum_matrix[row_idx][col_idx+1]
                @sum_matrix[row_idx+1][col_idx+1] = prefix + above_val # we add + 1 for the padding of zeros 
            end
        end
    end


=begin
    :type row1: Integer
    :type col1: Integer
    :type row2: Integer
    :type col2: Integer
    :rtype: Integer
=end
    def sum_region(row1, col1, row2, col2)
       r1, r2, c1, c2 = row1 + 1, row2 + 1, col1 + 1, col2 + 2 

       # need to go over this on paper and pencil
       bottom_right = @sum_matrix[r2][c2]
       above = @sum_matrix[r1 - 1][c2]
       left = @sum_matrix[r2][c1 - 1]
       top_left = @sum_matrix[r1 - 1][c1 - 1]

       bottom_right - above - left + top_left
    end


end

# Your NumMatrix object will be instantiated and called as such:
# obj = NumMatrix.new(matrix)
# param_1 = obj.sum_region(row1, col1, row2, col2)