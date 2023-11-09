# time: O(n^2)
# space: O(n) since we are using a list to store the max length of subsequence
# notes:
#       Copy could not solve this need to go over DP problems
# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
    list = [1] * nums.length

    (nums.length - 1).downto(0) do |i| 
        (i + 1).upto(nums.length - 1) do |j|
            if nums[i] < nums[j]
                list[i] = [list[i], list[j] + 1].max
            end
        end
    end

    list.max
end