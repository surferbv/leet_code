# You are given an integer array pref of size n. Find and return the array arr of size n that satisfies:

# pref[i] = arr[0] ^ arr[1] ^ ... ^ arr[i].
# Note that ^ denotes the bitwise-xor operation.

# It can be proven that the answer is unique.
# approach: bit manipulation
# time: O(n)
# space: O(1)
# technique: bit manipulation
# notes:
#       - we can use the fact that a ^ b = c then a ^ c = b and b ^ c = a
#       - starting from the end of the array and working our way backwards
#       - and then use the pref array to store the xor values
#
# @param {Integer[]} pref
# @return {Integer[]}
def find_array(pref)
    n = pref.length

    (n-1).downto(1).each do |i|
        pref[i] = pref[i] ^ pref[i-1]
    end

    pref
end