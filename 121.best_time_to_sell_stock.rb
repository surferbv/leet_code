# approach: two pointers
# time: O(n) where n is the length of the array
# space: O(1) we are not using any extra space
# notes:
#       The take away here is to
#       1. two pointers left and right, left trails behind right
#       2. dynamic programming to keep track of the max profit for just the current day and move or two pointers distance
#       3. update the max profit if the current profit is greater than the max profit
#       4. And update left to the right because time only moves forward
# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    l = 0
    r = 1
    max_profit = 0

    while r < prices.length
        if prices[l] < prices[r]
            profit = prices[r] - prices[l]
            max_profit = [profit, max_profit].max
        else
            l = r
        end
        r += 1
    end

    max_profit
end