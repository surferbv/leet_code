# 15.3sum.rb
# @param {Integer[]} nums
# @return {Integer[][]}
#
=begin
    brute force

    time: O(n^3 + n log n) = O(n^3)
        Worst case we go through i, then j, then k
        times and that would be all the values in nums
        hence n * n * n = n^3. In addition we sort the values
        and check to see that 

    space: O(1)

    note:

=end
def three_sum(nums)
    nums.sort!
    length = nums.length - 1
    result = []

    for i in (0..length) do
        for j in (i + 1..length)do
            for k in (j + 1..length) do

                target = nums[i] + nums[j] + nums[k]
                sub_result = [nums[i], nums[j], nums[k]]
                
                if target == 0 && !result.include?(sub_result)
                    result.push(sub_result)  
                end

            end
        end
    end
    
    return result
end

=begin

    two pointer approach

    time: O(n^2)
        We iterate through the whole nums to find the first value n
        and the second time we iterate again through nums to find the 
        two sums. Yes we sort the array but n^2 > n log n thus O(n^2)   

    space: O(1) or O(n) 
        Depending how ruby implements the sort method. 

    note:
        a + b + c = result 
        [a,...] then you just apply two pointer 
        approach to the part of the array that does not include a
        to find  b and c. Thanks neet code! 

=end

def three_sum(nums)
    nums.sort!
    result = []
    
    nums.each_with_index do |n, i|
        next if i > 0 && n == nums[i - 1]

        l, r = i + 1, nums.length - 1
        while l < r 
            three_sum = n + nums[l] + nums[r]

            if three_sum > 0
                r -= 1

            elsif three_sum < 0
                l += 1

            else
                result.push([n, nums[l], nums[r]])

                l += 1

                while nums[l] == nums[l - 1] && l < r
                    l += 1
                end
            end
        end      
    end
    
    return result
end