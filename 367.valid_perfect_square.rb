=begin

    title:
        367. Valid Perfect Square (easy)

    links:
        https://leetcode.com/problems/valid-perfect-square/
        https://www.youtube.com/watch?v=Cg_wWPHJ2Sk

    approach:
        binary search approach

    time: O(log n)
        Since we half the search space for each iteration of the loop.
        Typical binary search.

    space: O(1)
        No additional data structures are used to calculate the result. 

    note:
        Three ways of doing this that will result in a logarithmic run time.
        1. recursive approach 2. binary search 3. newtons approach

    til:
        That you can use binary search to determine if a number is a perfect square. 

    results:
        Runtime 83 ms Beats 76.92% Memory 211.2 MB Beats 7.69%

=end
# @param {Integer} num
# @return {Boolean}
def is_perfect_square(num)

    return true if num < 2 

    left    = 1
    right   = num / 2

    while left <= right
        x = (left + right) / 2
        guess = x**2

        return true if guess == num

        if guess < num
            left = x + 1
        else
            right = x - 1
        end

    end
        
    return false
end