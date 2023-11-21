# 125. Valid Palindrome
# Solved
# Easy
# Topics
# Companies
# A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

# Given a string s, return true if it is a palindrome, or false otherwise.

 

# Example 1:

# Input: s = "A man, a plan, a canal: Panama"
# Output: true
# Explanation: "amanaplanacanalpanama" is a palindrome.
# Example 2:

# Input: s = "race a car"
# Output: false
# Explanation: "raceacar" is not a palindrome.
# Example 3:

# Input: s = " "
# Output: true
# Explanation: s is an empty string "" after removing non-alphanumeric characters.
# Since an empty string reads the same forward and backward, it is a palindrome.
 

# Constraints:

# 1 <= s.length <= 2 * 105
# s consists only of printable ASCII characters.

####################################################################################
# approach: two pointers
#
# time: O(n)
#
# space: O(1)
#
# notes: 
# tricky most of the work was in parsing the string and forgetting to downcase the string and forgetting to decrement r
#
# technique:
# idea is the first parse the string by removing all non-alphanumeric characters and downcase the string
# then we can use two pointers to check if the string is a palindrome
# by setting one pointer at the beginning of the string and the other at the end of the string
# if they ever don't match then we return false
# otherwise we return true
#
# 125. Valid Palindrome
# @param {String} s
# @return {Boolean}
def is_palindrome(s = "a man, a plan, a canal: panama")
    s = s.downcase.delete('^a-z0-9')
    l = 0
    r = s.length - 1

    while l <= r
        return false if s[l] != s[r]
        l += 1
        r -= 1
    end

    true
end
