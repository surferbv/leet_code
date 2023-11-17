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