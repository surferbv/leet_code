=begin

    title:
        1002. Find Common Characters (easy)

    links:
        https://leetcode.com/problems/find-common-characters/description/

    approach:
        hash table approach

    time: O(w(n + m))
        For each word we have to run the intersection. Running intersection 
        has O(n+m) and we iterate through all w words.   

    space: O(w(min(n, m)))

    note:
        Similar to 350 intersection of two arrays II only difference is that we
        use the method we implemented on each word to find the common characters.

    til:

    results:
        Runtime 114 ms Beats 90% Memory 210.9 MB Beats 90%

=end
# @param {String[]} words
# @return {String[]}
def common_chars(words)
    result = words.first

    words.each do |w|  
        result = intersect(result, w)
    end
    
    result.chars      
end

def intersect(word1, word2)
    result  = ''   
    hash    = Hash.new(0)
    
    # set word1 as the smallest
    if word1.length > word2.length
        tmp      = word1
        word1    = word2
        word2    = tmp
    end

    word1.chars.each do |n|
        hash[n] += 1
    end

    word2.chars.each do |n|
        if hash.key?(n) && hash[n] > 0
            result << n
            hash[n] -= 1
        end
    end

    return result
end
