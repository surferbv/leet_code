# approach: prefix sum
#
# time: O(1) for sum_range and O(n) for initialize
#
# space: O(n) where n is the number of elements in nums to store the prefix sum
#
# notes:
#   Goofed 
#   up on pre_left and pre_right did pre_left - pre_right instead of pre_right - pre_left
#   edge case when left is a 0 you set pre_left to 0
#
# techniques:
#   1. create a prefix sum array
#   2. if left is 0 then pre_left is 0 else pre_left is prefix_sum[left - 1]
#   3. pre_right is prefix_sum[right]
#   4. return pre_right - pre_left
#   That's it!
#   The trick is to prepopulate the prefix sum array
class NumArray

    def initialize(nums)
        @prefix_sum = []
        total = 0
        nums.each_with_index do |num, idx|
            total += num
            @prefix_sum.append(total)
        end
    end



    def sum_range(left, right)
        pre_right   = @prefix_sum[right]
        if left > 0 
            pre_left = @prefix_sum[left - 1]
        else
            pre_left = 0
        end

        pre_right - pre_left
    end

end

# Your NumArray object will be instantiated and called as such:
# obj = NumArray.new(nums)
# param_1 = obj.sum_range(left, right)