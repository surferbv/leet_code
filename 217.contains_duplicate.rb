=begin
    217. Contains Duplicate (easy)

    links:
        https://leetcode.com/problems/contains-duplicate/submissions/860507325/

    approach:
        hash approach
        uniq approach

    time: O(n)

    space: O(n)

    note:
        You can use a hash or hash set to look for duplicates. 
        Another way would be to sort the array then check for duplicates. 

    til:
        Hashes, hash set, and sorting are your friends. 

=end
# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
    hash = Hash.new( 0 )
    nums.each do | n |
       if hash.key?( n ) 
         return true 
       else
         hash[ n ]  += 1 
       end
    end

    return false
end


# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
    return nums.uniq != nums
end