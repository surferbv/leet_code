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