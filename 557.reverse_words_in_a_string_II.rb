# 557. reverse words in a string II (easy)
# https://leetcode.com/problems/reverse-words-in-a-string-iii/
# @param {String} s
# @return {String}
=begin
    two pointer approach

    time: O(n)
        Still got to go throught all chars in n. 

    space: O(1) 
        Yes we technically create new strings of size l..r-l 
        The worst case would be a string on one word of s.lenght = 5*10^4 that a constant lol. 
               
    note:
        Yes, I did use reverse but the time would be the same if I did it using the l and r pointers. 
        The approach would have been the same however you'd move l forward and create another temporary r pointer to move towards 
        l. As you do this you swap until l meets r. Then set l where r is +1. Might be fun to do this as a second exercise. 

=end
def reverse_words(s)
    l,r = 0,0

    while r < s.length
        if s[r] == ' '
            s[l..r-1] = s[l..r-1].reverse 
            l = r + 1
        end
    
        r += 1
    end
    
    s[l..r-1] = s[l..r-1].reverse
    return s
end

# NOT ME BUT COOL
def reverse_words(s)
    s.split(' ').collect(&:reverse).join(' ')
end