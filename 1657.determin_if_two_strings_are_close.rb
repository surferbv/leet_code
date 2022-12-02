# 1657. determin if two strings are close
# @param {String} word1
# @param {String} word2
# @return {Boolean}
def close_strings(word1, word2)
    word1_hash, word2_hash = Hash.new(0), Hash.new(0)

    word1.chars.each do |c|
        word1_hash[c] += 1
    end
    
    word2.chars.each do |c|
        word2_hash[c] += 1
    end

    return false if word1.length != word2.length
    
    return false if word1_hash.keys.sort() != word2_hash.keys.sort()

    return word1_hash.values.sort() == word2_hash.values.sort()
end