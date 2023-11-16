# 724.find_pivot_index.rb
# @param {Integer[]} nums
# @return {Integer}
#
# approach: prefix sum left and right
#
# time: O(n) = O(3n) = O(n) + O(n) + O(n)
#
# space: O(n) = O(2n) = O(n) + O(n) for the two prefix arrays  
#
# notes: 
# This was my first attempt at solving this problem. 
# I was able to solve it but I had to use two prefix arrays 
# the idea is when they overlap at i and the element at i is the pivot
# however, this is not the most optimal solution
# still nice to see I was able to come up with a solution
#
def pivot_index(nums)
    left_prefix     = []
    right_prefix    = []

    total = 0
    nums.each do |n|
        total += n
        left_prefix.append(total)
    end

    total = 0
    nums.reverse.each do |n|
        total += n
        right_prefix.unshift(total)
    end

    (0..left_prefix.length - 1).each do |i|
        if left_prefix[i] == right_prefix[i]
            return i
        end
    end

    -1
end

# @param {Integer[]} nums
# @return {Integer}
#
# approach: prefix sum and some math
#
# time: O(n) where n is the number of elements in nums to get the total
#
# space: O(1) constant space since we are not creating any new arrays to store the prefix sum
# 
# notes:
# Clever appraoch the trick is to notice that 
# total_sum = left_sum + pivot + right_sum 
# and
# right_sum = total_sum - left_sum - pivot

def pivot_index(nums)
    # find the sum of the array
    total_sum   = nums.sum

    # now keep track of the left_sum
    left_sum    = 0
    right_sum   = 0 

    # since we know that total_sum = left_sum + pivot + right_sum
    # we can find the right_sum be re-writing the equation
    # right_sum = total_sum - left_sum - pivot
    # if we find that the right_sum == left_sum we found our pivot and we return it otherwise -1
    nums.each_with_index do |pivot, i|
        right_sum = total_sum - pivot - left_sum

        return i if right_sum == left_sum

        left_sum += pivot 
    end

    -1
end
