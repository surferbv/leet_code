# 1304. Find N Unique Integers Sum up to Zero (easy) (freq: med)
# https://leetcode.com/problems/find-n-unique-integers-sum-up-to-zero/
# @param {Integer} n
# @return {Integer[]}
#
=begin

    adding zeros approach

    time: O(n)

    space: O(n)

    note:
        Think about adding zeros, this case I chose the n and -n and subtract it by one to get to the next number. 
        Could not solve it on own argh!

=end
def sum_zero(n)
    result = []

    result.unshift(0) if n % 2 == 1

    num = n
    (n/2).times do 
        result.unshift(num)
        result.unshift(-num)
        num -= 1
    end

    return result
end