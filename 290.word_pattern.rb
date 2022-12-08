# 290. Word Pattern (easy)
# https://leetcode.com/problems/word-pattern/
# https://www.youtube.com/watch?v=W_akoecmCbM
# @param {String} pattern
# @param {String} s
# @return {Boolean}
=begin

    two hash approach

    time: O(n)
        We need to iterate over both pattern and the string of size n once converting the 
        string into a string array. 

    space: O(n)
        What if each pattern has a unique words in s. Remember that pattern can have at most 26 characters.  

    note:
        Need to create two hashes for this approach. Remember it's bijective onto and one-to-one. 

=end
def word_pattern(pattern, s)
    word_to_char = {}
    char_to_word = {}
    s = s.split(' ')
    
    return false if s.length != pattern.length

    pattern.chars.zip(s).each do |c, w|
        return false if char_to_word.key?(c) && char_to_word[c] != w 
        return false if word_to_char.key?(w) && word_to_char[w] != c 
        word_to_char[w] = c
        char_to_word[c] = w
    end
    
    return true    
end
