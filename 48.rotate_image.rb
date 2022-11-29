# 48. Rotate Image
# https://leetcode.com/problems/rotate-image/
# https://www.youtube.com/watch?v=fMSJSS7eO1w
# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
=begin

    rotate outer approach 

    time: O(N)
        Where N is the number of cells in the matrix.

    space: O(1)

    note:
        Use l and r and t and b for boundaries, reversing in rotation requires only one tmp variable to. Another approach is to transpose then reverse each row.
=end
def rotate(matrix)
    left = 0
    right = matrix.length - 1
      
    while left < right
        for i in (0..((right - left) - 1))
            top     = left
            bottom  = right

            # save the top left
            top_left = matrix[top][left + i]

            # move bottom left into the top left
            matrix[top][left + i] = matrix[bottom - i][left]

            # move bottom right into the bottom left
            matrix[bottom - i][left] = matrix[bottom][right - i]

            # move top right into bottom right
            matrix[bottom][right - i] = matrix[top + i][right]

            # move tmp or top left into top right
            matrix[top + i][right] = top_left
        end

        left += 1
        right -= 1 
    end

end