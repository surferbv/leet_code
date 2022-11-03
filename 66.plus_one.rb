# @param {Integer[]} digits
# @return {Integer[]}
#
# carry approach
#
# time: O(N) where N is the number of elements in the input array
#
# space: O(N) worst case we'd need to add a 1 at the begging 
#       the array. This would require us to allocated a new 
#       copy of the array of size N + 1.
def plus_one(digits)
    p = digits.length 

    while p > 0
        p -= 1
        carry = 0

        # if the digit is between 0 and 9 
        if (digits[p] + 1) - 9 <= 0 
            break digits[p] += 1
        
        # if the sum is greater than 9
        # if we are at the begging of the array
        elsif p - 1 < 0 
            carry       = (digits[p] += 1) - 9
            digits[p]   = 0
            digits.unshift(carry) 
        
        # otherwise it is a 9 set to to 0 
        else
            digits[p] = 0

        end

    end
    digits
end

# cleaner carry approach
#
# time: O(N) where N is the number of elements in the input array
#
# space: O(N) worst case we'd need to add a 1 at the begging 
#       the array. This would require us to allocated a new 
#       copy of the array of size N + 1.
def plus_one(digits)
    n = digits.length

    for i in (0..digits.length - 1) do
        idx = n - 1 - i

        if digits[idx] == 9
            digits[idx] = 0
        else
            digits[idx] += 1
            return digits
        end

    end

    return [1] + digits
end

# Add Binary
# https://leetcode.com/problems/add-binary/solutions/414426/official-solution/

# Plus one linked list
# https://leetcode.com/problems/plus-one-linked-list/solutions/457437/official-solution/