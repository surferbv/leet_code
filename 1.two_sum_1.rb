# attempt: 4
# approach: brute force
# time: O(n^2)
# space: O(1)
# notes: 
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    nums.each_with_index do | number, i |
        j = i + 1
        while j < nums.length
            return [i,j] if number + nums[j] == target
            j += 1
        end
    end
end


# attempt: 4
# approach: hash map
# time: 
# space:
# notes:
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    hash = {} #seen 

    nums.each_with_index do |n, i|
        dif = target - n
        return [hash[dif], i] if hash.key?(dif)
        hash[n] = i
    end
end