# 3.longest_substring_without_repeating_characters.rb
# @param {String} s
# @return {Integer}
#
=begin

    sliding window approach

    time: O(n)
        We have to go through all n characters 
        in the string. If the string itself is 
        the longest sub-string. 

    space: O(n)
        We have store n characters in our set.
        If the string itself is the longest sub-string. 

=end
require 'set'
def length_of_longest_substring(s)
    l                   = 0 
    result              = 0
    seen                = Set.new()

    for r in (0..s.length - 1) do

        while seen.include?(s[r])
            seen.delete(s[l])
            l += 1
        end
        seen.add(s[r])
        result = [result, r - l + 1].max # could also use seen.length 
    end

    return result
end


=begin

    DOES NOT WORK

    Almost but 

    1. using two pointers l and r (i.e. left and right) 
    2. move r ahead of l
    3. for each iterattion r moves one 
    4. if r finds a character that is a duplicate in the substring
    5. keep moving left towards r until the duplicate is no more
    5.1 you can keep track of duplicates using a set 
    5.2 be sure that as you move l towards right that you remove the char from the set
    6. do this while keep track of a max size of a substring

=end
require 'set'
def length_of_longest_substring(s)
    l, r        = 0, 1
    max_length  = 0
    seen        = Set.new()

    # if the s is empty
    return 0 if s.length == 0

    max_length += 1
    seen.add(s[l])

    while r < s.length

        while !seen.include?(s[r]) 
            seen.delete(s[l])
            l += 1
            # problems srtarted here...........
            seen.add(s[l])
        end
            

        r += 1
    end





    
end