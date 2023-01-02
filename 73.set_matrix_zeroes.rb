=begin

    title:
        73. Set Matrix Zeroes (medium)

    links: 
        https://leetcode.com/problems/set-matrix-zeroes/
        https://www.youtube.com/watch?v=T41rL0L3Pnw

    approach:
        row and col zero approach

    time: O(n * m)
        no way around this we have to iterate over all the 
        cells in the matrix.

    space: O(1)
        since we are storing what rows and cols need to be 
        zero in the first row and col we don't allocated any
        additional space except for one cell which is the top left
        cell.

    note:
        Use the existing matrix structure to store what rows and cols 
        need to be zeroed out. This is the in-place approach with the 
        top left cell that you need to check is_row_zero.

    til:
        Using the input as storage to save space using a clever 
        approach of an row array and col array.  

    results:
        Runtime 143 ms Beats 67.86% Memory 212.2 MB Beats 69.64%

=end
# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
    rows, cols      = matrix.length-1, matrix[0].length-1
    is_rows_zero    = false

    # find the rows and cols that need to be set to zero
    for r in (0..rows) do 
        for c in (0..cols) do
            if matrix[r][c] == 0
                matrix[0][c] = 0
                if r > 0
                    matrix[r][0] = 0
                else
                    is_rows_zero = true
                end
            end
        end
    end

    # now we check for any zeros in our first row and col that we set earlier and
    # we set the whole role or col to zero
    for r in (1..rows) do
        for c in (1..cols) do
            if matrix[0][c] == 0 || matrix[r][0] == 0 
                matrix[r][c] = 0
            end
        end
    end

    # if the first cell is zero we set the whole col zero
    if matrix[0][0] == 0
        for r in (0..rows) do
            matrix[r][0] = 0
        end
    end

    # if the first row is zero we set the whole row zero 
    if is_rows_zero
        for c in (0..cols) do
            matrix[0][c] = 0
        end
    end

end

