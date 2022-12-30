=begin

    title:
        739. Daily Temperatures

    links:
        https://leetcode.com/problems/daily-temperatures/
        https://www.youtube.com/watch?v=cTBiBSnjO3c

    approach:
        monotonic stack approach

    time: O(n)
        We do one pass over the temperatures array.

    space: O(n)
        In the worst case the first temperature is the lowest
        so we would place all n values in the stack.

    note:
        The main idea is to compare the indices of the stack with the
        input array. We do this be keeping track of the temperature
        and the index as a pair in the stack. Once we find a stack temperature
        that is greater then the current temp we pop and calculate the difference
        which is the number of days. A visualization would be helpful. 

    til:
        Monotonic stacks

    results:
        Runtime 692 ms Beats 79.17% Memory 223.5 MB Beats 71.43%

=end
# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
    result  = Array.new(temperatures.length, 0)
    stack   = [] # holds a pair of values [temperature, index] 

    temperatures.each_with_index do |temp, i|
        while !stack.empty? && temp > stack[-1][0]
            stack_temp, stack_index = stack.pop()
            result[stack_index] = (i - stack_index)
        end

        stack.append([temp,i])
    end

    return result
end