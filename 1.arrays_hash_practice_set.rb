# arrays and hashing practice set

# @param {Integer[]} nums
# @return {Boolean}
require 'set'
def contains_duplicate(nums)
    seen = Set.new()

    nums.each do |n| 
        if seen.include?(n)
            return true
        else
            seen.add(n)
        end
    end
    
    false
end
# could make this faster using uniq
# nums.length > nums.uniq.length


# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
    s_freq = Hash.new(0)
    t_freq = Hash.new(0)

    return false if s.length != t.length

    s.chars.each do |c|
        s_freq[c] += 1
    end
    
    t.chars.each do |c|
        t_freq[c] += 1
    end

    s_freq.keys.each do |k|
        return false if !t_freq.include?(k) || t_freq[k] != s_freq[k]
    end

   true 
end

# struggle on chars and 
# hashing keys or values which to store and look over 

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    seen = Hash.new(0)

    nums.each_with_index do |n, i|
        diff = target - n
        if seen.key?(diff) 
            return [i, seen[diff]]
        else
            seen[n] = i
        end
    end

end
# DNF within 30 min time frame 
# why? I understand the concept of the complement or diff but 
# need to get into my head thae k => v is diff => index and the one I store is n = i