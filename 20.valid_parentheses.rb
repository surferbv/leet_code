# 20.valid_parentheses.rb
# https://leetcode.com/problems/valid-parentheses/
# https://youtu.be/WTzjTskDFMg
# @param {String} s
# @return {Boolean}

def is_valid(s)
    return true if s.empty?

    stack = []
    s.each_char do |c|
        
        case c 
            when '(', '{', '['
                stack.push(c)
            when ')'
                return false if stack.pop != '('
            when ']'
                return false if stack.pop != '['
            when '}'
                return false if stack.pop != '{'
            else
                puts "invalid char"
        end

    end
    return stack.empty?
end




=begin

    hash map approach

    time: O(n)
        Since we iterate over the list once.

    space: O(n)
        We store at most n parentheses. 

    note:   
        Keep in mind that we should only be adding open parentheses first for it to be valid. 
        If we have any parentheses left on the stack it is invalid.


=end
def is_valid(s)
    stack = []
    lr_match = { ')'=>'(', ']'=>'[', '}'=>'{' } # we match closed with open

    s.split('').each do |c|
        if lr_match.key?(c)
            if stack[-1] == lr_match[c] && !stack.empty?
                stack.pop
            else
                return false # since we can't have a closed first without an open
            end
        else
            stack.push(c)
        end
    end

    return stack.empty? # if the stack is not empty the number of closed != open
end
