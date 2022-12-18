=begin
    191. Number of 1 Bits

    links:
        https://leetcode.com/problems/number-of-1-bits/submissions/861810243/

    time: O(1)
        We have at most 32 1's which is pretty small the worst 
        case we have to loop 32 times if we have nothing but 1's. 

    space: O(1) 
        We are not storing anything besides the one's count. 

    note:
        You can shift the bits by one to the right or left each time
        counting the ones you see. I wonder if you could do this using xor?

    til:
        Shifting bits and using ?1 convert is to "1"

=end
# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
    count_ones = 0

    while n != 0 
        count_ones += 1 if n.to_s(2)[-1] == "1" 
        (n = n >> 1).to_s(2)
    end

    return count_ones
end