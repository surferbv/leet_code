# 1929.concatenation_of_array.rb
# https://leetcode.com/problems/concatenation-of-array/description/
# @param {Integer[]} nums
# @return {Integer[]}
=begin

   rubyish approach 

    time: O(n)

    space: O(n)
        
=end

def get_concatenation(nums)
    return nums + nums
end


=begin

    discrete array allocation approach 

    time: O(n)
        Where n is the nums size * 2 

    space: O(n)
        We allocate a new array of size n
        double that of nums.
        
=end
def get_concatenation(nums)
    ans = Array.new(2 * nums.length)

    for i in (0..ans.length - 1) do
        ans[i] = nums[i % nums.length]
    end

    return ans
end