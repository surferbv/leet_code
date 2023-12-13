# 283. Move Zeroes
# Solved
# Easy
# Topics
# Companies
# Hint
# Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

# Note that you must do this in-place without making a copy of the array.

 

# Example 1:

# Input: nums = [0,1,0,3,12]
# Output: [1,3,12,0,0]
# Example 2:

# Input: nums = [0]
# Output: [0]
 

# Constraints:

# 1 <= nums.length <= 104
# -231 <= nums[i] <= 231 - 1
 

# Follow up: Could you minimize the total number of operations done?
#
# time: O(n) as we still need to iterate through all the numbers for each pass
# space: O(n) since we create a new array to store our numbers that are not zeros
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)

  nums_array  = []

  # now have all nums that are not zero
  nums.each do |n|
    nums_array.push(n) if n != 0
  end

  # now we go throught our nums_array inserting all numbers that are not zero  
  i = 0
  while i < nums_array.length
    nums[i] = nums_array[i]
    i += 1
  end

  # now we put the number of zeros we found earlier into the result nums
  # we don't even need the count as i will be left at the index just before the first zero
  while i < nums.length
    nums[i] = 0
    i += 1
  end
end

# appraoch: two pointers
# time: O(n)
# space: O(1)
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  l, r = 0, 0 # going to use two pointers

  while r < nums.length
    # if the number is zero we ignore it 
    # if the number is non zero we swap
    if nums[r] != 0
      nums[l], nums[r] = nums[r], nums[l]
      l += 1
    end
    r += 1
  end
end