=begin

    title:
        64. Minimum Path Sum (medium)

    links:
        https://leetcode.com/problems/minimum-path-sum/
        https://www.youtube.com/watch?v=pGMsrvt0fpk

    approach: 
        DP approach

    time: O(n*m)
        Since we have to iterate over the whole grid. 

    space: O(n*m)   
        Since we created a grid that stores the results.

    note:
        This can also be sloved without calculating the whole matrix by 
        using just one row. 

    til:
        I need to do more of these problems :-|

    results:
        Runtime 124 ms Beats 52% Memory 212.7 MB Beats 12%
=end
# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
    rows, cols = grid.length, grid[0].length
    result = Array.new(rows+1, Float::INFINITY){Array.new(cols+1, Float::INFINITY)}
    result[rows][cols-1] = 0

    for r in (rows - 1).downto(0) do
        for c in (cols - 1).downto(0) do
            result[r][c] = grid[r][c] + [result[r + 1][c], result[r][c + 1]].min
        end
    end
    
    result[0][0]
end