# 349. intersection of two arrays
# https://leetcode.com/problems/intersection-of-two-arrays/description/
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
=begin

    ruby intersection

    time: O(n + m)

    space: O(n + m)

    note:
        Same reasoning as below. 

=end
def intersection(nums1, nums2)
    return nums1.intersection.nums2
end

def intersection(nums1, nums2)
   (nums1 & nums2).uniq
end

=begin

    two sets

    time: O(n + m)
        O(n) to convert array of size n into a set.
        O(m) to convert array of size m into a set.

    space: O(n + m)
        If all elements are different.

    note:
        Use two hash sets or built in intersection. 

=end
require 'set'
def intersection(nums1, nums2)
    result  = []
    nums1   = nums1.to_set()
    nums2   = nums2.to_set()
    
    if nums2.length < nums1.length
        nums2.each do |n|
            result << n if nums1.include?(n)
        end
    else
        nums1.each do |n|
            result << n if nums2.include?(n)
        end
    end

    return result
end 