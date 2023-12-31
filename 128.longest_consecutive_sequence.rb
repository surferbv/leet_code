# 128. Longest Consecutive Sequence
#
# Algorithm:
# 1. convert nums into a set (this allows us to check if a number is a start of a sequence)
# 2. iterating through the array
#   1. does this start number have a consecutive number?
#     a. yes, if yes we update the longest seen sub-sequence
#     b. no, we move to the next number in the array.
# 4. return longest sub-seq count
#
# @param {Integer[]} nums
# @return {Integer}
# TLE
require 'set'
def longest_consecutive(nums)
  longest = 0
  nums_set = Set.new(nums)

  nums.each do |n|
    length = 0
    if !nums_set.include?(n - 1)
      while nums_set.include?(n + length)
        length += 1
      end
      nums_set.delete(n)
      longest = [longest, length].max
    end
  end

  longest
end

require 'set'
def longest_consecutive(nums)
  longest = 0
  nums_set = Set.new(nums)

  nums.each do |n|
    if !nums_set.include?(n - 1)
      current_num = n
      current_streak = 1

      while nums_set.include?(current_num + 1) 
        current_num += 1
        current_streak += 1
        nums_set.delete(current_num)
      end

      longest = [current_streak, longest].max
    end
  end

  longest
end

def longest_consecutive(nums)
 return 0 if nums.empty? 

 nums = nums.sort!
 longest_streak = current_streak = 1

 (1).upto(nums.length - 1).each do |i|
  if nums[i] == nums[i - 1] + 1
    current_streak += 1
  elsif nums[i] != nums[i - 1]
    current_streak = 1
  end

  longest_streak = [longest_streak, current_streak].max
 end

 longest_streak
end