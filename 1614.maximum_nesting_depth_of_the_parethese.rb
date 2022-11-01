# 1614.maximum_nesting_depth–of_the_parentheses.rb
# @param {String} s
# @return {Integer}
#
# stack approach
#
# time: O(n) where n is the size of s. 
#
# space: O(n) where n is the size of the stack assuming all values are ( or )
def max_depth(s)
    max_depth   = current_depth = 0
    stack       = []

    s.split('').each do |c|
        stack.push(c) && current_depth  += 1 if c == '('
        stack.pop && current_depth      -= 1 if c == ')'
        max_depth = current_depth if current_depth > max_depth
    end

    max_depth
end

# iterative approach
#
# time: O(n) where n is the size of s.
#
# space: O(1) we don't store any calculations in additional data structure.
def max_depth(s)
    max_depth = current_depth = 0

    (0..s.length - 1).each do |i|
        current_depth  += 1 if s[i] == '('
        current_depth  -= 1 if s[i] == ')'
        max_depth = current_depth if current_depth > max_depth
    end

    max_depth
end