=begin

    title:
        2367. Number of Arithmetic Triplets (easy)

    links:
        https://leetcode.com/problems/number-of-arithmetic-triplets/

    approach:
        One iteration approach

    time: O(n)
        Since we iterate through the nums once but
        we do search for the difference. The max size 
        of nums is 200 so set may not be needed.

    space: O(1)
        No additional memory is allocated besides holding the result

    note:
        Fancy trick to find the number by subtracting it by the 
        diff. This could be improved if we convert use a hash set
        to search for the num - diff but then we increase our space
        complexity.

    til:
        if num - diff in nums and if num + diff in nums 

    results:
        Runtime 78 ms Beats 100% Memory 211 MB Beats 57.14%

=end
# @param {Integer[]} nums
# @param {Integer} diff
# @return {Integer}
def arithmetic_triplets(nums, diff)
    count = 0
    nums.each do |num|
        count += 1 if nums.include?(num - diff) && nums.include?(num + diff)
    end
    return count
end

# @param {Integer[]} nums
# @param {Integer} diff
# @return {Integer}
require 'set'
def arithmetic_triplets(nums, diff)
    look_up = nums.to_set
    count = 0
    nums.each do |num|
        count += 1 if look_up.include?(num - diff) && look_up.include?(num + diff)
    end
    return count
end