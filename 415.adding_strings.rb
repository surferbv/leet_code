# 415 adding strings (easy)
# https://leetcode.com/problems/add-strings/
# 
# Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.
# You must solve the problem without using any built-in library for handling large integers (such as BigInteger). 
# You must also not convert the inputs to integers directly.
# 
# @param {String} num1
# @param {String} num2
# @return {String}
=begin

    elementary math approach

    time: O(max(n1,n2))

    space: O(max(n1,n2))

    note:
        Really struggled, I  was trying to loop through this backwards. 

=end
def add_strings(num1, num2)
    result  = []
    carry   = 0
    
    p1 = num1.length - 1
    p2 = num2.length - 1

    while p1 >= 0 || p2 >= 0
        p1 >= 0 ? x1 = num1[p1].to_i : x1 = 0
        p2 >= 0 ? x2 = num2[p2].to_i : x2 = 0  

        val     = (x1 + x2 + carry) % 10
        carry   = (x1 + x2 + carry) / 10 

        result.unshift val

        p1 -= 1
        p2 -= 1
    end

    result.unshift carry if carry != 0  

    return result.join('')
end