# 1704.determine_if_string_havles_are_alike.rb
# https://leetcode.com/problems/determine-if-string-halves-are-alike/
# @param {String} s
# @return {Boolean}
#
=begin

    count each half approach

    time: O(n)
        Where n is the number of characters in s.

    space:O(1)
    
    note:
        We can keep track of the count and then compare the two halves. 

=end
def halves_are_alike(s)
    half = s.length / 2
    
    return count_vowels(s, 0, (half - 1)) == count_vowels(s, half, s.length - 1)    
end

def count_vowels(s, first, last)
    count = 0
    for i in (first..last) 
        count += 1 if 'aeiouAEIOU'.include?(s[i])
    end

    return count
end