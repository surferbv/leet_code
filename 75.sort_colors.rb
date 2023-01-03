=begin

    title:
        75. Sort Colors

    links:
        https://leetcode.com/problems/sort-colors/
        https://www.youtube.com/watch?v=4xbWSRZHqac

    approach:

    time:

    space:

    note:

    til:

    results:

=end
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
    l, r    = 0, nums.length - 1
    i       = 0
    
    while i <= r
        if nums[l] == 0
            swap(l, i, nums)
            l += 1
        elsif nums[r] == 2
            swap(i, r, nums)
            r -= 1
            i -= 1 # to account for edge case
        end
        i += 1 
    end

    def swap(i, j, nums)
        tmp = nums[i]
        nums[i] = nums[j]
        nums[j] = tmp
    end
end


# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
    result = []
    bucket = Hash.new(0)
    
    nums.each do |n|
        bucket[n] += 1
    end

    i = 0
    [0,1,2].each do |n|
        bucket[n].times do
            nums[i] << n
            i += 1
        end
    end
    
    return nums
end