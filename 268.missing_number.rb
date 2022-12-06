# 268. missing number (easy)
#
# TIL:
# You can use XOR to find the missing number.
# You can take the difference of two arrays that have been summed to get the missing element.
#
# https://leetcode.com/problems/missing-number/
# https://www.youtube.com/watch?v=WnPLSRLSANE
# @param {Integer[]} nums
# @return {Integer}
=begin

    summing and subtracting approach
    
    time: O(n)
        Worst case you run the for loop n times the size of nums. 

    space: O(1)

    note:
        Clever trick sum(0..nums.length) - sum(nums)

=end
def missing_number(nums)
   result = nums.length

    for i in (0..nums.length - 1)
        result += (i - nums[i])
    end

    return result 
end

=begin

    summing and subtracting approach (built in method approach)
    
    time: O(n)
        I'm assuming sum still linear operation. 

    space: O(1)

    note:
        sum(0..nums.length) - sum(nums) using built in array methods.

=end
def missing_number(nums)
    return (0..nums.length).sum - nums.sum
end

=begin

    xor approach
    
    time: O(1)
        I'm assuming xor is a constant time operation.  

    space: O(1)

    note:
        Understand that xoring will give you the part that is missing wow!

=end
def missing_number(nums)
    return nums.reduce(:^) ^ (0..nums.length).reduce(:^) 
end