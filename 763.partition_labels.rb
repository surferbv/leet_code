=begin

    title:
        763. Partition Labels (medium)

    links:
        https://leetcode.com/problems/partition-labels/
        https://www.youtube.com/watch?v=B7m8UmZE-vw
        
    approach:
        hash table approach

    time: O(n)
        because we still have to pass through the entire string to find the partitions.

    space: O(1)
        at most we will store 26 characters since s only consists of lowercase English characters.

    note:
        use a hash map to hold the last index and then you use 
        size to keep track of the current partition, result to hold the current result, and 
        end_idx to hold the current end index of the partition. 

    til:
        this was a very difficult problem to understand but the basic idea is that you use a
        hash table to determine the end_idx and you move along the string. 
        If the end_idx is greater than the last_index then you adjust it. 
        a|ba => ab|a => aba| return 3 

    results:
        Runtime 106 ms Beats 83.33% Memory 211.1 MB Beats 50%
        
=end
# @param {String} s
# @return {Integer[]}
def partition_labels(s)
    result          = []
    size, end_idx   = 0, 0
    last_index      = Hash.new(0)

    s.chars.each_with_index do |char, i|
        last_index[char] = i
    end

    s.chars.each_with_index do |char, i|
        size    += 1
        end_idx = [end_idx, last_index[char]].max

        if i == end_idx
            result << size
            size = 0
        end
    end

    return result
end