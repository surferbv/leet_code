=begin

    119. pascals triangle II (easy)

    links:
        https://leetcode.com/problems/pascals-triangle-ii/description/

    approach:
        dynamic programming approach

    time: O(k^2)
        Where k is the row. We have to calculate all the previous rows as well
        you end up calculating ((k+1)(k+2))/2

    space: O(k)
        For storing the kth row values.

    note:
        Very hard to grasp this problem I chose this approach because it made the most
        sense. For example is we are told to calculate the 4th rowIndex we use the 
        3rd rowIndex to do it [1,3,3,1,1] but as you can see we place an additional one
        at the end and add 3+1 replacing the second one from the back so [1,3,3,4,1]
        e.g. 
        [1,3,3,1,1] 
        [1,3,3,4,1] 3+1
        [1,3,6,4,1] 3+3
        [1,4,6,4,1] 1+3

    til:
        This is similar to doing nCr

    results:
        Runtime 88 ms Beats 62.79% Memory 210.9 MB Beats 86.5%

=end
# @param {Integer} row_index
# @return {Integer[]}
def get_row(row_index)
    row = Array.new(row_index + 1, 0)
    row[row_index] = 1
    
    for i in (0..row_index-1)
        j = i
        
        for j in (j).downto(0)
            row[j] = row[j] + row[j - 1]
        end

    end
    row.unshift(row.pop)
    
    return row
end