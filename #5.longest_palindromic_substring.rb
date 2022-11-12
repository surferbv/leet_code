#_5.longest_palindromic_substring.rb
# @param {String} s
# @return {String}
#
=begin



=end
def longest_palindrome(s)
    @res = ''
    @res_length = 0
    
    # center
    for c in (0..s.length - 1) do
        
        # if length is odd 
        l, r = c, c      
        find_palindrome(l, r, s)    
        
        # if length is even 
        l, r = c, c + 1 # notice the only difference is that we add one to r
        find_palindrome(l, r, s)  

    end

    return @res
end

def find_palindrome(l,r,s)
    while l >= 0 && r < s.length && s[l] == s[r] # check that l and r are in bounds and they equal
        if (r - l + 1) > @res_length
            @res = s[l..r]
            @res_length = r - l + 1
        end

        l -= 1
        r += 1
    end 
end