# @param {String} s
# @return {Boolean}
def is_valid(s)
    dict = {
        '(' => ')',
        '[' => ']',
        '{' => '}',
    }

    stack = []

    s.chars.each do |c|
        # if the c is a open paren we add it to the stack
        if dict.key?(c)
            stack.push(c)
        else 
        # otherwise if c is not an open paren we pop whatever is on the stack
        # as we pop we need to check that they match the the opening type
        # if they don't we return false
            paren = stack.pop()
            return false if dict[paren] != c
        end
    end

    return false if !stack.empty?

   true 
end