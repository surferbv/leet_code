# 541. Reverse String II (easy)
# https://leetcode.com/problems/reverse-string-ii/
# @param {String} s
# @param {Integer} k
# @return {String}
=begin

    string iteration approach

    time: O(n)

    space: O(n)

    note:
        Could this by done with two pointers? hmmm... Questions was confusing could not solve this firt time around. 

=end
def reverse_str(s, k)  
    0.step(s.length, 2*k) do |i|
        s[i..(i+k) - 1] = s[i..(i+k) - 1].reverse
    end

    return s
end