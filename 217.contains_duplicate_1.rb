# 217.contains_duplicate.rb
# @param {Integer[]} nums
# @return {Boolean}
#
# brute force appraoch 
# time: O(n^2)
# space: O(1)
# note: This appraoch grabs the first element and comapres it with the rest of the array
#       then it grabs the second element and compares it with the rest of the array
#       and so on until it reaches the end or if we find a duplicate.
def contains_duplicate(nums)
    return false if nums.length == 0 

    nums.each_with_index do | n, i |
        nums.each_with_index do | m, j |
            if n == m && i != j
                return true
            end
        end
    end
    return false
end


# @param {Integer[]} nums
# @return {Boolean}
#
# hash appraoch 
# time: O(n)
# space: O(n) in the worst case we have to store all the elements in the hash
# note: This appraoch uses a hash to store the elemments and checks if the element is already in the hash
#       if it is in the hash then we return true this indicates that we have seen a duplcate.
#       The key is the element and the value is the number of times we have seen the element.
#       Yes technicaly we don't even need to store the number in the value we just need to check if the key exists or not. 
#       But I like to keep track of the number of times we have seen the element.
def contains_duplicate(nums)
    hash = Hash.new(0)

    nums.each do | n |
        if hash.key?(n)
            return true
        else
            hash[n] += 1
        end
    end

    # if we reach this point then we have not seen a duplicate
    return false
end

# set approach 
# time: O(n)
# space: O(n) 
# note: This appraoch uses a set to store the elemments and checks if the element is already in the set
require 'set'
def contains_duplicate(nums)
    set = Set.new

    nums.each do | n |
        if set.include?(n)
            return true
        else
            set.add(n)
        end
    end

    return false
end

# sort approach
# time: O(nlogn)
# space: O(1)
# note: This appraoch sorts the array and then checks if the current element is equal to the next element
def contains_duplicate(nums)
    nums.sort!

    nums.each_with_index do |n,i|
        if n == nums[i+1]
            return true
        end
    end
    return false
end

# rubist approach
# time: O(n)
# space: O(1) hmm questionable based on how uniq? is implemented
# note: This appraoch uses the uniq? method to check if the array is uniq or not
def contains_duplicate(nums)
    return nums.uniq != nums
end
