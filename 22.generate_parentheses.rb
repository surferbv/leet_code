#22. Generate Parentheses
# @param {Integer} n
# @return {String[]}
#
=begin

    backtrack approach

    time: O(4^n / n)
        n-th Catalan number
        each valid sequence has at most n steps during backtracking. 

    space: O(4^n / n)
        n-th Catalan number and using O(n) space to store the sequence. 

    note:
        Know idea! only thing I could think of is 
        for every left there must be a right. 
        
        Well formed parentheses can't have a right
        come before a left parentheses.

        n * 2 would give you the number of parentheses.

        the first tells use that we need n open parentheses 
        and n closed parentheses
        
        you can never start with a open parentheses 

        Algorithm:
        open    = (
        closed  = )
        - valid stop IFF open == closed == n
        - only add an open parentheses if open < n 
        - only add a closing parentheses if closed < open
               
=end
def generate_parenthesis(n)
    @n       = n
    @stack   = []
    @result  = []

    def back_track(open_count, closed_count)
       
        if open_count == @n && closed_count == @n
            @result.push(@stack.join(""))
            return
        end

        if open_count < @n
            @stack.push("(")
            back_track(open_count + 1, closed_count)
            @stack.pop()
        end

        if closed_count < open_count
            @stack.push(")")
            back_track(open_count, closed_count + 1)
            @stack.pop()
        end
    end

    back_track(0, 0)
    return @result    
end
