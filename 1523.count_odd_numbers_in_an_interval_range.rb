=begin

    title:
        1523. Count Odd Numbers in an Interval Range (easy)

    links:
        https://leetcode.com/problems/count-odd-numbers-in-an-interval-range/

    approach:
        parity of even and odd approach

    time: O(1)

    space: O(1)

    note:
        Crazy math trick in observing the parity given a range. 
        Assuming x is odd x - y / 2 + 1. If the low value is not odd 
        we make it so by adding one. We can check this by doing bit-wise operation
        low & 1 which is faster. 

    til:
        x - y / 2 + 1 is a way to find out how many odd number exists between a 
        low an hit range. The proof takes into consideration that the spacing between odds 
        and evens. If you take the difference i.e.  you get the number of numbers now if you divide 
        it by 2 you get half odd half even. However, this does cut off one odd so you add one 
        assuming that you are starting with and odd number for the given range. 

    results:
        Runtime 89 ms Beats 76.9% Memory 211.2 MB Beats 10.87%

=end
# @param {Integer} low
# @param {Integer} high
# @return {Integer}
def count_odds(low, high)
    
    low += 1 if low % 2 == 0

    return low > high ? 0 : ((high - low) / 2) + 1
end
