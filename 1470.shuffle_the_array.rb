#1470.shuffle_the_array
# @param {Integer[]} nums
# @param {Integer} n
# @return {Integer[]}
#
# create a new array
# 
# time: O(n) still have to go through every element in the array. 
#       In getting the first and second half it could make it worst 
#       since we have to copy nums into two new arrays. 
#
# space: O(n) yes we allocate three but O(n/2 + n/2 + n) = O(n) 
def shuffle(nums, n)
    first_half  = nums[0..n - 1]
    second_half = nums[n..-1]
    result      = []

    for i in (0..n - 1) do
        result.push(first_half[i])
        result.push(second_half[i])
    end

    result
end

# @param {Integer[]} nums
# @param {Integer} n
# @return {Integer[]}
#
# one line appraoch  
# 
# time: O(n) 
#
# space: O(n) but probably closer to O(1)
def shuffle(nums, n)
    nums[0..n - 1].zip(nums[n..-1]).flatten
end

# @param {Integer[]} nums
# @param {Integer} n
# @return {Integer[]}
#
# clever ruby way 
# 
# time: O(n) 
# space: O(n) 
def shuffle(nums, n)
    result = []

    n.times do |i|
        result << nums[i]
        result << nums[i+n]
    end

    result
end


# @param {Integer[]} nums
# @param {Integer} n
# @return {Integer[]}
#
# pointers allocating a fixed size array 
# 
# time:  
# space: 
def shuffle(nums, n)
    # TODO
end