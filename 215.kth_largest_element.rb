# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
# approach: sort the array and return the kth largest element
# time: O(nlogn)
# space: O(1) assuming the sorting is done in place
def find_kth_largest(nums, k)
  nums.sort! # O(nlogn)
  nums[nums.length - k] 
end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
# approach: sort and reverse
# time: O(nlogn)
# space: O(1) assuming the sorting and reversing is done in place 
def find_kth_largest(nums, k)
  nums.sort_by!{|num| num}.reverse!
  print nums
  nums[k - 1] 
end