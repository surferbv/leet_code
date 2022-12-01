# 1207. unique nmber of occurences
# https://leetcode.com/problems/unique-number-of-occurrences/description/
# @param {Integer[]} arr
# @return {Boolean}
#
=begin
    hash set and hash table approach 

    time: O(n)
        Still have to go through the whole array.

    space: O(n + n) = O(n)
        We store n values in the hash and the has set. 

    note: 
        Use a hash to store each value as a key from the array and keeping track of the number of occurances in the value of the hash. We then have to use a hash set to see if any number of occurances match. If they do we return false otherwise true.  

=end
require 'set'
def unique_occurrences(arr)
    result  = true
    seen    = Hash.new(0)
    occur   = Set.new()

    arr.each do |e|
        seen[e] += 1
    end

    seen.each do |k, v|
        if occur.include?(v)
            result = false
            break
        else
            occur << v
        end
    end

    return result 
end