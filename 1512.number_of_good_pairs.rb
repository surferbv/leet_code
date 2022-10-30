# 1512.num_identical_pairs 
# @param {Integer[]} nums
# @return {Integer}
# 
# brute force
#
# time: O(n^2) we go throught each element n times 
#       and another n to find all possible good pairs.
#
# space: O(1) no data structures are created. 
def num_identical_pairs(nums)
    good_pairs = 0

    i = 0 
    j = 1
    for i in (0..nums.length - 1) do
        for j in (0..nums.length - 1) do
            good_pairs += 1 if i < j and nums[i] == nums[j]
        end
    end

    good_pairs
end

# frequency array
#
# time: O(n) Our frequency array is a fixed size of n and in 
#       finding those pairs is n also which is O(n+n) = O(2n) = O(n)
#
# space: O(n) we use a frequency array.   
def num_identical_pairs(nums)
    good_pairs  = 0
    frequency   = Array.new(101, 0)

    nums.each do |n|
        frequency[n] += 1
    end

    frequency.each do |f|
        good_pairs += (f*(f-1))/2
    end

    good_pairs
end

