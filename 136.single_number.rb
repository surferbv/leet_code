# 136.single_number.rb
# @param {Integer[]} nums
# @return {Integer}
#
=begin
    trival solution

    time: O(n) we have to iterate through all the values in nums.

    space: O(n) in the worst case we store all values in n in the set.
=end
require 'set'
def single_number(nums)
    set = Set.new()
    
    nums.each do |n|
        if set.include?(n)
            set.delete(n)
        else
            set.add(n)
        end
    end
    
    return set.first
end


=begin
    xor bit manipulation

    time: O(n) we have to iterate through all the values in nums.

    space: O(1) no additional memory allocated. 
=end
def single_number(nums)
    result = 0
    
    nums.each do |n|
        result ^= n 
    end
    
    return result
end


def single_number(nums)
    return nums.reduce(&:^)
end