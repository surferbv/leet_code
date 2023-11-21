# 347. Top K Frequent Elements
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums=[1,1,1,2,2,3], k)
    count   = Hash.new(0)
    freq    = Array.new(nums.length+1) {[]} # since we can only hold k + 1 occurances
    res     = []

    nums.each do |n|
        count[n] += 1
    end

    count.each do |n, c| # n is the number in the array nums and c is the count or occurance of that num
        freq[c].append(n)
    end


    (nums.length).downto(0) do |i| # messed up here it's not nums.length - 1 
        freq[i].each do |n|
            res.append(n)
            return res if res.length == k
        end
    end
end

# 347. Top K Frequent Elements
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums=[1,1,1,2,2,3], k)
    freq_hash = Hash.new(0)
    res = []

    nums.each do |n|
        freq_hash[n] += 1
    end

    freq_hash.keys.each do |key| 
        res.append(key) if freq_hash[key] >= k
    end

    res = freq_hash.sort_by {|key, value| value}.reverse

    res.map{|key, value| key if value >= k}.compact
end
