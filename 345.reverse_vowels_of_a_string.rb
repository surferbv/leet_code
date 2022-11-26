# 345.reverse vowels of a string
# https://leetcode.com/problems/reverse-vowels-of-a-string/
# https://www.youtube.com/watch?v=_d0T_2Lk2qA
# @param {String} s
# @return {String}
=begin

    two pointer approach

    time: O(n)
        Still have to iterate through everything.

    space: O(1)
        No additional memory allocated.

    note:
        Used a two pointer approach and stored the vowels in a fixed size array. Could have use ord to compare as well.

=end
def reverse_vowels(s)
    l = 0
    r = s.length - 1
    vowels = %w(a e i o u A E I O U)

    while l < r

        l += 1 if !vowels.include?(s[l])
        
        r -= 1 if !vowels.include?(s[r])

        if vowels.include?(s[l]) && vowels.include?(s[r])
            s[l], s[r] = s[r], s[l]
            l += 1
            r -= 1
        end

    end

    return s
end