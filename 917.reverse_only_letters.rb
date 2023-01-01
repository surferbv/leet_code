=begin

    title:
        917. Reverse Only Letters (easy)

    links:
        https://leetcode.com/problems/reverse-only-letters/description/

    approach:
        two pointer appraoch

    time: O(n)

    space: O(1)
        
    note:
        Two pointer appraoch use to iterate over the 
        string in n time. 

    til:
        We used the ordinal values of strings to determine 
        if the characters in the string were alphabet characters. 

    results:
        Runtime 94 ms Beats 78.79% Memory 211.1 MB Beats 15.15%

=end
# @param {String} s
# @return {String}
def reverse_only_letters(s)
    word_ords   = [*('a'.ord..'z'.ord), *('A'.ord..'Z'.ord)]
    left        = 0
    right       = s.length - 1

    while left <= right
        left_ord  = s[left].ord
        right_ord = s[right].ord

        if word_ords.include?(left_ord) && word_ords.include?(right_ord)
            s[left], s[right] = s[right], s[left]
            left += 1
            right -= 1

        elsif !word_ords.include?(left_ord) && word_ords.include?(right_ord)
            left += 1

        elsif word_ords.include?(left_ord) && !word_ords.include?(right_ord)
            right -= 1

        else
            left += 1
            right -= 1
        end
    end
    
    return s
end