# approach: brute force
# time: O(n)
# space: O(n)
# technique: 
#           math we store factors in array and return the kth factor
# notes:
#           This is not the optimal solutions as you can 
#           do this in O(sqrt(n)) time and O(min(k, sqrt(n))) space
# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def kth_factor(n, k)
    factors = []

    # generate our factors
    (1..n).each do |i|
        factors << i if n % i == 0
    end

    # find the kth factor in the list if it exists
    return -1 if k > factors.length

    factors[k-1]
end