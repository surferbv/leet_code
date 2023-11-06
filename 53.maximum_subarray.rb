# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
    max_sub = nums[0]
    cur_sum = 0

    nums.each do |n|
        if cur_sum < 0
            cur_sum = 0
        end
        cur_sum += n
        max_sub = [max_sub, cur_sum].max
    end
    max_sub
end