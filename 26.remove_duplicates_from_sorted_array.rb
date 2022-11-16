# 26.remove_duplicates_from_sorted_array.rb
# https://leetcode.com/problems/remove-duplicates-from-sorted-array/
# https://www.youtube.com/watch?v=DEJAZBq0FDA
# @param {Integer[]} nums
# @return {Integer}
#
=begin
=end
def remove_duplicates(nums)
    
end


































=begin
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
    i = 0 # prev
        
    for j in (1..nums.length - 1) do # curr
        if nums[i] == nums[j]
            next
        else # j is at a diff number skipping the first i we mark all elemnts between i + 1 and j as nil
            i += 1
            while i < j # remember we don't want to delete the value that j is on because we haven't seen it before
                nums[i] = nil
                i += 1
            end
            # at this point i is just before j so we set i equal to j and repeat the process over
            i = j
        end
    end

    # at the end of this loop we expect to have our array with a bunch of nils in it but this is one step 
    # eg [1,1,2] => [1,nil,2]
    # eg. [0,0,1,1,1,2,2,3,3,4] => [0,nil,1,nil,nil,2,nil,3,nil,4]

    return j + 1
end