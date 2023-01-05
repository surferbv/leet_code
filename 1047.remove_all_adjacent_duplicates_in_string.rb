=begin

    title:
        1047. Remove All Adjacent Duplicates In String (easy)

    links:
        https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/

    approach:
        stack approach

    time: O(n)
        We have to iterate through the whole string

    space: O(n - d)
        Where n is the length of the string and d is the length 
        of all duplicates. 

    note:
        you can solve this using a stack.

    til:
        using a stack to check for adjacent duplicates

    results:
        Runtime 528 ms Beats 27.27% Memory 218.4 MB Beats 24.67%

=end
# @param {String} s
# @return {String}
def remove_duplicates(s)
    res_stack = []

    s.chars.each do |c|
        if !res_stack.empty? && c == res_stack[-1]
            res_stack.pop()
        else
            res_stack.push(c)
        end
    end

    return res_stack.join()
end

=begin

    approach:
        brute force approach

    time: O(n^2)

    space: O(n)

    note:

    til:

    results:
        TLE

=end
# @param {String} s
# @return {String}
def remove_duplicates(s)
    duplicates = ('a'..'z').map{ |c| [c+c,1] }.to_h

    prev_length = - 1

    while prev_length != s.length
        prev_length = s.length
        for k, v in duplicates
            s.gsub!(k,'')
        end
    end

    return s
end
