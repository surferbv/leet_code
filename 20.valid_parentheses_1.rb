# 20.valid_parentheses_1.rb
# @param {String} s
# @return {Boolean}
# 
# time: O(n)
#       Where n is the length of the string
#
# space: O(n)
#        In the worst case we will have all the characters in the stack
#        if they don't have a matching pair.
def is_valid(s)
    return false if s.length <= 1
    stack = []
    s.each_char do |char|
        case char
        when '(','[', '{'
            stack.push(char)
        when ')'
            return false if stack.pop() != '('
        when '}'
            return false if stack.pop() != '{'
        when ']' 
            return false if stack.pop() != '['
        end
    end
    stack.empty? ? true : false
end

# 20.valid_parentheses_2.rb
# @param {String} s
# @return {Boolean}
#
# time: O(n)
#       Where n is the length of the string
#
# space: O(n)
#        In the worst case we will have all the characters in the stack
#        if they don't have a matching pair. Yest we have a hash data structure
#        but this is taking constant space since it's only 6 characters.
def is_valid(s)
    return false if s.length <= 1
    stack = []
    hash = { '(' => ')', '{' => '}', '[' => ']' }
    s.each_char do |char|
       if hash[char]
           stack.push(char)
       else
           return false if stack.pop() != hash.key(char)
       end  
    end
    return stack.empty? ? true : false
end
