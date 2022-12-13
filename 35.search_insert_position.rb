# 35. Search Insert Position (easy)
#
# TIL:
# You can return l to return the the index of where the number should be if it was in the array.
#
# https://leetcode.com/problems/search-insert-position/?envType=study-plan&id=binary-search-i
# https://www.youtube.com/watch?v=K-RYzDZkzCI
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
=begin

    binary search iterative approach

    time: O(log n)
        BI binary search

    space: O(1)

    note:
        Use binary search and return l by why? Why not r?
=end
def search_insert(nums, target)
    l, r = 0, nums.length - 1

    while l <= r
        mid = (l + r) / 2

        guess = nums[mid]

        return mid if guess == target

        if guess < target
            l = mid + 1
        else # guess > target
            r = mid - 1
        end
    end

    return l
end
