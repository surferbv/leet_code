#1365.how_many_numbers_are_smaller_than_the_current_number
# @param {Integer[]} nums
# @return {Integer[]}
#
# brute force
#
# time: O(n^2) we iterate n times over nums to check all numbers and for each
#       we have to check whether or not it is less than that current number. 
#
# space: O(1) since the max size of the result array is 500.
def smaller_numbers_than_current(nums)
    result = Array.new(nums.length, 0)
    count_less = 0
    for i in (0..nums.length-1) do
        for j in (0..nums.length-1) do
            count_less += 1 if j != i && nums[j] < nums[i]
        end
        result[i] = count_less
        count_less = 0
    end
    
    result
end

# hash approach
#
# algorithm:
# If we sort the array first we know that the number of 
# smaller number will be the ones we have seen already. For example
# [1,2,3,4,5] => [0,1,2,3,4]. It's simply the index of the number however
# the problem arises when we have the same number or  
# duplicate numbers like [1,2,2,3] => [0,1,1,3]. But notice that
# we could easily solve this by remembering the values we have seen
# using a hash. The hash will store the value of the original array
# as a key and the index as the value. That way we avoid  
# counting duplicate numbers. 
# 
# Once we have our hash we then iterate over our original nums
# replacing it with the values in the hash that represent the numbers
# less than it. 
#
# note:
# I did not come up with this clever algorithm so
# thank you to programmer that did. +1  
#
# time: O(n + n log n) have to sort it so that be n log n and iterate 
#       over all the elements so n. 
#
# space: O(n) have to store at most n elements in the hash. 
def smaller_numbers_than_current(nums)
    nums_sorted = nums.sort
    seen        = {}

    nums_sorted.each_with_index do |num, i|
        if !seen.key? num
            seen[num] = i
        end
    end

    nums.each_with_index do |num, i|
        nums[i] = seen[num]
    end

end