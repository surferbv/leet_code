# @param {String[]} word1
# @param {String[]} word2
# @return {Boolean}
# 
# join approach
# time: O(N * K) Since we iterate over every string and 
#       every character in that string. 
# space: O(1) no additional data structures are created since 
#       we are using pointers to track and compare each character.
def array_strings_are_equal(word1, word2)
    word1.join == word2.join
end

# combine and compare approach
# time: O(N * K) Since we iterate over every string and 
#       every character in that string. 
# space: O(1) no additional data structures are created since 
#       we are using pointers to track and compare each character.
def array_strings_are_equal(word1, word2)
    word1comp = ""
    word2comp = ""
    
    word1.each do |w|
        word1comp << w
    end

    word2.each do |w|
        word2comp << w
    end

    word1comp == word2comp
end

# word and string pointer approach
# time: O(N * K) Since we iterate over every string and 
#       every character in that string. 
# space: O(1) no additional data structures are created since 
#       we are using pointers to track and compare each character.
def array_strings_are_equal(word1, word2)

    word1ptr = str1ptr = 0 
    word2ptr = str2ptr = 0

    while word1ptr < word1.length && word2ptr < word2.length
        return false if word1[word1ptr][str1ptr] != word2[word2ptr][str2ptr]

        str1ptr += 1
        str2ptr += 1

        if str1ptr == word1[word1ptr].length
            word1ptr += 1
            str1ptr = 0
        end

        if str2ptr == word2[word2ptr].length
            word2ptr += 1
            str2ptr = 0
        end

    end

    return word1ptr == word1.length && word2ptr == word2.length

end