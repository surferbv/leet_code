# 121.best_time_to_buy_and_sell_stock.rb
# @param {Integer[]} prices
# @return {Integer}
#
# iterative two pointer appraoch 
#
# time: O(n) since we have to iterate over the whole list.
#
# space: O(1) no additional memory allocated.
def max_profit(prices)
    max_p   = 0       
    buy     = 0  # buy or left pointer
    sell    = 1  # sell or right pointer

    while sell < prices.length

        if prices[buy] < prices[sell]
            max_p = [prices[sell] - prices[buy], max_p].max
        else
            buy = sell
        end
        sell += 1
    end

    return max_p
end

# brute force appraoch 
#
# time: O(n^2) for each n you must iterate n times. 
#
# space: O(1) no additional memory allocated.
def max_profit(prices)
    max_p   = 0       
    
    for i in (0..prices.length - 1) do
        for j in (i+1..prices.length - 1) do
            profit = prices[j] - prices[i] 
            max_p = profit if profit > max_p
        end
    end

    return max_p
end