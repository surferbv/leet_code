# @param {String} s
# @param {String} t
# @return {Boolean}

# appraoch: sort both strings and compare
# time: O(nlogn)
# space: O(1) - assuming sort is in place
def is_anagram(s, t)
    return false if s.length != t.length
    return s.chars.sort == t.chars.sort
end

# approach: hash table
# time: O(n)
# space: O(1) - assuming hash table is constant size
# we can use one hash table because we know the strings are the same length
# and we can just increment and decrement the values
# if the strings are not the same length, we would need two hash tables
# and compare the two hash tables at the end
# if the hash tables are the same, then the strings are anagrams
# if the hash tables are not the same, then the strings are not anagrams
def is_anagram(s, t)
    return false if s.length != t.length
    hash = Hash.new(0)
    s.each_char { |char| hash[char] += 1 } # increment the hash table
    t.each_char { |char| hash[char] -= 1 } # if the strings are anagrams, the hash table will be all 0s
    hash.values.all? { |val| val == 0 } # returns true if all values are 0
end

