# 69.sqrt(x).rb
# @param {Integer} x
# @return {Integer}
#
# DOES NOT WORK
#
# time: O(1)
#
# space: O(1)
def my_sqrt(x)
    return x if x < 2
    
    # https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Exponential_identity
    left    = (Math::E ** (0.5 * Math::log2(x))).to_i
    right   = left + 1
    
    if right * right > x 
        return left
    else
        return right
    end
end

# binary search appraoch 
#
# time: O(log n) need to use master theorem
#
# space: O(1)
def my_sqrt(x)
    return x if x < 2

    left    = 2 
    right   = x / 2
    pivot   = (left + right) / 2

    while left <= right
        pivot = (left + right) / 2

        num = pivot ** 2

        if num > x
            right = pivot - 1
        elsif num < x
            left = pivot + 1
        else
            return pivot
        end
    end

    return pivot if pivot < left
end