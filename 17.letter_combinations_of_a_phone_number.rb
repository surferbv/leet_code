# 17.letter_combinations_of_a_phone_number.rb
# @param {String} digits
# @return {String[]}
#
=begin

    backtracking approach with recursion

    time: O(n * 4^n)
        Why 4 because in the worst case we have only 
        7's or 9's that have four characters. 
        And the n times is the length of the digits.
        
    space: O(n)
        Based on the length of the digits that is how 
        deep the stack will got using recursion. 
        The hash map does not grow with respect to the size
        since it is a fixed range from [2,9] thus it's 
        O(1) < O(n) thus O(n).

    note:
        This uses backtracking, hash table, and recursion. 
        Still don't understand this completely. 
        There's a ruby way of doing this using 
        a.product b where a and b are arrays. 

=end
def letter_combinations(digits)
    @digits         = digits
    @digits_to_char = {"2" => "abc", "3" => "def", "4" => "ghi", "5" => "jkl", "6" => "mno", "7" => "pqrs", "8" => "tuv", "9" => "wxyz"}
    @result         = []   

    def backtrack(i, curr_str)

        if curr_str.length == @digits.length            # don't understand base case
            @result.push(curr_str) 
            return 
        end
        
        char_string = @digits_to_char[@digits[i]].split("")

        char_string.each do |c|                         # for each c in digits to char 
            backtrack(i + 1, curr_str + c)              # i + 1 next char index
        end 
    end
    
    backtrack(0, "") if !@digits.empty?
    
    return @result
end