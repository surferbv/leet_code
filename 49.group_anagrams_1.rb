# @param {String[]} strs
# @return {String[][]}
# approach: hash table with sorted strings as keys
# time: O(nklogk) - n is the length of strs, k is the length of the longest string
# space: O(nk)
def group_anagrams(strs)
    hash = Hash.new { |h, k| h[k] = [] }
    strs.each do |str|
        hash[str.chars.sort] << str
    end
    hash.values
end


# appraoch 2: hash table with character counts as keys
# time: O(nk) - n is the length of strs, k is the length of the longest string
# space: O(nk)
def group_anagrams(strs)
    hash = Hash.new { |h, k| h[k] = [] }
    strs.each do |str|
        char_counts = Array.new(26, 0)
        str.each_char { |char| char_counts[char.ord - 'a'.ord] += 1 }
        hash[char_counts] << str
    end
    hash.values
end