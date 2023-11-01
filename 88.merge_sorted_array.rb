# approach: two pointers
# time: O(m + n) where m is the length of nums1 and n is the length of nums2
# space: O(1) we are not using any extra space
# notes:
#       The take away here is to 
#       1. start from the end of the array and work your way backwards
#       2. use two pointers to keep track of the last element in each array
#       3. use a third pointer to keep track of the last index of the merged array
#       4. special case to fill nums1 with any nums left over in nums2
#
# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
    # last index num1
    last = nums1.length - 1     # since we are told that nums1.length = m + n
    p1 = m - 1                  # this is our pointer to the last element in nums1
    p2 = n - 1                  # this is our pointer to the last element in nums2

    # merge in reverse order
    while p1 >= 0 && p2 >= 0
        if nums1[p1] > nums2[p2]
            nums1[last] = nums1[p1] 
            p1 -= 1
        else
            nums1[last] = nums2[p2]
            p2 -= 1
        end
        last -= 1
    end

    # fill nums1 with the leftover nums2 elements
    while p2 >= 0
        nums1[last] = nums2[p2]
        p2 -= 1
        last -= 1
    end
end