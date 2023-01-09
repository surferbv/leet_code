=begin

    title:
        2011. Final Value of Variable After Performing Operations

    links:
        https://leetcode.com/problems/final-value-of-variable-after-performing-operations/

    approach:
        conditional approach

    time: O(n)

    space: O(1)

    note:
        ensure you get your operations and conditional statements correct   

    til:

    results:
        Runtime 87 ms Beats 84.38% Memory 211.1 MB Beats 18.75%

=end
# @param {String[]} operations
# @return {Integer}
def final_value_after_operations(operations)
    x = 0
    operations.each do |op|        
        if op == "--X" || op == "X--"
            x -= 1
        elsif op == "++X" || op == "X++"
            x += 1
        else
            put "Not a valid operation"
        end
    end

    return x
end