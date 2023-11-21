# 560. Subarray Sum Equals K 
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarray_sum(nums=[1,1,1,1], k)
    cur_sum = res = 0 
    prefix_sums = Hash.new(0)
    prefix_sums[0] = 1 # don't understand this part

    nums.each do |n|
        cur_sum += n 
        diff = cur_sum - k # I think this was the hint sum(i,j)
        res += prefix_sums[diff]
        prefix_sums[cur_sum] = 1 + prefix_sums[cur_sum]
    end

    res
end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarray_sum(nums, k)
    cur_prefix_sum = 0
    res = 0
    prefix_seen = Hash.new(0)
    prefix_seen[0] = 1

    
    nums.each do |n|
        cur_prefix_sum += n
        diff = cur_prefix_sum - k

        # why don't you check if the key exists first before doing this operations? 
        res += prefix_seen[diff] # why diff?

        # if the cur_prefix_sum exits we update it if not we create one and add one indicating we've seen it
        prefix_seen[cur_prefix_sum] = 1 + prefix_seen[cur_prefix_sum]
    end

   res 
end