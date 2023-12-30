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
require 'set'
def longest_consecutive(nums)
  count = 0
  nums_set = Set.new(nums)

  nums.each do |n|
    cur_count = 0

    if nums_set.include?(n-1)
     
      next_n = n + 1
      while nums_set.include?(next_n)
        cur_count += 1
        next_n += 1
      end
      cur_count += 2
    else
      cur_count += 1
    end

    count = [count, cur_count].max
  end

  count
end