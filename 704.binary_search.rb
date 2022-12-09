# 704. Binary Search (easy)
# https://leetcode.com/problems/binary-search/?envType=study-plan&id=binary-search-i
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
=begin

    binary search approach

    time: O(log n)
        Since we half the search space each time or how many time we can divide n by 2.


    space: O(1)
        Since we don't allocated any additional storage. 

    note:
        Binary search keep in mind that this only works if the items in the list are sorted.

=end
def search(nums, target)
    l, r = 0, nums.length - 1

    while l <= r
        mid = (l+r) / 2 # in ruby we don't have to worry about overflow but if you do l + ((r - l) / 2)
        guess = nums[mid]

        return mid if guess == target

        if guess < target
            l = mid + 1
        else
            r = mid - 1
        end
    end

    return -1
end