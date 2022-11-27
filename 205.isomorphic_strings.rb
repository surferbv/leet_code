# 205. isomorphic strings
# https://leetcode.com/problems/isomorphic-strings/
# https://www.youtube.com/watch?v=7yF-U1hLEqQ
# @param {String} s
# @param {String} t
# @return {Boolean}
#
=begin

    two hash approach

    time: O(S)
        Where S is the string length. Keep in mind that s and t are the same length.

    space: O(S)
        It's really O(S + T) but since s and t are the same length O(S + S) = O(2S) = O(S)

    note:
        Spent too much time thinking about solving it. Was on the correct route did not think about using two hashes. 
=end
def is_isomorphic(s, t)
    map_st = {} # map s to t
    map_ts = {} # map t to s

    l = s.length - 1 # since both s and t are of the same length

    for i in (0..l) do
        return false if map_st.key?(s[i]) && map_st[s[i]] != t[i]
        return false if map_ts.key?(t[i]) && map_ts[t[i]] != s[i]

        map_st[s[i]] = t[i]
        map_ts[t[i]] = s[i]
    end
    
    return true
end