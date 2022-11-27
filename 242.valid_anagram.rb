# 242. valid anagram
# https://leetcode.com/problems/valid-anagram/
# https://www.youtube.com/watch?v=9UtInBqnCgA
# @param {String} s
# @param {String} t
# @return {Boolean}
=begin
    
    rubyish sort approach 

    time: O(S+T)
        Where S and T are the length of the strings s and t.
        This could be just O(S) since t is going to be the same size as s. 

    space: O(1)
        Technically it really depends on how chars and sort and join is implemented.  

    note:
        Sort it first then compare

=end
def is_anagram(s, t)
    return s.chars.sort.join == t.chars.sort.join
end

=begin

    two hash approach

    time: O(S+T)
        Where S and T are the length of the strings s and t.
        This could be just O(S) since t is going to be the same size as s. 

    space: O(S+T)
        Since we are using a hash to store the number of occurrences of each string.

    note:
        Clever approach but not sure I like the idea of iterating over the keys. But it must be don to compare the values. 

=end
def is_anagram(s, t)
    s_hash = Hash.new(0)
    t_hash = Hash.new(0)

    return false if s.length != t.length

    for i in (0..s.length - 1) do
        s_hash[s[i]] += 1
        t_hash[t[i]] += 1
    end

    s_hash.each do |key, value|
        return false if t_hash[key] != value
    end
    
    return true
end

=begin

    sort approach explicit

    time: O(S+T)
        Where S and T are the length of the strings s and t.
        This could be just O(S) since t is going to be the same size as s. 

    space: O(1)
        Technically it really depends on how sorted is 
        implemented and converting the string to a char array does not help. 

    note:
        Sort it first then compare

=end
def is_anagram(s, t)
    
    return false if s.length != t.length

    s = sorter(s)
    t = sorter(t)


    return s == t
end

def sorter(s)
    s.split("").sort().join()
end