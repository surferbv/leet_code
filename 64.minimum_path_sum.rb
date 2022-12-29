=begin

    title:
        64. Minimum Path Sum

    links:
        https://leetcode.com/problems/minimum-path-sum/
        https://www.youtube.com/watch?v=pGMsrvt0fpk

    approach:

    time:

    space:

    note:

    til:

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