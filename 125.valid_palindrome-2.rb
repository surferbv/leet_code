# @param {String} s
# @return {Boolean}
def is_palindrome(s)
    l, r = 0, s.length - 1

    while l < r
        while l < r && !alpha_numeric(s[l])
            l += 1
        end

        while l < r && !alpha_numeric(s[r])
            r -= 1
        end

        # at this point we should have two chars
        # problem here is case for now use downcase
        return false if s[l].downcase.ord != s[r].downcase.ord

        l += 1
        r -= 1
    end

    true
end

def alpha_numeric(c)
    c.ord.between?('A'.ord, 'Z'.ord) || c.ord.between?('a'.ord, 'z'.ord) || c.ord.between?('0'.ord, '9'.ord)
end