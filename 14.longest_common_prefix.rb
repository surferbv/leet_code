# approach: horizontal scanning
# time: O(n)
# space: O(1)
# notes:
#       I could not figure this out on my own. I had to look at the solution.
#       I was able to understand the solution and implement it on my own.
# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
    return "" if strs.length == 0                   # if there's no strs return "" 
    prefix = strs.first                             # get the first str and set it as the prefix 

    (1..strs.length - 1).each do |index|            # loop through all the strings 
        while strs[index].index(prefix) != 0        # index returns the index of the common character
            prefix = prefix[0,prefix.length - 1]    # we remove the last chart of the prefix 
            return "" if prefix.empty?
        end
    end 

    prefix
end


# approach: binary search
# time: O(s log m)   s = sum of all characters in all strings, m = length of shortest str
# space: O(1)
# notes: 
#       I could not figure this out on my own. I had to look at the solution.
#
# algorightm:
#       1. find the length of the shortest string
#       2. do a binary search on the shortest string
#       3. check if the prefix is common to all strings
#       4. if it is common to all strings then return the prefix
#       5. else return the prefix minus the last character
#
# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
    return "" if strs.length == 0                   # if there's no strs return "" 
    min_len = strs.map(&:length).min                # get the length of the shortest string
    low = 1                                         
    high = min_len

    while low <= high
        middle = (low + high) / 2
        if is_common_prefix(strs, middle)
            low = middle + 1
        else
            high = middle - 1
        end
    end

    strs[0][0, (low + high) / 2]
end

def is_common_prefix(strs, len)
    prefix = strs[0][0, len]
    strs.each do |str|
        return false if !str.start_with?(prefix)
    end
    true
end