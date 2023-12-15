# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
# 
# approach: two pointers
# time: O(n) as we still need to iterate through all the numbers for each pass
# space: O(1) since we are not creating any new data structures and only using two pointers 
# notes:
# the idea is to think about moving all the non zero values to the front of the array
# i.e. partion the the array such that all non zeros are on the left and zeros are on the right
def move_zeroes(nums)
  l = 0 

  (0).upto(nums.length - 1) do |r| # r will always move forward 
    if nums[r] != 0 
      nums[l], nums[r] = nums[r], nums[l]
      l += 1 # we increment 1 if l is not point at a zero otherwise we move l until we find a zero
    end
  end
    
end