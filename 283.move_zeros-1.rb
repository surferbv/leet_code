# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  l = 0 

  (0).upto(nums.length - 1) do |r| # r will always move forward 
    if nums[r] != 0 
      nums[l], nums[r] = nums[r], nums[l]
      l += 1 # we increment 1 if l is not point at a zero otherwise we move l until we find a zero
    end
  end
    
end