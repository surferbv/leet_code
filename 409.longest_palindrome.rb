=begin

    title:
        409. Longest Palindrome (easy)

    links:
        https://leetcode.com/problems/longest-palindrome/description/

    approach:
        hash table approach

    time: O(n)
        we still need to iterate through all the characters in the string.

    space: O(1)
        we hold a fixed number of characters in the hash table 52 in the worst case.

    note:
        hash map to keep track of the number of times the character occurs in the string.
        then you to fancy stuff. 

    til:
        still don't understand why you need to 
        result += (val / 2) * 2 instead of result += val if val % 2 == 0
        example: 'aaaaa' this occurs v times or 5 times thus 5/2 * 2 using integer arithmetic 
        we get 4. but how do we find the unique center values that have not been included?
        That comes from the second step.

        I had another approach keeping track of the greatest center
        this did not work but this approach worked why?
        if result % 2 == 0 && val % 2 == 1
            result += 1
        end
        If v % 2 == 1 then that character could have been a unique center. Thus,
        if result % 2 == 0 AND v % 2 == 1 hmmm...

    results:
        Runtime 84 ms Beats 98.94% Memory 210.9 MB Beats 73.40%

=end
# @param {String} s
# @return {Integer}
def longest_palindrome(s)
    result      = 0
    freq        = Hash.new(0)

    s.chars.each do |c|
        freq[c] += 1
    end
   
    freq.values.each do |val|
        result += (val / 2) * 2
        if result % 2 == 0 && val % 2 == 1
            result += 1
        end
    end
    
    return result + odd_count
end