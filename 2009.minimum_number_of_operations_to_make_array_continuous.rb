# @param {Integer[]} nums
# @return {Integer}

# You are given an integer array nums. In one operation, you can replace any element in nums with any integer.
# nums is considered continuous if both of the following conditions are fulfilled:
# 1. All elements in nums are unique.
# 2. The difference between the maximum element and the minimum element in nums equals nums.length - 1.

# example 1: nums = [4,2,5,3]
# output: 0
# explanation: nums is already continuous.

# example 2: nums = [1,2,3,5,6]
# output: 1
# explanation: One possible solution is to change the last element to 4. 
# The resulting array is [1,2,3,5,4], which is continuous.

# example 3: nums = [1,10,100,1000]
# output: 3
# explanation: One possible solution is to:
# 1. Change the second element to 2.
# 2. Change the third element to 3.
# 3. Change the fourth element to 4.
# The resulting array is [1,2,3,4], which is continuous.

# appraoch: sort the array, then check if the array is continuous
# Time complexity: O(nlogn)
# Space complexity: O(1)
def min_operations(nums)
    # sort the array
    nums.sort!

    # create an array of repeats nums up to each index
    repeats = [0]
    seen = Set[]
    nums.each do |num|
        repeats << repeats[-1] + (seen.include?(num) ? 1 : 0)
        seen << num
    end

    # find the length of nums and initialize the min to be the length of nums
    len = nums.length
    min = len 

    # iterate throught nums. For each number:
    # - find the index of the first number that 
    #    would be outside of a continuous array 
    #    starting at num.
    # - subtract the difference of the indicies from
    #    the lenght; this is how many numbers need to
    #    be changed. Add the numbers of the repeats
    #    elements between the indicids; we have to change 
    #    those numbers as well.
    # - compare the min to the number of changes needed.
    nums.each_with_index do |num, i|
        idx = nums.bsearch_index { |x| x > num + len - 1 } || len
        nums_to_change = len - idx + i + repeats[idx] - repeats[i]
        min = [min, nums_to_change].min
    end

    # return the min
    min
end