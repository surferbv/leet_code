# @param {String} s
# @return {Boolean}
#
# notes:
# easy just messed up on the last part forgot to check if the stack is empty
# 
def is_valid(s)
    dict = {
        '('=>')',
        '['=>']',
        '{'=>'}'
    }

    stack = []

    s.chars.each do |c|
        # we add to the stack if we see an open paren
        # we pop from the stack if we don't see an open paren
        # and check that we have a matching closing paren
        # if we don't we return false
        if dict.key?(c)
            stack.push(c)
        else
            paren = stack.pop()
            return false if dict[paren] != c
        end
    end

    # don't foget to check if the stack is empty if it isn't they we return false 
    return false if !stack.empty?

   true 
end