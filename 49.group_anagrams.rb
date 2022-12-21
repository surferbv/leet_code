=begin

49. Group Anagrams

links:  
    https://leetcode.com/problems/group-anagrams/
    https://www.youtube.com/watch?v=vzdNOK2oB2E

approach:
    frequency of word as key

time: O(m n * 26) => O(m n)
    Where m is the number of strings in the array
    and n is the length of each string. 

space: O(n)
    We store each string into a hash called seen.

note:
    Use a hash to solve this with clever key creation based on
    the frequency count of each letter.

til:
=end
# @param {String[]} strs
# @return {String[][]}
def group_anagrams( strs )
result = Hash.new( [] )

strs.each do |s|
    alpha_count = Array.new( 26, 0 )

    s.chars.each do |c|
        alpha_count[ c.ord - 'a'.ord ] += 1
    end
    
    if !result.key?( alpha_count )
        result[ alpha_count ] = [] << s
    else
        result[ alpha_count ] << s
    end
end

return result.values.to_a
end

=begin

49. Group Anagrams

links:  
    https://leetcode.com/problems/group-anagrams/
    https://www.youtube.com/watch?v=vzdNOK2oB2E

approach:
    sorting each string and storing as key approach

time: O( m n log n )
    Where m is the number of strings in the array
    and n is the length of each string. 

space: O( n )
    We store each string into a hash called seen.

note:
    This is not the optimal approach since we have to sort each string.
    This approach still works and does run pretty fast. 
    Runtime 199 ms Beats 91.97%
    Memory 214.2 MB Beats 94.82%

til:
=end
# @param {String[]} strs
# @return {String[][]}
def group_anagrams( strs )
result = Hash.new()

strs.each do |s|
    s_sorted = s.chars.sort.join
    if !result.key?( s_sorted )
        result[ s_sorted ] = [] << s
    else
        result[ s_sorted ] << s
    end
end

return result.values.to_a
end