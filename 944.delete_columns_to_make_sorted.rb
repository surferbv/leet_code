=begin

    title:
        944. Delete Columns to Make Sorted (easy)

    links:
        https://leetcode.com/problems/delete-columns-to-make-sorted/

    approach:
        matrix iteration approach

    time: O(n * k)
        Where n is the number of strings in strs each of length k.

    space: O(1)
        We don't allocated any extra space besides the solution.

    note:
        We iterate over the matrix checking columns to see if the 
        the previous < next in the column if so it is not
        in lexicographical order add to count and continue to 
        checking the next column.  

    til:
        Iterating over a matrix.

    results:
        Sorry, there are not enough accepted submissions to show data 
        Runtime 696 ms Beats 100%  Memory 213.2 MB Beats 100%

=end
# @param {String[]} strs
# @return {Integer}
def min_deletion_size(strs)
    count   = 0
    cols    = strs[0].length - 1
    rows    = strs.length - 1

    for c in (0..cols) do
        for r in (1..rows) do
            if strs[r][c] < strs[r-1][c]
                count += 1
                break
            end
        end
    end

    return count
end