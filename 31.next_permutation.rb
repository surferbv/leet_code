# 31.next_permutation.rb
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
#
=begin

    two pointer single pass approach

    time: O(n)

    space: O(1)
    
    note:
        This was is HARD!
        1. find the first decreasing element
            [1,5,8,4,7,6,5,3,1]
            4 <= 7

        2. find the number just larger than 4 and swap them
            [1,5,8,5,7,6,4,3,1]
            5 or a[j]
            4 or a[i - 1]

        3. then reverse all elements to the right of 5
            [1,5,8,5,1,3,4,6,7]
    
=end
def next_permutation(nums)
    i = nums.length - 2
    while i >= 0 && nums[i + 1] <= nums[i]
        i -= 1
    end

    if i >= 0
        j = nums.length - 1
        while nums[j] <= nums[i]
            j -= 1
        end

        swap(nums, i, j)
    end

    reverse(nums, i + 1)
end

def reverse(nums, start)
    i = start
    j = nums.length - 1

    while i < j 
        swap(nums, i, j)
        i += 1
        j -= 1

    end
end

def swap(nums, i, j)
    nums[i], nums[j] = nums[j], nums[i]
end