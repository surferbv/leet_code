# @param {Integer} n
# @return {Integer}
#
#
# notes:
# what is the recurance relation? 
# max steps = one() + two() I think it is hmm
# need to go over dp and fib
def climb_stairs(n)
    one, two = 1, 1

    (n-1).times do |i| 
        temp = one
        one = one + two
        two = temp  # one before it changes
    end

   one # not two one buy why one? 
end