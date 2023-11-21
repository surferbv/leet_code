class NumMatrix
    attr_accessor :prefix_matrix, :matrix
    # Areas of improvement 
    # - rows an cols 
    # - cal the prefix sum as if a row

    def initialize(matrix)
        @COLS = matrix[0].length 
        @ROWS = matrix.length  
        @prefix_matrix = Array.new(@ROWS + 1) {Array.new(@COLS + 1, 0)}

        # create our prefix matrix
        (0..@ROWS - 1).each do |rowi|
            prefix = 0
            (0..@COLS - 1).each do |coli|
                prefix      += matrix[rowi][coli]
                above_value = @prefix_matrix[rowi][coli+1]
                @prefix_matrix[rowi + 1][coli + 1] = prefix + above_value # +1 to offset from the the cols of rows zeros
            end
        end
    end

    def sum_region(row1, col1, row2, col2)
        r1 = row1 + 1
        r2 = row2 + 1
        c1 = col1 + 1
        c2 = col2 + 1
        
        btm_right   = @prefix_matrix[r2][c2]
        top_right   = @prefix_matrix[r1-1][c2] # GO OVER THIS !
        btm_left    = @prefix_matrix[r2][c1-1] 
        top_left    = @prefix_matrix[r1-1][c1-1] # GO OVER THIS !

        btm_right - top_right - btm_left + top_left
    end

end
