# @param {Integer[]} nums
# @return {Integer[]}
#
# iterative approach 
# time: O(n) we have to iterate over all n elements in nums
# space: O(n) we create a new array running_sum that is n in size
#
# can we do this in O(1) space?
def running_sum(nums)
    prev_sum    = 0
    running_sum = []

    nums.each do |n|
        current_sum = n + prev_sum
        running_sum.push(current_sum)
        prev_sum = current_sum
    end

    return running_sum
end

# @param {Integer[]} nums
# @return {Integer[]}
#
# iterative approach in place
# time: O(n) still again we have to iterate over all the elements in the array.
# space: O(1) we don't allocated a new array since all changes are done in place. 
# Could have done this with each_with_index as well.                                           
def running_sum(nums)                       
    prev_sum = 0                            
    
    for i in (0..nums.length - 1) do        
        current_sum = nums[i] + prev_sum
        nums[i] = current_sum
        prev_sum = current_sum
    end

    return nums                             
end

# @param {Integer[]} nums
# @return {Integer[]}
#
# iterative approach in place and no pre_sum variable
# time: O(n) still again we have to iterate over all the elements in the array.
# space: O(1) we don't allocated a new array since all changes are done in place.                                          
def running_sum(nums)   

    for i in (1..nums.length - 1) do        
        nums[i] += nums[i - 1]
    end

    return nums                             
end