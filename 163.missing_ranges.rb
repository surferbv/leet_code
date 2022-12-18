=begin

    163. missing ranges

    links:
        https://leetcode.com/problems/missing-ranges/description/

    approach:
        linear scan approach

    time: O(n)
        Since we have to scan all the elements in the array.

    space: O(n)
        The worst case all n elements are missing from the range. 

    note:
        A lot of edge cases! 
        1. First what if the lower range is less than the nums lower
            We first subtract one by the lower bound to see if we need to include 
            any values less than nums bound. 
            e.g. (a - 1) + 1 <= b - 1 

        2. Once in the loop we then iterate using previous and current as a and b
            e.g. a + 1 <= b - 1 

        3. Lastly we need to check if the upper is over the nums bound
            We do this by adding 1 to the upper.
            a + 1 <= ( b + 1 ) - 1

        Not very clear I know but 


    til:
        Try printing it out first if you're stuck. 
    
=end
# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {String[]}
def find_missing_ranges( nums, lower, upper )
    result  = []
    prev    = lower - 1

    for i in ( 0..nums.length )
        ( i < nums.length ) ? curr = nums[ i ] :  curr = upper + 1 

        if prev + 1 <= curr - 1
            result << format_range( prev + 1, curr - 1 )
        end

        prev = curr
    end

    return result
end

def format_range( lower, upper )
    if lower == upper
        return lower.to_s
    else
        return lower.to_s + "->" + upper.to_s
    end
end



