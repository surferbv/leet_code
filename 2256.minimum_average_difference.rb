# 2256. Minimum Average Difference (medium) (freq: low)
# https://leetcode.com/problems/minimum-average-difference/description/
# @param {Integer[]} nums
# @return {Integer}
=begin

    prefix sum approach (NOT WORKING)

    time:

    space:

    note:
        Did not come up with this solution. 
        fails on test case [5,4,3,2,1]

=end
def minimum_average_difference(nums)
    n = nums.length - 1
    ans = -1 
    min_avg_diff = Float::INFINITY
    
    prefix_sum = [0] * (n + 1)
    suffix_sum = [0] * (n + 1)
 
    for i in (0..n) do
     prefix_sum[i + 1] = prefix_sum[i] + nums[i]
    end
 
    (n-1).step(0, -1) do |i|
     suffix_sum[i] = suffix_sum[i + 1] + nums[i]
    end
    
    for i in (0..n) do
     left_part_average = prefix_sum[i + 1]
     left_part_average /= (i + 1)
     
     suffix_sum[i + 1] ? right_part_average = suffix_sum[i + 1] : right_part_average = 0
 
     if i != n - 1
         right_part_average /= (n - i - 1)
     end
 
     curr_difference = (left_part_average - right_part_average).abs
 
     if curr_difference < min_avg_diff
         min_avg_diff = curr_difference
         ans = i
     end
 
    end
 
    return ans
 end