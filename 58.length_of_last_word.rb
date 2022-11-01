# 58.length_of_last_word.rb
# @param {String} s
# @return {Integer}
#
# one line approach
#
# time: O(S) where S is the length of the string that we have to 
#       iterate and remove all blank spaces before returning. 
# 
# space: O(1) we don't allocated any space in memory or additional 
#       data structures. 
def length_of_last_word(s)
    s.split(" ")[-1].length
end

# iterate from the back approach
#
# time: O(S) if S takes is a word with no spaces.
# 
# space: O(1) no additional data structures allocated.
def length_of_last_word(s)
    length_of_last  = 0
    last_index      = s.length - 1
    
    # move the last index to the end of the last word
    while s[last_index] == " "
        last_index -= 1
    end

    # at this point last_index is at the last word
    while s[last_index] != " " && last_index != -1
        length_of_last += 1
        last_index -= 1
    end

    length_of_last
end

# one loop approach
#
# time: O(S) if S takes is a word with no spaces.
# 
# space: O(1) no additional data structures allocated.
def length_of_last_word(s)
    length_of_last  = 0
    last_index      = s.length
    
    while last_index > 0 
        last_index -= 1

        if s[last_index] != " "
            length_of_last += 1
        elsif length_of_last > 0
            return length_of_last
        else
            
        end
    end

    length_of_last
end