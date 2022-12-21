=begin
    412. Fizz Buzz

    links:
        https://leetcode.com/problems/fizz-buzz/

    time: O(n)
        Still have to insert n items in the array.

    space: O(n)
        Based on the size of n

    note: 
        Simple if statement with loops. 

    til:
        Don't use a case statement as if once the expression is evaluated it should not 
        evaluate the following statements. 

=end
# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
    i       = 0
    result  = []
    
    n.times do
        i += 1

        if (i % 3 == 0) && (i % 5 == 0)
            result << "FizzBuzz" 

        elsif i % 3 == 0
            result << "Fizz" 
        
        elsif i % 5 == 0
            result << "Buzz"

        else
            result << i.to_s

        end

    end

    return result
end
