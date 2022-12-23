=begin
    219. Contains Duplicate II

    links:
        https://leetcode.com/problems/contains-duplicate-ii/

    approach:
        hashset approach

    time: O(n)
        Hashset has O(n) search, delete, and insert

    space: O(min(n,k))
        We store the min of the number of elements stored in the sliding window of size k

    note:
        Still don't understand nums[i-k] removes the oldest element in the hashset.
        How does this ensure you don't get nums[i] == nums[j]? 

    til:
        See if you can use a hashset to improve the time complexiy while sacrificing space.

    results:
        Runtime 189 ms Beats 84% Memory 220.4 MB Beats 80%

=end
# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
require 'set'
def contains_nearby_duplicate(nums, k)
    set = Set.new()

    for i in (0..nums.length-1)
        # search the current element return true if found
        return true if set.include?(nums[i]) 
        
        # place the current element in the hashset
        set.add(nums[i]) 

        # if the size of the hashset is larger than k, remove the oldest element
        set.delete(nums[i - k]) if set.size > k 
            
    end
    
    return false
end



=begin
    approach:
        brute force appraoch

    time: O(n^2)

    space: O(1)

    note:
        TLE
=end
# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
    result = false

    for i in (0..nums.length-1)
        for j in (0..nums.length-1)
            if i != j
                if nums[i] == nums[j] && (i-j).abs <= k
                    result = true
                    break
                end
            end
        end
    end
    
    return result
end