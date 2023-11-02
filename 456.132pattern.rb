# approach: monotonic stack
# time: O(n)
# space: O(n)
# technique: monotonic stack
# notes:
#       rememebr how we get to a k value we want to look back to find a j value that is greater than k
#       and we want to look forward to find a i value that is less than k
#       so we can use a stack to keep track of the k values
#       and we can use a min heap to keep track of the i values or monotonic stack 
#       monotonic stack in decresing order the max might not always be the first element
# @param {Integer[]} nums
# @return {Boolean}
def find132pattern(nums)
    stack = [] # pair of [num, min_left] where num is our k value and min_left is the min value to the left of k
    curr_min = nums[0]

    nums.drop(1).each do |n| # we start at 1 because we already have the first element in our stack
        while !stack.empty? && n >= stack[-1][0] # ensure we keep the stack monotonic
            stack.pop
        end

        return true if !stack.empty? && n > stack[-1][1]

        stack.push([n, curr_min])
        puts stack.inspect
        curr_min = [curr_min, n].min
    end

    false
end