# 125. valid palindrome
# https://leetcode.com/problems/valid-palindrome/
# https://www.youtube.com/watch?v=jJXJ16kPFWg
# @param {String} s
# @return {Boolean}

def is_palindrome(s)
    l = 0 
    r = s.length - 1
    s = s.split("")
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
    return  ('A'.ord <= c.ord <= 'Z'.ord || 'a'.ord <= c.ord <= 'z'.ord || '0'.ord <= c.ord <= '9'.ord) 
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