=begin

    title:
        266. Palindrome Permutation

    links:
        https://leetcode.com/problems/palindrome-permutation/description/

    approach:
        array frequency approach 
        
    time: O(n)
        We still need to iterate over all n characters in the string to determine
        it's frequency. 

    space: O(1)
        The problem states that string consists of lowercase English characters. 
        This we store at most 26 characters a fixed size.

    note:
        Use a array as a frequency counter using the ordinal value of the character to determine 
        where the place the number. 
    til:
        Keeping track of the occurrence can help when finding if a string is a palindrome 
        This can also be done using a hash. 

    results:
        Runtime 79 ms Beats 83.33% Memory 211 MB Beats 58.33%

=end
# @param {String} s
# @return {Boolean}
def can_permute_palindrome(s)
    map     = Array.new(26, 0)
    count   = 0

    s.chars.each do |char|
       map['z'.ord - char.ord] += 1     
    end

    map.each do |occ|
        count += occ % 2
    end

    puts map

    return count <= 1
end