# 290. Word Pattern
# https://leetcode.com/problems/word-pattern/
# https://www.youtube.com/watch?v=W_akoecmCbM
# @param {String} pattern
# @param {String} s
# @return {Boolean}
def word_pattern(pattern, s)
    hash = Hash.new(0)
    s = s.split(' ')
    
    return false if s.length != pattern.length

    pattern.chars.each_with_index do |n, i|
        if !hash.key?(n) || hash[n] == s[i]
            hash[n] = s[i]
        elsif hash[n] != s[i]
            return false
        end
    end

    return true    
end
