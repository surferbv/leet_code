# 804.unique_morse_code_words.rb
# @param {String[]} words
# @return {Integer}
#
# Algorithm:
# For each word in words
# transform the word and store it into its word slot
# once all word in words have been transformed 
# convert words to a set and return the count. 
# set approach
#
# time: O(S) where S is the sum of the lengths of words 
#
# space: O(1) since we use our existing words. 
require 'set'
def unique_morse_representations(words)
    transform_table = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
    
    words.each_with_index do |word, i|
        transformed_word = ""
        word.each_char{ |c| transformed_word << transform_table[c.bytes[0] - 97]}
        words[i] = transformed_word
    end

    words.to_set.count    
end


# hash appraoch
#
# time: O(S) where S is the sum of the lengths of words 
#
# space: O(1) since we use our existing words. 
def unique_morse_representations(words)
    seen = {}
    transform_table = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
    
    words.each_with_index do |word, i|
        transformed_word = ""
        word.each_char{ |c| transformed_word << transform_table[c.bytes[0] - 97]}
        seen[transformed_word] = true
    end

    seen.count    
end