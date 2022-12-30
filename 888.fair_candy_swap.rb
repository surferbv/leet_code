=begin

    title:
        888. Fair Candy Swap

    links:
        https://leetcode.com/problems/fair-candy-swap/description/

    approach:
        math approach

    time:

    space:

    note:

    til:

    results:

=end
# @param {Integer[]} alice_sizes
# @param {Integer[]} bob_sizes
# @return {Integer[]}
require 'set'
def fair_candy_swap(alice_sizes, bob_sizes)
    set     = bob_sizes.to_set()
    
    sum_b   = bob_sizes.sum 
    sum_a   = alice_sizes.sum

    alice_sizes.each do |x|
        delta = sum_b - sum_a / 2
        if set.include?(x + delta)
            return [x, x + delta]
        end
    end
end
