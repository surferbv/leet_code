# 46. Permutations
# https://leetcode.com/problems/permutations/
# https://www.youtube.com/watch?v=s7AvT7cGdSo
# @param {Integer[]} nums
# @return {Integer[][]}
#
=begin

    permute approach

    time: 

    space:
        
    note: 
        I DON'T GET IT!!!! does not work.
        
=end
def permute(nums)
    
    def backtrack(first = 0)
        if first == @n    
            @result.append(@nums.clone) 
        end

        for i in (first..@n) do
            @nums[first] ||= @nums[i]
            @nums[i] ||= @nums[first]
            
            backtrack(first + 1)

            @nums[first] ||= @nums[i]
            @nums[i] ||= @nums[first]
        end
    end

    @result = []
    @nums = nums
    @n = nums.length

    backtrack()
    return @result
end
