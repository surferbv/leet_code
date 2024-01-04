# 2870. Minimum Number of Operations to Make Array Empty
# @param {Integer[]} nums
# @return {Integer}
def min_operations(nums)
  counter = nums.tally
  ans = 0

  counter.values.each do |c|
    return -1 if c == 1
    ans += (c/3.0).ceil
  end

  ans 
end