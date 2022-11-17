# 26.remove_duplicates_from_sorted_array.rb
# https://leetcode.com/problems/remove-duplicates-from-sorted-array/
# https://www.youtube.com/watch?v=DEJAZBq0FDA
# @param {Integer[]} nums
# @return {Integer}
#
=begin

    two pointer approach

    time: O(n)
        Even thought we have two pointers we still go throught 
        the array n + n which is O(2n) = O(n).

    space: O(1)

    note:
        Two pointers clever way in starting l and r at 1 and only setting l when nums[r] is different. Drawing this out will help!

=end
def remove_duplicates(nums)
    l = 1                           # starting at 1 since 0 will not need to be swaped

    for r in (1..nums.length - 1) do
        if nums[r - 1] != nums[r]   # if the right finds a different number we move it to l
            nums[l] = nums[r]
            l += 1                
        end
    end
    
    return l
end


































=begin

    note:
        this was my first appraoch did not work

    Genearl Algorithm:
        Using two pointers iterate over the whole array.
        One will be called prev and curr. 
        We will go through the array first checking for duplicates 
        of on prev if current sees a duplicate 
        keep moving current forward leaving prev where it is
        if current find a value that is not a duplicates we then move prev
        up one and mark all values nil until prev reaches curr. 
        after we have done this 

        we then go through the whole array again shifting all the numbers 
        to the right filling the nil spots. 

=end
def remove_duplicates(nums)
    i = 1 # prev
        
    for j in (1..nums.length - 1) do # curr
        if nums[i] == nums[j]
            next
        else # j is at a diff number skipping the first i we mark all elemnts between i + 1 and j as nil
            nums[i] = nums[j]
            i += 1
        end
    end

    # at the end of this loop we expect to have our array with a bunch of nils in it but this is one step 
    # eg [1,1,2] => [1,nil,2]
    # eg. [0,0,1,1,1,2,2,3,3,4] => [0,nil,1,nil,nil,2,nil,3,nil,4]

    return i
end