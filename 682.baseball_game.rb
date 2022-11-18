# 682.baseball_game.rb
# https://leetcode.com/problems/baseball-game/
# https://www.youtube.com/watch?v=Id_tqGdsZQI
# @param {String[]} operations
# @return {Integer}
#
=begin

    popping approach (if statement)

    time: O(n)
        Where n is the length of the operations

    space: O(1)

=end
def cal_points(operations)
    record = 0
    stack  = []

    operations.each do |op|
        if op == "+" # if + record a new score that is a sum of the prev two order matters! 
            stack.push(stack[-1] + stack[-2])
          
        elsif op == "D" # if D record a new score that is the double of the prev one
            stack.push(stack[-1] + stack[-1])
          
        elsif op == "C" # if C invalidate the prev score i.e. remove it
            stack.pop()
          
        else # op is a number
            stack.push(op.to_i)
        end
    end

    return stack.empty? ? 0 : stack.reduce(:+)
end

=begin

    popping approach (switch statement)

    time: O(n)
        Where n is the length of the operations

    space: O(1)

=end
def cal_points(operations)
    record = 0
    stack  = []

    operations.each do |op|
        case op
        when "+" # if + record a new score that is a sum of the prev two order matters! 
            stack.push(stack[-1] + stack[-2])
          
        when "D" # if D record a new score that is the double of the prev one
            stack.push(stack[-1] + stack[-1])
          
        when "C" # if C invalidate the prev score i.e. remove it
            stack.pop()
          
        else # op is a number
            stack.push(op.to_i)
        end
    end

    return stack.empty? ? 0 : stack.reduce(:+)
end


=begin

    poping approach

    time: O(n)
        Where n is the length of the operations

    space: O(1)

    note:
        Could have done this without popping 

=end
def cal_points(operations)
    record = 0
    stack  = []

    operations.each do |op|
        case op
        when "+" # if + record a new score that is a sum of the prev two order matters! 
            first = stack[-1].nil? ? 0 : stack.pop()
            second = stack[-1].nil? ? 0 : stack.pop()

            stack.push( second )
            stack.push( first )
            stack.push( first + second )
          
        when "D" # if D record a new score that is the double of the prev one
            d = stack[-1] + stack[-1]
            stack.push(d)
          
        when "C" # if C invalidate the prev score i.e. remove it
            stack.pop()
          
        else # op is a number
            stack.push( op.to_i )
         
        end
       
    end

    return stack.empty? ? 0 : stack.reduce(:+)
end