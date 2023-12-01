# @param {String} s
# @return {Boolean}
def is_valid(s)
    stack = []
    hash = { 
        '(' => ')',
        '[' => ']',
        '{' => '}'
    }

    s.chars.each do |c|
        # if c is an open bracket we add it to the stack
        if hash.key?(c)
            stack.push(c)
        else # it's a closing bracket so we need to pop what's on the stack and check that the popped value matches 
            paren = stack.pop()
            return false if hash[paren] != c # if it does not match
        end
    end

    return false if !stack.empty? # if the stack is not empty then it is not valid
   true 
end