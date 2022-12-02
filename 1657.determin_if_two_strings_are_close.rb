# 1657. determin if two strings are close
# https://leetcode.com/problems/determine-if-two-strings-are-close/description/
# @param {String} word1
# @param {String} word2
# @return {Boolean}
=begin

    hash approach 

    time: O(n)
        We'd store as at most 26 characters for each hashmap. 

    space: O(1)
        Max size of each hashmap would be 26 characters. 

    note:
        You can use hash to ensure the two properties are upheld. Granted we could possible not sort the keys when comparing to improve the time. 

=end
def close_strings(word1, word2)
    word1_hash, word2_hash = Hash.new(0), Hash.new(0)

    word1.chars.each do |c|
        word1_hash[c] += 1
    end
    
    word2.chars.each do |c|
        word2_hash[c] += 1
    end

    return false if word1.length != word2.length
    
    return false if word1_hash.keys.sort() != word2_hash.keys.sort()

    return word1_hash.values.sort() == word2_hash.values.sort()
end