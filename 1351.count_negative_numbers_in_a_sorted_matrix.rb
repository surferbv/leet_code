=begin

    title:
        1351. Count Negative Numbers in a Sorted Matrix

    links:
        https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/

    approach: 
        matrix iteration

    time: O(n*m)
        In the worst case we'd have all the values in the matrix negative.
        In the best case we only have to check the last row and col. 

    space: O(1)
        Other than storing the count we don't have any other memory allocation. 
        But then why is it so inefficient? hmm...

    note: 
        You can also do this using binary search on each row. 

    til: 
        Binary search on a matrix? 

    results: 
        Runtime 109 ms Beats 72.73% Memory 213 MB Beats 18.18%

=end
# @param {Integer[][]} grid
# @return {Integer}
def count_negatives(grid)
    neg_count   = 0
    rowsi       = grid.length - 1 
    colsi       = grid[0].length - 1

    for r in (rowsi).downto(0) do
        for c in (colsi).downto(0) do
            if grid[r][c] < 0
                neg_count += 1
            else
                break
            end
        end
    end
    
    return neg_count
end