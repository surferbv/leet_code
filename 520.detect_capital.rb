=begin

    title:
        520. Detect Capital (easy)

    links:
        https://leetcode.com/problems/detect-capital/

    approach:
        upcase downcase approach

    time: O(1)
        assuming ordinal bit manipulation

    space: O(1)

    note:
        Yes lazy approach using upcase and downcase but I'm tired. 
        The proper way would be to use ASCII values a set and see 
        if those chars comform to the checks outlined in the instructions. 

    til:
        upcase and downcase

    results:
        Runtime 86 ms Beats 75% Memory 211 MB Beats 91.67%

=end
# @param {String} word
# @return {Boolean}
def detect_capital_use(word)

    # all letters in the word are capital or all letters in the word are NOT capital
    if word == word.upcase || word == word.downcase
        return true 
    end

    # only the first letter in the word is capital
    return true if word[0].upcase == word[0] && word[1..-1] == word[1..-1].downcase
        
    return false
end