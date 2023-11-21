# 49. Group Anagrams
# arrays and hashing practice set
# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs = ["eat","tea","tan","ate","nat","bat"])
    res = {}

    strs.each do |str|
        key = str.chars.sort.join
        if res.key?(key)
            res[key].append(str)
        else
            res[key] = [str]
        end
    end

    res.values
end

# 238. Product of Array Except Self
# prefix sum practice set
# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums=[1,2,3,4])
    # pre-populate our res array of size nums with 1's
    res = Array.new(nums.length) {1}

    # generate our prefix product
    prefix = 1
    (0).upto(nums.length - 1) do |i|
        res[i] = prefix # forgot we don't multiply prefix here
        prefix *= nums[i]
    end
    
    # generate our postfix product but in the reverse direction
    postfix = 1
    (nums.length - 1).downto(0) do |i|
        res[i]  *= postfix # we do multiply it here 
        postfix *= nums[i]
    end

    res
end

# 560. Subarray Sum Equals K 
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarray_sum(nums, k)
    
end
