# Question: 
# given an integer array nums... return TRUE if any values appears
# at least twice in the array, and return false if every element
# is unique.
#
# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
    seen = Hash.new(0) 

    nums.each do |n|
        if seen.key?(n)
            return true
        end
        seen[n] += 1
    end
    
   false 
end

def contains_duplicate(nums)
    seen = Set.new

    nums.each do |n|
        if seen.include?(n)
            return true
        else
            seen.add(n)
        end
    end

    false
end