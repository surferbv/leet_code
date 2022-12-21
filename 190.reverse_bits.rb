=begin
    190. Reverse Bits

    links:
        https://leetcode.com/problems/reverse-bits/description/
        https://www.youtube.com/watch?v=UcoN6UjAI64

    approach:
        shift and & bits approach

    time: O(1)

    space: O(1)

    note:
        1. We get one bit if it's a 1 leave it as 1 otherwise 0 then shift it to the right i times.
        2. The we append it to our string and convert to binary form. 
    til:

=end
def reverse_bits(n)
    result = ""
    
    for i in (0..31)
        bit = ( n >> i ) & 1 # 1
        result <<  bit.to_s  # 2
    end

    return result.to_i(2)
end