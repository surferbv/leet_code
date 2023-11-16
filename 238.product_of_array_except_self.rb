# appraoch: brute force
#
# time: O(n^2)
#
# space: O(1) since we don't consider the space used by the output array
#
# notes:
# Could not figure out the O(n) solution so 
# I went with the brute force approach
#
# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
    answer = []

    nums.each_with_index do |n, i|
        cur_prod = 1
    
        nums.each_with_index do |m, j|
            cur_prod *= m if i != j  
        end

        answer.append cur_prod
    end

    answer
end

# approach: prefix and postfix products
# time: O(n) 
#
# space: O(n)
#
# notes:
# After hearing the algorithm I was able to come up with the solution
# however, the solution is not optimal because of the space complexity
#
# technique:
# Is to realized that you can find the ith product by
# creating a prefix and postfix product array 
# while iterate through the nums array
# and then multiply the prefix[i-1] * postfix[i+1] 
# to get the ith product. Picture might be better than words.
#
# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums=[1,2,3,4])
    prefix  = [] 
    postfix = [] 

    cur_prod = 1
    nums.each do |n|
        cur_prod *= n
        prefix.append(cur_prod) 
    end

    cur_prod = 1
    nums.reverse.each do |n|
        cur_prod *= n
        postfix.unshift(cur_prod)
    end

    nums.each_with_index do |n, i|
        if i == 0
            nums[i] = postfix[i+1]
        elsif i == nums.length - 1
            nums[i] = prefix[i-1]  
        else
            nums[i] = prefix[i-1] * postfix[i+1] 
        end
    end

    nums
end

# approach: prefix and postfix products with constant space
#
# time: O(n)
#
# space: O(1) since we are not considering the space used by the output array
#
# notes:
# celver appraoch this was tricky because of the iteration and 
# how you need to think of the offset for the prefix and postfix
#
# technique:
# is to use the output array to first store the prefix products
# and then use the postfix products to update the output array 
# going in the reverse direction
#
# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums=[1,2,3,4])
    res = Array.new(1) {nums.length}

    prefix = 1
    (0).upto(nums.length - 1) do |i|
        res[i] = prefix
        prefix *= nums[i] 
    end

    postfix = 1
    (nums.length - 1).downto(0) do |i|
        res[i] *= postfix
        postfix *= nums[i]
    end

    res
end