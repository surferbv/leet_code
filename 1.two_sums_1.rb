# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

# approach: hash table
# time: O(n)
# space: O(n)

# algorithm:
# 1. create a hash table
# 2. iterate through the array
# 3. if the hash table contains the complement, return the indices
# 4. otherwise, add the number and index to the hash table
def two_sum(nums, target)
    hash = Hash.new
    nums.each_with_index do |num, i|
        if hash[target - num]
            return [hash[target - num], i]
        else
            hash[num] = i
        end
    end
end