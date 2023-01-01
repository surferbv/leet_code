=begin

    title:
        405. Convert a Number to Hexadecimal

    links:
        https://leetcode.com/problems/convert-a-number-to-hexadecimal/description/

    approach:
        to_s appraoch

    time: O(n)
        Under the hood to_s is implemented using str_duplicate

    space: O(1)

    note:
        Lazy appraoch you should do this using two's complement and 
        modulo to determine the hex value. 

    til:
        Two's complement and to_s

    results:
        Runtime 102 ms Beats 60% Memory 211 MB Beats 100%

=end
# @param {Integer} num
# @return {String}
def to_hex(num)
    result = 0

    if num < 0
        result = (2**32 + num).to_s(16)
    else
        result = num.to_s(16)
    end

    return result
end