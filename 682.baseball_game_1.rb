# 682.baseball_game_1.rb
# @param {String[]} operations
# @return {Integer}
#
# time: O(n)
#       Where n is the length of the operations
#
# space: O(1)
#        Hmmm I think it's O(n) because of the stack
def cal_points(operations)

    stack = []

    operations.each do |op|
        case op 
        when '+'
            prev0 = stack.pop() 
            prev1 = stack.pop() 
            sum_score = prev0.to_i + prev1.to_i
            stack.push(prev1)
            stack.push(prev0)
            stack.push(sum_score)
        when 'D'
            prev = stack.pop()
            double_score = prev * 2 
            stack.push(prev)
            stack.push(double_score)
        when 'C'
            stack.pop()
        else 
            stack.push(op.to_i)
        end
    end
    stack.sum
end