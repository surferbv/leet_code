# 392. Is Subsequence
# https://leetcode.com/problems/is-subsequence/
# https://www.youtube.com/watch?v=99RVfqklbCE
# @param {String} s
# @param {String} t
# @return {Boolean}
#
=begin

    two pointer approach

    time: O(max(S,T))
        Since we have to iterate over all elements of S or T whichever is larger.  

    space: O(1)

    note:
        Use two pointers i and j, i for s and j for t. I had to right idea just ran out of time implementing it. Once i is the same length as s.length we know that s exists in t. Mistake I made was to initially modify t removing characters fromn it and then comparing it with s. It has a follow up. 

=end
def is_subsequence(s, t)
    i, j = 0, 0

    while i < s.length && j < t.length
        i += 1 if s[i] == t[j]
        j += 1
    end

    return i == s.length ? true : false
end
