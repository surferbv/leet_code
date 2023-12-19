# 283. Move Zeroes
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  last_non_zero_found_at = cur = 0

  while cur < nums.length
    if nums[cur] != 0
      nums[last_non_zero_found_at], nums[cur] = nums[cur], nums[last_non_zero_found_at]
      last_non_zero_found_at += 1
    end
    cur += 1
  end
end