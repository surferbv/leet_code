# 35. Search Insert Position
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
        Use binary search and run through an example that is in the array and one example the element in not in the array
    
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

    if l > r 
        return l
    else # l < r
        return r
    end
    
end
