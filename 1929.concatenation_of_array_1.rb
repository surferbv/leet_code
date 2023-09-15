# 1929. Concatenation of Array
# @param {Integer[]} nums
# @return {Integer[]}

# time: O(n)
#       We iterate through the array once, and then we iterate through the array again
#
# space: O(n)
#        Since we double the size of the array, the space complexity is O(2n) = O(n)
#         
# note: simple approach is to just add the array to itself
def get_concatenation(nums)
    nums + nums
end

# time: O(n)
#
# space: O(n)
#
# note: Another approach is to create a new array of size 2n, and then iterate through the array.
#       The time and space complexity in theory shoud be the same as the simple approach.
#
def get_concatenation(nums)
    nums_new = Array.new(nums.length * 2)
    for i in (0...nums.length)
        nums_new[i] = nums[i]
        nums_new[i + nums.length] = nums[i]
    end
    nums_new
end