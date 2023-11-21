# Practice set
#
# two_sums
# best_time_to_buy_and_sell
# contains_duplicates
# product_of_array_except_self

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    seen = Hash.new(0)  # k: number, value: index

    nums.each_with_index do |n, i|
        diff = target - n 
        return [seen[diff], i] if seen.key?(diff)
        seen[n] = i
    end
  
end

# @param {Integer[]} prices
# @return {Integer}
# sturgged on loop, and l and r
def max_profit(prices)
    cur_max_profit = 0
    l, r = 0, 1 # l: buy, r: sell

    (1..prices.length - 1).each do |r| 
        if prices[l] < prices[r]
            cur_profit = prices[r] - prices[l]
            cur_max_profit = [cur_max_profit, cur_profit ].max
        else
            l = r
        end
    end

    cur_max_profit
end

# @param {Integer[]} nums
# @return {Boolean}
require 'set'
def contains_duplicate(nums)
    seen_set = Set.new()

    nums.each do |n|
        return true if seen_set.include?(n)
        seen_set.add(n)
    end

   false 
end

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
    nums.uniq != nums
end

# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
    res = Array.new(nums.length){1} 

    prefix = 1
    nums.each_with_index do |n, i|
        res[i] = prefix
        prefix *= n
    end

    # res = [1, 1, 2, 6]
    postfix = 1
    nums.to_enum.with_index.reverse_each do |n, i|
        res[i] *= postfix
        postfix *= n
    end

    res
end