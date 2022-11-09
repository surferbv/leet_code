# 118.pascals_triangle.rb
# https://leetcode.com/problems/pascals-triangle/
# @param {Integer} num_rows
# @return {Integer[][]}
#
=begin
    Algorithm:
    Use two pointers l and r 
    Pad the rows with zeros at the begging of the end of the last row
    [1] => [0,1,0]  
    Using the previous row iterate with two pointers over that array to
    generate an new one. 
    
    time: O(n^2) for every row n we iterate over n elements. 

    space: O(1) the I/O generally don't count towards the space complexity. 
=end
def generate(num_rows)
    result = [[1]]

    (num_rows - 1).times do # -1 since we already have to first row
        temp = [0] + result[-1] + [0]
        new_row = []
        
        for j in (0..result[-1].length + 1) do # +1 the length of the previous row 
            new_row.push( temp[j] + temp[j + 1] ) if temp[j] && temp[j + 1]
        end

        result.push(new_row)
    end 

    return result
end



=begin
    Algorithm:
    If nums rows is 1 return [1]
    If nums rows is 2 return [1,1]
    If nums rows > 2 iterate by previous row to calculate new row
        e.g. if we have [1,2,1] 
        0.  L R
              [1,2,1]       
            L is at -1 R is at 0 index. 
        1.      
=end
def generate(num_rows)
    result  = []
    
    return result.push([1]) if num_rows == 1
    return result.push([1,1]) if num_rows == 2
    
    result = [[1], [1,1]]
    l = nil
    r = 0
    num_rows -= 2

    num_rows.times do 
        new_row = []
        while result.last[r] do
            new_row.push(result.last[l.to_i] + result.last[r.to_i])
            r += 1
            l += 1
        end
        l = nil
        r = 0
        new_row.push[1]
        result.push(new_row)
    end

    return result
end