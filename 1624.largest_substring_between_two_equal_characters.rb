# 1624. Largest Substring Between Two Equal Characters
# Easy
# Topics
# Companies
# Hint
# Given a string s, return the length of the longest substring between two equal characters, excluding the two characters. If there is no such substring return -1.

# A substring is a contiguous sequence of characters within a string.

 

# Example 1:

# Input: s = "aa"
# Output: 0
# Explanation: The optimal substring here is an empty substring between the two 'a's.
# Example 2:

# Input: s = "abca"
# Output: 2
# Explanation: The optimal substring here is "bc".
# Example 3:

# Input: s = "cbzxy"
# Output: -1
# Explanation: There are no characters that appear twice in s.
 

# Constraints:

# 1 <= s.length <= 300
# s contains only lowercase English letters.


# notes: 
# The idea is that we want to find the longest substring between two equal characters
# We can use a hash to store the index of the first occurence of the character 
# and the index of the last occurence of the character.
# If the character is not in the hash, we add it to the hash this is the first occurence of the character
# If the character is in the hash, we update the last occurence of the character this can be done by updating the value of the key in the hash 
# where the key is the character and the value is an index pair [first occurence, last occurence]
# Then we can iterate through the hash and find the longest substring between two equal characters
# We do this by taking the difference between the first and last occurence 

# @param {String} s
# @return {Integer}
def max_length_between_equal_characters(s = "abca")
  seen = {}
  result = -1

  s.each_char.with_index do |char, i|
    if !seen.key?(char)
     seen[char] = [i, i]
    else
      seen[char][1] = i
    end
  end

  seen.each do |char, indices|
    result = [result, indices[1] - indices[0] - 1].max
  end

   result
end