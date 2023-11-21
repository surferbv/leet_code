# 53. Maximum Subarray
# Solved
# Medium
# Topics
# Companies
# Given an integer array nums, find the 
# subarray
#  with the largest sum, and return its sum.

 

# Example 1:

# Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
# Output: 6
# Explanation: The subarray [4,-1,2,1] has the largest sum 6.
# Example 2:

# Input: nums = [1]
# Output: 1
# Explanation: The subarray [1] has the largest sum 1.
# Example 3:

# Input: nums = [5,4,-1,7,8]
# Output: 23
# Explanation: The subarray [5,4,-1,7,8] has the largest sum 23.
 

# Constraints:

# 1 <= nums.length <= 105
# -104 <= nums[i] <= 104

# Follow up: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

####################################################################################################################### 
# approach: dynamic programming
# time: O(n)
# space: O(1)
# notes:
# alsmost sloved this one, but I forgot to reset cur_sum to 0 if cur_sum < 0 this is as if 
# the left pointer removes the left most element from the subarray for negative values
# technique:
# 1. keep track of the max_sum and cur_sum
# 2. if cur_sum < 0, reset cur_sum to 0
# 53. Maximum Subarray
# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums = [-2,1,-3,4,-1,2,1,-5,4])
    max_sum = nums[0]
    cur_sum = 0
    nums.each do |n|
        cur_sum = 0 if cur_sum < 0
        cur_sum += n
        max_sum = [max_sum, cur_sum].max

    end

    max_sum    
end