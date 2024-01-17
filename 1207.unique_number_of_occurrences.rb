# 1207. Unique Number of Occurrences
# @param {Integer[]} arr
# @return {Boolean}
# Example 1:
#
# Input: arr = [1,2,2,1,1,3]
# Output: true
# Explanation: The value 1 has 3 occurrences, 2 has 2 and 3 has 1. No two values have the same number of occurrences.
#
# Algorithm:
# go through the array and count the number of occurrences for each element 
# we do this by iterating through the array and then storing the freq in a hash
# then we check if the hash has any duplicate values
# if it does we return false otherwise we return true
def unique_occurrences(arr)

  freq = Hash.new(0)

  arr.each do |n|
    if freq.key?(n)
      freq[n] += 1
    else
      freq[n] = 1
    end
  end

  return false if freq.values.length != freq.values.uniq.length
  true
end