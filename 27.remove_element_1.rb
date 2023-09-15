# 27.remove_element.rb

# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
# 
# time: O(n)
#       Althought we have two pointers they are only going to traverse the array once
#       in this case the operation is addative n + n = 2n => O(2n) => O(n)
#
# space: O(1)
#        Since we don't allocate any addional space
#
# note: This is the two pointer or fast and slow appraoch approach where one pointer moves ahead of the other pointer.
#       l holds the number of elements that are not equal to val so we can just return l
def remove_element(nums, val)
    l = 0
    for r in (0..nums.length - 1) do
        if nums[r] != val
            nums[l] = nums[r]
            l += 1
        end
    end
    l 
end