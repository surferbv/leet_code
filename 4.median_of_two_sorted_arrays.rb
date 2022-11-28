# 4. Median of Two Sorted Arrays
# https://leetcode.com/problems/median-of-two-sorted-arrays/
# https://youtu.be/q6IEA26hvXc
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
#
=begin

    partition approach

    time: O(log(min(m,n)))
        Because we run binary search on the smaller array.

    space: 


    note:
        Uses Binary search with crazy partitioning conditions. If you draw it out like Neet did it's helps.        

=end
def find_median_sorted_arrays(nums1, nums2)
    a, b = nums1, nums2
    a, b = b, a if b.length < a.length
    total = a.length + b.length
    half = total / 2

    # run binary search on the smaller one
    l, r = 0, a.length - 1

    while true
        i = (l + r )/ 2 # a_mid
        j = half - i - 2 # b_mid because arrays are index zero for both a and b

        # bounds check
        # i < 0 useful when we don't know the end range in advance
        i >= 0 ? a_left = a[i] : a_left = -Float::INFINITY 
        
        # check to see that i is not greater than a length
        i + 1 < a.length ? a_right = a[i + 1] : a_right = Float::INFINITY

        j >= 0 ? b_left = b[j] : b_left = -Float::INFINITY

        j + 1 < b.length ? b_right = b[j + 1] : b_right = Float::INFINITY

        # partition is correct
        if a_left <= b_right && b_left <= a_right
            # odd check
            if total % 2 == 1
                return [a_right, b_right].min * 1.0
                break
            end

            # even check
            return ([a_left, b_left].max + [a_right, b_right].min) / 2.0
            break
        
        # partition is not correct
        elsif a_left > b_right
            r = i - 1
        else
            l = i + 1
        end
    end   
end

=begin

    merging two arrays approach

    time: O(n+m)
    
    space: O(n+m)

    note:
        Not accepted solution

=end
def find_median_sorted_arrays(nums1, nums2)
    nums = nums1 + nums2

    nums.sort! # nlogn

    l = nums.length

    if l.odd?
        mid = l / 2
        return nums[mid] * 1.0
    else
        mid_r = l / 2
        mid_l = mid_r - 1

        return ((nums[mid_r] + nums[mid_l]) / 2.0)
    end
end