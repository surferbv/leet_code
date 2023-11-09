# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    seen = {} # k is number v is the index
    nums.each_with_index do |n, i|
        diff = target - n
        if seen.key?(diff)
            return [seen[diff], i] 
        else
            seen[n] = i
        end
    end
end