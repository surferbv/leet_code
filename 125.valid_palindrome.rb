# 125. valid palindrome
# https://leetcode.com/problems/valid-palindrome/
# https://www.youtube.com/watch?v=jJXJ16kPFWg
# @param {String} s
# @return {Boolean}
#
=begin

    two pointer approach

    time: O(n)
        We only iterate throught the linked list once
        since l and r meet at the middle.

    space: O(1)

    note:
        Two pointer approach starting from the left and the right and moving toward the center incrementing l and r 

=end
def is_palindrome(s)
    l = 0 
    r = s.length - 1

    while l < r 

        while l < r && !alpha_num(s[l]) 
            l += 1
        end

        while l < r && !alpha_num(s[r]) 
            r -= 1
        end

        return false if s[l].downcase != s[r].downcase

        l += 1
        r -= 1
    end

    return true
end

def alpha_num(c)
    return  c.ord.between?('A'.ord, 'Z'.ord) || \
            c.ord.between?('a'.ord, 'z'.ord) || \
            c.ord.between?('0'.ord, '9'.ord) 
end
 



def is_palindrome(s)
    l = 0 
    r = s.length - 1

    s = s.gsub(/[^0-9a-z]/i, '')
    s.downcase!
    s = s.split('')

    while l < r
        return false if s[l] != s[r]    
        l += 1
        r -= 1
    end

    return true
end