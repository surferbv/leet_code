=begin

    title:
        243. Shortest Word Distance

    links:
        https://leetcode.com/problems/shortest-word-distance/

    approach:
        iteration approach

    time: O(n m)
        We have to iterate over n words in the array and m is the total length of the two input words.

    space: O(1)

    note:
        Keep track of the indices for w1 and w2 calculating the distance each time. 

    til:
        Clever trick to use two indices and calculate the current distance. 

    results:
        Runtime 84 ms Beats 100% Memory 212.2 MB Beats 83.33%

=end
# @param {String[]} words_dict
# @param {String} word1
# @param {String} word2
# @return {Integer}
def shortest_distance(words_dict, word1, word2)
    i1, i2 = -1, -1
    min_dist = words_dict.length

    for i in (0..words_dict.length-1)
        if words_dict[i] == word1
            i1 = i 
        elsif words_dict[i] == word2
            i2 = i
        end
        if i1 != -1 && i2 != -1
            min_dist = [min_dist, (i1-i2).abs].min
        end
    end

    return min_dist
end




=begin

    title:
        243. Shortest Word Distance

    links:
        https://leetcode.com/problems/shortest-word-distance/

    approach:
        iteration approach

    time: O(n)
        We first find word1 which is n
        then, from word1 traverse forwrad to see if we find word2 takes n
        If we don't find it we iterate backwards from word1 which takes another n
        So in the worst case we have n + n + n = 3n = n

    space: O(1)

    note:
        This approach does not work! What happens when you have more than two values that are the same
        ["a","a","b","b"]

    til:

    results:

=end
# @param {String[]} words_dict
# @param {String} word1
# @param {String} word2
# @return {Integer}
def shortest_distance(words_dict, word1, word2)
    distance    = 0
    word1_idx   = -1
    
    # find word1
    words_dict.each_with_index do |word, i|
        word1_idx = i if word == word1
    end

    # move forwrd to find word2
    for i in (word1_idx..words_dict.length-1)
        return distance if words_dict[i] == word2
        distance +=1
    end
    distance = 0 

    # move backwards to find word2
    for i in (word1_idx).downto(0)
        return distance if words_dict[i] == word2
        distance +=1
    end

end