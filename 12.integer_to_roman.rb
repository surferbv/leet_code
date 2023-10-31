# attempt: 0
# notes:
#       Ran out of time to account for special cases
# @param {Integer} num
# @return {String}
def int_to_roman(num)
    result = ""

    # break apart the number into its digits
    digits = break_apart_num(num)

    # create a hash of the roman numerals
    roman = {
        1 => "I",
        4 => "IV",
        5 => "V",
        9 => "IX",
        10 => "X",
        40 => "XL",
        50 => "L",
        90 => "XC",
        100 => "C",
        400 => "CD",
        500 => "D",
        900 => "CM",
        1000 => "M"
    }

    # iterate through the digits and convert each digit to its roman numeral
    digits.each do |digit| 
        # account for specail cases 
        # NOT ENOUGHT TIME
        result += roman[digit]
    end

    # return the roman numeral
    result
end


def break_apart_num(num)
    zeros = 1
    digits = []
    while num != 0 
        last = num % 10
        digits.unshift(last.to_s.ljust(zeros, "0").to_i )
        num /= 10
        zeros += 1
    end
    digits
end

# attempt: 1
# approach: math and hash or array 
# time: O(n) where n is the number of digits in the number 
# space: O(1) we are storing the result in a string and the roman numerals in a hash but
#        the hash is constant size and the num is limited t o 3999 so the space is constant
# notes:
#       What is the pattern here? 
#       - Understand that a problem has specail cases and account for them i.e. 4 = "IV"
#       - Special math tricks to get the digits of a number using % and /
#       - Main take away is start building the string from the largest number and work your way down
#       - Also seeing that if 1000 = "M" and 2000 = "MM" the number in fron determins the number of times the 
#         letter is repeated
#
#       - Also you don't nessearily need to store the keys as the number and the value as the roman numeral
#       - You could also just use a list and store the roman numberal and the number as a tuple 
# @param {Integer} num
# @return {String}
def int_to_roman(num)
    result = ""
    roman = {
        1 => "I",
        4 => "IV",
        5 => "V",
        9 => "IX",
        10 => "X",
        40 => "XL",
        50 => "L",
        90 => "XC",
        100 => "C",
        400 => "CD",
        500 => "D",
        900 => "CM",
        1000 => "M"
    }

    roman.reverse_each do |key, val|
        if num / key 
            count = num / key
            count.times do 
                result += val
            end
            num %= key 
        end
    end

    result
end