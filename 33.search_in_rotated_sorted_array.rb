# 33.search_in_rotated_sorted_array.rb
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
=begin

    reverse binary search approach

    time: O(log n)
        Due to binary search

    space: O(1)
    
    note:
        Need to redo this problem 

=end
def search(nums, target)
    l = 0
    r = nums.length - 1
   
    while l <= r
        mid = r + l / 2 

        return mid if target == nums[mid]
            
        # left sorted part
        if nums[l] <= nums[mid]
            if target > nums[mid] || target < nums[l]
                l = mid + 1
            else
                r = mid - 1
            end
        # right sorted part
        else
            if target < nums[mid] || target > nums[r]
                r = mid - 1
            else
                l = mid + 1
            end
        end
    end

    return -1
end
