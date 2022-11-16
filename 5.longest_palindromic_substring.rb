#5.longest_palindromic_substring.rb
# @param {String} s
# @return {String}
#
=begin

    center approach

    time: O(n^2)
        There are at most n characters and for each 
        it could take up to n times thus O(n*n) = O(n^2)

    space: O(1)

    note:
        Did not solve on my own this was hard!
        But algorithm was very easy to understand. 
        I found that setting the bounds when expanding the l
        and r pointers was not trivial. And for some reason
        I still can't understand r - l + 1. Yes, it's the length 
        or distance between the two pointers and I'm guessing the
        +1 is the -1 from the s.length - 1.

        Oh cool you could solve this using BFS?

        
=end
def longest_palindrome(s)    
    @res_length = 0
    @idx_l      = 0
    @idx_r      = 0
    
    # treat each char as the center
    for c in (0..s.length - 1) do
        
        # if length is odd 
        l, r = c, c      
        find_palindrome(l, r, s)    
        
        # if length is even, the only difference is we add one to r!
        l, r = c, c + 1 
        find_palindrome(l, r, s)  

    end

    return s[@idx_l..@idx_r]
end

def find_palindrome(l,r,s)
    while l >= 0 && r < s.length && s[l] == s[r] 
        if (r - l + 1) > @res_length
            @idx_l      = l
            @idx_r      = r
            @res_length = r - l + 1
        end

        l -= 1
        r += 1
    end 
end
