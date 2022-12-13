# 2089. Find Target Indices After Sorting Array
# https://leetcode.com/problems/find-target-indices-after-sorting-array/
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
=begin

    iterative approach 

    time: O(n)

    space: O(1)

    note:
        Can you do this using BFS? I think so that would be the next approach. 
        Even with repeated values? hmmmm...

=end
def target_indices(nums, target)
    nums = nums.sort
    res  = []

    nums.each_with_index do |num, i|
        res << i if num == target
    end
    
    return res    
end