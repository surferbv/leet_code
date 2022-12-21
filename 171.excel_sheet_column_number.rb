=begin

    171. Excel Sheet Column Number

    approach:
        no hash approach

    links:
        https://leetcode.com/problems/excel-sheet-column-number/

    time: O(n)
        Where n is the number or characters in the input string

    space: O(1)

    note:
        Not easy for me I strugglged a lot and eventually had to look at the algorithm.
        Trick AZZC = A*** + Z** + Z* + c

    til:
        Patterns

=end
# @param {String} column_title
# @return {Integer}
def title_to_number( column_title )
    result  = 0
    n       = column_title.length - 1

    for i in ( 0..n ) do
        result = result * 26
        result += (column_title[i].ord - 'A'.ord + 1)
    end

    return result
end