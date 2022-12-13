# 168. Excel Sheet Column Title
# https://leetcode.com/problems/excel-sheet-column-title/description/
# @param {Integer} column_number
# @return {String}
=begin

    mod and divide approach

    time: O( log n) base 26
        Just a guess since since we divide the input size by 26 each time. 

    space: O(1)
        We only create a fixed size array but we do creat a string. 
        The biggest string would be 2**31 - 1

    note:
        I knew it was going to use something with mod and div

=end
def convert_to_title(column_number)
    result      = ''
    alphabet    = ("A".."Z").to_a
   
    while column_number != 0
        result = alphabet[(column_number % 26) - 1] + result
        column_number = (column_number - 1) / 26
    end

    return result
end