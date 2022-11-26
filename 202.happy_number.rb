# 202. Happy Number
# https://leetcode.com/problems/happy-number/
# https://www.youtube.com/watch?v=ljz85bxOYJ0
# @param {Integer} n
# @return {Boolean}
=begin

    set approach

    time: O(log n)
        I can't explain please read the solution on leet code.

    space: O(log n)
        I can't explain please read the solution on leet code.

    note:
        I did not think about using a hash set but what you are suppose to use is a linked list. Slove next time using a linked list.

=end
require 'set' 
def is_happy(n)
    seen = Set.new()

    while !seen.include? n
        seen.add(n)
        n = sum_of_square(n)
        return true if n == 1
    end

    return false
end

def sum_of_square(n)
    result = 0 
    while n != 0
        digit   = n % 10
        digit   = digit ** 2
        result +=  digit
        n      /= 10
    end
    return result
end
