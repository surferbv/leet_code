=begin

    title:
        62. Unique Paths (medium)

    links:
        https://leetcode.com/problems/unique-paths/
        https://www.youtube.com/watch?v=IlEsdxuD4lY

    approach:
        DP approach

    time: O(m * n)
        We have to start from the bottom row and move up. 

    space: O(n)
        Since we are storing  only one row of size n

    note:
        DP observation is that you need to start at the bottom row and see how many ways it is 
        to get from the start. Calculate each row starting from the bottom moving up. 

        m = 3, n = 7

        28 21 15 10 6 4 1
        7   6  5  4 3 2 1
        1   1  1  1 1 1 1

    til:
        You can start from the bottom solution to get the resulting solution. 

    results:
        Runtime 83 ms Beats 88.41% Memory 211.1 MB Beats 17.39%

=end
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
    # calculate the bottom row
    row = [1] * n
    
    # cal the rows from the bottom up we already have first row so m - 1 and -1 because for the range.
    for i in (0..m - 2)
        new_row = [1] * n
        
        # cal the new row values using the previous row
        for j in (n - 2).downto(0)
            new_row[j] = new_row[j + 1] + row[j]
        end
        row = new_row
    end

    return row[0]    
end