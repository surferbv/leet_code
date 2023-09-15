# 26.remove_duplicates_from_sorted_array.rb
# 
# time: O(n)
#       Even thought we have two pointers it still going to be n + n which is 2n which is O(n)
# 
# space: O(1)
#        Since we don't allocate any addional space
#
# note: l hold the number of duplicates so we can just return l this appraoch is called the 
#       two pointer or fast and slow appraoch approach where one pointer moves ahead of the other pointer.  
def remove_duplicates(nums)
    l = 1
    for r in (1..nums.length - 1) do 
        if nums[r - 1] != nums[r]
            nums[l] = nums[r]
            l += 1 
        end
    end
    l
end

# 26.remove_duplicates_from_sorted_array.rb second time
# 
# note: same appraoch as above but we are using k instead of l and returning early if nums is empty
def remove_duplicates(nums)
    return 0 if nums.empty?

    k = 1
    current_element = nums[0]

    for i in (1..nums.length - 1) do
        if nums[i] != current_element
            nums[k] = nums[i]
            current_element = nums[i]
            k += 1
        end
    end
    k
end