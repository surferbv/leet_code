# 27.remove_element.rb
# https://leetcode.com/problems/remove-element/
# https://www.youtube.com/watch?v=Pcd1ii9P9ZI
# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
#
#
=begin

    time: O(n)

    space: O(1)

    note:
        Keep feeling as thought I need to swap values when nums[i] == val NO!
=end
def remove_element(nums, val)
    j = 0

    for i in (0..nums.length - 1) do
        if nums[i] != val
            nums[j] = nums[i]
            j += 1
        end
    end

    return j
end


=begin

    note:
        Does not work
=end
def remove_element(nums, val)
    i = 0
    j = 0

    for j in (0..nums.length - 1) do
         if nums[j] == val
            k = j 
            i = j + 1

            while i < nums.length
                nums[k] = nums[i]
                i += 1
                k += 1 
            end
         end
    end

    return j - 1
end