# 374. Guess Number Higher or Lower (easy)
# https://leetcode.com/problems/guess-number-higher-or-lower/?envType=study-plan&id=binary-search-i
# https://www.youtube.com/watch?v=xW4QsTtaCa4
# The guess API is already defined for you.
# @param num, your guess
# @return -1 if num is higher than the picked number
#          1 if num is lower than the picked number
#          otherwise return 0
# def guess(num)
=begin

    non array approach

    time: O(log n)

    space: O(1)

    note: 
        Binary search without using an array and a api helper. 
        Oops forgot to put mid and result in loop.  

=end
def guessNumber(n)
    l, r    = 1, n

    while true
        mid     = (l+r) / 2
        result  = guess(mid)
        if result < 0
            r = mid - 1
        elsif result > 0
            l = mid + 1
        else
            return mid
        end
    end
end

=begin

    array approach

    time: O(log n)

    space: O(n)
        Since we create an array of size n

    note:
        (TLE) A more efficient way would be to not allocated an array of size n. 

=end
def guessNumber(n)
    possible    = (1..n).to_a
    l, r        = 0, n - 1

   while l <= r # could left as true since we are guaranteed a result. 
        mid         = (l + r) / 2
        my_guess    = possible[mid]
        the_number  = guess(my_guess)

        if the_number == -1
            r = mid - 1

        elsif the_number == 1
            l = mid + 1
        else
            return my_guess if 0 == the_number # strange I know
        end
   end
end
